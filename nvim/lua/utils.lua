-- Utils functions
local function concat(t1, t2)
	for n = 1, #t2 do
		t1[#t1 + 1] = t2[n]
	end
	return t1
end

local function keymap(...)
	vim.api.nvim_set_keymap(...)
end

return { concat = concat, keymap = keymap }
