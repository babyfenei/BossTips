-- Lupa syntax check for BossTips Lua files
-- Run: python check_lua_syntax.py
local function check()
    local ok, err
    local files = {'Core.lua', 'Data.lua', 'Window.lua', 'Settings.lua', 'Editor.lua', 'Locales.lua'}
    for _, fn in ipairs(files) do
        ok, err = loadfile(fn)
        if not ok then
            print("FAIL " .. fn .. ": " .. tostring(err))
        else
            print("OK " .. fn)
        end
    end
end
return check
