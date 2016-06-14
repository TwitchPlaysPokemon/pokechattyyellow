JSON = (loadfile "JSON.lua")()
local http = require("socket.http")
http.TIMEOUT = 0.01
base_url = "http://127.0.0.1:5000"
stream_input_url = base_url.."/gbmode_inputs"
local markov_chain = {}

LUA_REQUEST_CHATOT = 0
LUA_REQUEST_NPC    = 1

LUA_REQUEST_COMPLETE  = 0
LUA_REQUEST_CHAIN     = 1
LUA_REQUEST_NEXT_CHAR = 2


charmap = {[0x4A] = "<pkmn>", [0x50] = "@", [0x52] = "<PLAYER>", [0x53] = "<RIVAL>", ;[0x54] = "POKé", [0x59] = "<TARGET>", [0x5A] = "<USER>", [0x71] = "′", [0x73] = "″", [0x75] = "…", , [0x79] = "┌", [0x7A] = "─", [0x7B] = "┐", [0x7C] = "│", [0x7D] = "└", [0x7E] = "┘", , [0x74] = "№", , [0x7F] = " ", [0x80] = "A", [0x81] = "B", [0x82] = "C", [0x83] = "D", [0x84] = "E", [0x85] = "F", [0x86] = "G", [0x87] = "H", [0x88] = "I", [0x89] = "J", [0x8A] = "K", [0x8B] = "L", [0x8C] = "M", [0x8D] = "N", [0x8E] = "O", [0x8F] = "P", [0x90] = "Q", [0x91] = "R", [0x92] = "S", [0x93] = "T", [0x94] = "U", [0x95] = "V", [0x96] = "W", [0x97] = "X", [0x98] = "Y", [0x99] = "Z", [0x9A] = "(", [0x9B] = ")", [0x9C] = ":", [0x9D] = ";", [0x9E] = "[", [0x9F] = "]", [0xA0] = "a", [0xA1] = "b", [0xA2] = "c", [0xA3] = "d", [0xA4] = "e", [0xA5] = "f", [0xA6] = "g", [0xA7] = "h", [0xA8] = "i", [0xA9] = "j", [0xAA] = "k", [0xAB] = "l", [0xAC] = "m", [0xAD] = "n", [0xAE] = "o", [0xAF] = "p", [0xB0] = "q", [0xB1] = "r", [0xB2] = "s", [0xB3] = "t", [0xB4] = "u", [0xB5] = "v", [0xB6] = "w", [0xB7] = "x", [0xB8] = "y", [0xB9] = "z", [0xBA] = "é", [0xBB] = "'d", [0xBC] = "'l", [0xBD] = "'s", [0xBE] = "'t", [0xBF] = "'v", [0xE0] = "'", [0xE3] = "-", [0xE4] = "'r", [0xE5] = "'m", [0xE6] = "?", [0xE7] = "!", [0xE8] = ".", [0xEC] = "▷", [0xED] = "▶", [0xEF] = "♂", [0xF0] = "¥", [0xF1] = "×", [0xF3] = "/", [0xF4] = ",", [0xF5] = "♀", [0xF6] = "0", [0xF7] = "1", [0xF8] = "2", [0xF9] = "3", [0xFA] = "4", [0xFB] = "5", [0xFC] = "6", [0xFD] = "7", [0xFE] = "8", [0xFF] = "9"}

hLSB           = 0xFFF0
hLSC           = 0xFFF1
hBattleTurn    = 0xFFF3
hMarkovChain   = 0xFFF6
wEnemyMonNick  = 0xCFD9
wBattleMonNick = 0xD008
wPlayerName    = 0xD157
wRivalName     = 0xD349

function get_stream_input(url)
	b, c, h = http.request(url)
	-- vba.print(b, c, h)
	if c == 200 then
		local json = JSON:decode(b)
		-- vba.print(json)
		joypad.set(1, json)
	end
	emu.frameadvance()
	-- vba.print(joypad.get(1))
end

function get_mon_name(battle_turn)
	if battle_turn == 1 then
		return "Enemy "..read_string_at(wEnemyMonNick)
	else
		return read_string_at(wBattleMonNick)
	end
end

function read_string_at(pointer)
	output = ""
	while true do
		cur_char = charmap[memory.readbyte(pointer)]
		pointer = pointer + 1
		if cur_char == nil then
			break
		elseif cur_char == "@" then
			break
		elseif cur_char == "<PLAYER>" then
			output = output..read_string_at(wPlayerName)
		elseif cur_char == "<RIVAL>" then
			output = output..read_string_at(wRivalName)
		elseif cur_char == "<TARGET>" then
			battle_turn = bit.xor(memory.readbyte(hBattleTurn), 1)
			output = output..get_mon_name(battle_turn)
		elseif cur_char == "<USER>" then
			battle_turn = memory.readbyte(hBattleTurn)
			output = output..get_mon_name(battle_turn)
		else
			output = output..cur_char
		end
	end
	return output
end

function read_raw_bytes_at(pointer)
	output = {}
	while true do
		cur_byte = memory.readbyte(pointer)
		cur_char = charmap[cur_byte]
		if cur_byte == 0x50 then
			break
		elseif cur_char == nil then
			break
		else
			table.insert(output, cur_byte)
		end
	end
	return output
end

function read_npc_text()
	pointer = memory.readword(hMarkovChain)
	-- ROM is already in correct bank
	-- return read_string_at(pointer)
	return read_raw_bytes_at(pointer)
end

function get_pikachu_chain()
	return {0x94, 0xa7, 0xa8, 0xb3, 0x7f, 0xa8, 0xb3, 0x7f, 0xa0, 0x7f, 0xb4, 0xa4, 0xb3, 0xb4, 0xe8}
	-- return "This is a test."
end

while true do
	-- Pokemon Yellow is forced to remain in WRAM bank 1 because the stack is in the bankable space.
	-- Therefore, there's no need to check rSVBK.
	lua_ctrl = memory.readbyte(hLSC)
	if lua_ctrl == LUA_REQUEST_CHAIN then
		which_chain = memory.readbyte(hLSB)
		if which_chain == LUA_REQUEST_NPC then
			markov_chain = read_npc_text()
		else
			markov_chain = get_pikachu_chain()
		end
		memory.writebyte(hLSC, LUA_REQUEST_COMPLETE)
	elseif lua_ctrl == LUA_REQUEST_NEXT_CHAR then
		if markov_chain[1] == nil then
			memory.writebyte(hLSB, 0x57)
		else
			memory.writebyte(hLSB, markov_chain[1])
			table.remove(markov_chain, 1)
		end
		memory.writebyte(hLSC, LUA_REQUEST_COMPLETE)
	end
	get_stream_input(stream_input_url)
end
