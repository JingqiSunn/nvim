-- lua/core/copyright.lua
local M = {}

function M.add_copyright()
    local year = os.date("%Y")
    local name = "JingqiSUN"  -- or hardcode your name
    local company = "Southern University of Science and Technology"  -- optional
    
    -- Get comment string for current filetype
    local comment_str = vim.bo.commentstring or "# %s"
    comment_str = comment_str:gsub("%%s", ""):gsub(" ", "")
    
    -- Format notice based on filetype
    local notice = {}
    local filetype = vim.bo.filetype
    
    -- Common notice lines
    local lines = {
        "Copyright (c) " .. year .. " " .. name .. "." .. (company ~= "" and company or ""),
        "All rights reserved.",
        ""
    }
    
    -- Add comment characters
    for _, line in ipairs(lines) do
        if line ~= "" then
            table.insert(notice, comment_str .. " " .. line)
        else
            table.insert(notice, "")
        end
    end
    
    -- Insert at top of file
    vim.api.nvim_buf_set_lines(0, 0, 0, false, notice)
end

return M
