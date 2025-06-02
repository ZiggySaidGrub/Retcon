return {
    exists = function(self, file)
        local ok, err, code = os.rename(file, file)
        if not ok then
        if code == 13 then
            return true
        end
        end
        return ok, err
    end,

    isDir = function(self, path)
        return self:exists(path.."/")
    end,

    readDir = function(self, directory)
        local command
        if love.system.getOS() == "Windows" then
            command = "dir \"" .. directory .. "\" /b"
        else
            command = "ls -pa " .. directory
        end

        local file = io.popen(command)
        local files = {}
        if file then
        for filename in file:lines() do
            table.insert(files, filename)
        end
        file:close()
        return files
        else
        return nil, "Error executing command"
        end
    end
}