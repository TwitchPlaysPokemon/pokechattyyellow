import numpy as np
import re, subprocess, os, time
from threading import Timer

PUNCTUATION = (".", "?", "!")
PUNCTUATION_PROBS = (0.7, 0.25, 0.05)

class RWMC(dict):
    def __init__(self, filename = None, timeout = 216000, emote_regex = re.compile("$"), min_len = 50000, commands_regex = re.compile("$")):
        self.timeout = timeout
        self.filename = filename
        self.emote_regex = emote_regex
        self.commands_regex = commands_regex
        self.min_len = min_len
        if timeout is not None:
            assert timeout >= 0
        if filename:
            assert os.path.exists(filename)
            logs = subprocess.Popen(["tail", "-n", "5000", filename], \
                stdout = subprocess.PIPE)
            for line in logs.stdout.readlines():
                if b"\t" not in line:
                    continue
                clean_line = line.decode().split("\t")[1]
                self.train_line(clean_line)
        if self.timeout:
            T = Timer(self.timeout, self.check_line_expire)
            T.start()

    def __len__(self):
        return sum([len(x) for x in self.values()])

    def train_line(self, line):
        # remove Kappa and friends
        clean_line = self.emote_regex.sub("", line).strip()
        # collapse spaces
        clean_line = re.sub(" {2,}", " ", clean_line)
        # don't process an empty line
        if len(clean_line) == 0:
            return
        # don't process a TPP command
        if clean_line.startswith("!") or self.commands_regex.match(clean_line):
            return
        # append random punctuation if needed
        if clean_line[-1] not in PUNCTUATION:
            clean_line += np.random.choice(PUNCTUATION, p = PUNCTUATION_PROBS)
        # process the line into the dictionary of triples
        words = ["", ""] + clean_line.split() + ["", ""]
        # words will expire over time if timeout is nonzero
        now = time.time()
        for i in range(len(words) - 2):
            cur_key = (words[i], words[i + 1])
            if cur_key in self:
                self[cur_key].append((words[i + 2], now))
            else:
                self[cur_key] = [(words[i + 2], now)]

    def check_line_expire(self):
        if len(self.keys()) > 0 and len(self) > self.min_len:
            for key, value in self.items():
                self[key] = [x for x in value if x[1] + self.timeout < now]
        T = Timer(min(self.timeout, 3600), self.check_line_expire)
        T.start()
    
    def test_key(self, key):
        try:
            return len(self[key])
        except KeyError:
            return False

    def build_chain(self, min_len = 200, max_len = 400):
        # Sentence start and end state is two empty strings
        construction = ["", ""]
        cur_key = ("", "")
        chain = ""
        # unit test
        assert len(self) > 0, "Nothing to build"
        assert cur_key in self, "Unable to start chain"
        # Iterate until you have a long-enough sentence.
        while True:
            if self.test_key(cur_key): # Continue the current sentence.
                # np.random.choice errors on a list of tuples
                idx = np.random.choice(len(self[cur_key]))
                construction.append(self[cur_key][idx][0])
            else: # Reseed the current sentence.
                construction = ["", ""]
                if cur_key in self:
                    self.pop(cur_key)
            cur_key = (construction[-2], construction[-1])
            if cur_key == ("", "") and len(construction) > 2:
                sentence = " ".join(construction).strip()
                # print(sentence)
                if len(chain + " " + sentence) <= max_len:
                    chain += " " + sentence
                    chain = chain.strip()
                if len(chain) > min_len:
                    return chain
                construction = ["", ""]
