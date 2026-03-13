Retcon = {
    utils = assert(SMODS.load_file("loaderUtils.lua"))(),

    loadDir = function(workingDir, path)
        local files = Retcon.utils:readDir(workingDir .. path)
        for idx, file in ipairs(files) do
            -- if Retcon.utils:isDir(workingDir .. path .. file) then
            if string.sub(file, -4) == ".lua" then
                Retcon.loadDir(workingDir, path .. file .. "/")
            else
                assert(SMODS.load_file(path .. file))()
            end
        end
    end,

    load = function(path)
        if SMODS.current_mod then
            Retcon.loadDir(SMODS.current_mod.path, path)
            print("Retcon: Loaded mod " .. SMODS.current_mod.name .. "!")
        else
            print("Retcon: No mod currently loading!")
        end
    end
}

SMODS.Atlas({
    key = "modicon",
    path = "icon.png",
    px = 64,
    py = 64
})

print("Retcon Loaded!")