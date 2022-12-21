


local function cycle_planner()
    -- on the current buffer,
    -- find the lines that make up the current day's events
    -- copy it all down to the archive section 
    -- recreate the lines, removing the items marked as completed
    -- put the new day's todo list at the top of the file. 
end

print('TODO - Planner Function')
vim.api.nvim_create_user_command('Speet', cycle_planner, { nargs = 0, desc = "Speet Description Here." })
