return {
    -- exists = function(self, file)
    --     local ok, err, code = os.rename(file, file)
    --     if not ok then
    --     if code == 13 then
    --         return true
    --     end
    --     end
    --     return ok, err
    -- end,

    -- isDir = function(self, path)
    --     return #self:readDir(path) > 0
    -- end,

    readDir = function(self, directory)
        return SMODS.NFS.getDirectoryItemsInfo(directory)
    end
}