--e Only including the descriptions of existing mappings for now. Will set all mappings here in future
local wk = require("which-key")
wk.register({
    p = {
        name = "personal", -- group name
        v = { "Open netrw" }, -- only a description, no mapping
        f = { "Find File" },
        s = { "Search Files" }
    },
}, { prefix = "<leader>" })

