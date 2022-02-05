-- Utils functions
local function iconcat(t1, t2)
	for n = 1, #t2 do
		t1[#t1 + 1] = t2[n]
	end
	return t1
end

local function concat(t1, t2)
	for k, v in pairs(t2) do
		t1[k] = v
	end
	return t1
end

local function keymap(...)
	vim.api.nvim_set_keymap(...)
end

local function printt(t)
	for k, v in pairs(t) do
		print(k, v)
	end
end

return { iconcat = iconcat, concat = concat, keymap = keymap, printt = printt }
