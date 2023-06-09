local M = {}

function M.enterInsertMode()
    vim.defer_fn(function()
        vim.api.nvim_command("startinsert")
    end, 0)
end

function M.startInsertBeforeWord()
    local current_word = vim.fn.expand("<cword>") -- Get the current word under the cursor
    local line = vim.api.nvim_get_current_line() -- Get the current line
    local col = vim.fn.col('.') -- Get the current column position

    local before_word = line:sub(1, col - 1):match("%w+$") or ""
    local after_word = line:sub(col):match("^%w+") or ""
    local after_char = line:sub(col, col)

    if after_word == "" and after_char == "" then
        -- Cursor is in whitespace
    elseif before_word == "" and after_word ~= "" and after_char ~= "" then
        -- Cursor is at the beginning of a word 
        vim.cmd([[normal! i ]])
    else
        vim.cmd([[normal! bi ]])
    end

    M.enterInsertMode()
end

function M.startAppendAfterWord()
    local current_word = vim.fn.expand("<cword>") -- Get the current word under the cursor
    local line = vim.api.nvim_get_current_line() -- Get the current line
    local col = vim.fn.col('.') -- Get the current column position

    local before_word = line:sub(1, col - 1):match("%w+$") or ""
    local after_word = line:sub(col):match("^%w+") or ""
    local after_char = line:sub(col, col)

    if after_word == "" and after_char == "" then
        -- Cursor is in whitespace
    elseif after_word == after_char or after_word == "" and after_char ~= "" then
        -- Cursor is at the end of a word
        vim.cmd([[normal! a ]])
        vim.cmd([[normal! l]])
    else
        vim.cmd([[normal! ea ]])
        vim.cmd([[normal! l]])
    end

    M.enterInsertMode()
end

function M.pasteBeforeWord()
    local current_word = vim.fn.expand("<cword>") -- Get the current word under the cursor
    local line = vim.api.nvim_get_current_line() -- Get the current line
    local col = vim.fn.col('.') -- Get the current column position

    local before_word = line:sub(1, col - 1):match("%w+$") or ""
    local after_word = line:sub(col):match("^%w+") or ""
    local after_char = line:sub(col, col)

    if after_word == "" and after_char == "" then
        -- Cursor is in whitespace
        vim.cmd([[normal! P]])
    elseif before_word == "" and after_word ~= "" and after_char ~= "" then
        -- Cursor is at the beginning of a word 
        vim.cmd([[normal! i ]])
        vim.cmd([[normal! P]])
    else
        vim.cmd([[normal! bi ]])
        vim.cmd([[normal! P]])
    end
end

function M.pasteBeforeN()
    local count = tonumber(vim.v.count)
    count = math.max(count, 1)
    for _ = 1, count do
        M.pasteBeforeWord()
    end
end

function M.pasteAfterWord()
    local current_word = vim.fn.expand("<cword>") -- Get the current word under the cursor
    local line = vim.api.nvim_get_current_line() -- Get the current line
    local col = vim.fn.col('.') -- Get the current column position

    local before_word = line:sub(1, col - 1):match("%w+$") or ""
    local after_word = line:sub(col):match("^%w+") or ""
    local after_char = line:sub(col, col)

    if after_word == "" and after_char == "" then
        -- Cursor is in whitespace
        vim.cmd([[normal! i]])
        vim.cmd([[normal! p]])
    elseif after_word == after_char or after_word == "" and after_char ~= "" then
        -- Cursor is at the end of a word 
        vim.cmd([[normal! a ]])
        vim.cmd([[normal! p]])
    else
        vim.cmd([[normal! ea ]])
        vim.cmd([[normal! p]])
    end
end

function M.pasteAfterN()
    local count = tonumber(vim.v.count)
    count = math.max(count, 1)
    for _ = 1, count do
        M.pasteAfterWord()
    end
end

return M
