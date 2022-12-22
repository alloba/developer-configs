if unpack == nil then unpack = table.unpack end

local function starts_with(str, start)
    return str:sub(1, #start) == start
end

local function find_startswith_in_array(term, arr)
    for i, line in ipairs(arr) do
        if starts_with(line, term) then
            return i
        end
    end
    return -1
end

local function trim_array(start_index, end_index, arr)
    local new_arr = {}
    for i, line in ipairs(arr) do
        if i >= start_index and i <= end_index then
            table.insert(new_arr, line)
        end
    end
    return new_arr
end

local function print_array(arr)
    for i, line in ipairs(arr) do
        print(i .. ':' .. line)
    end
end

local function cycle_planner()
    -- on the current buffer,
    -- find the lines that make up the current day's events
    -- copy it all down to the archive section
    -- recreate the lines, removing the items marked as completed
    -- put the new day's todo list at the top of the file.

    -- get buffer 0 (current), from start to finish, ignore oob errors.
    -- WARNING: lua indexes arrays starting at 1, not 0.
    local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)


    local HABITUAL_MARKER = '## Habitual'
    local TODO_MARKER = '## To Do'
    local SUBSECTION_END_MARKER = '#' -- heavily assuming that i will never change the format of these things to have subsections inside of them.
    local DATE_SEPARATOR = '->'
    local ARCHIVE_MARKER = '# Archive'

    local startindex_habitual = -1
    local endindex_habitual = -1
    local startindex_todo = -1
    local endindex_todo = -1

    local startindex_archive = -1

    startindex_habitual = find_startswith_in_array(HABITUAL_MARKER, content)
    startindex_todo = find_startswith_in_array(TODO_MARKER, content)
    startindex_archive = find_startswith_in_array(ARCHIVE_MARKER, content)

    local habitual_slice = trim_array(startindex_habitual, #content, content)
    local todo_slice = trim_array(startindex_todo, #content, content)

    endindex_habitual = find_startswith_in_array(SUBSECTION_END_MARKER, trim_array(2, #habitual_slice, habitual_slice))
    endindex_todo = find_startswith_in_array(SUBSECTION_END_MARKER, trim_array(2, #todo_slice, todo_slice))

    -- validate all indexes make sense. if something is wrong then dont change anything.
    if startindex_habitual == -1 then print('could not find habitual startindex') return end
    if startindex_todo == -1 then print('could not find todo startindex') return end

    if endindex_habitual == -1 then print('could not find habitual endindex') return end
    if endindex_todo == -1 then print('could not find todo startindex') return end
    if startindex_archive == -1 then print('could not find archive startindex') return end



    --TODO get current date
    --TODO create new top line items
    --TODO insert new top line items (from previous step)
    --TODO shift everything down to archive


end

--vim.api.nvim_create_user_command('Speet', cycle_planner, { nargs = 0, desc = "Speet Description Here." })
--cycle_planner()


--[[
# Schedule

## Habitual -> 2022-12-20

- [ ] Teeth Morning
- [ ] Excercise
- [X] Job Application -- Spotify
- [ ] Personal Project Work
- [X] 1600 Calories
- [X] Teeth Night

## To Do -> 2022-12-20

- [X] laundry
- [X] wrap christmas presents
- [X] charge stuff
- [X] buy road snacks
- [X] pack

- [ ] Pick a book to read to share with Mom
  - Dune
  - Neuromancer
  - The Water Knife
  - Three Body Problem
  - Ocean at the End of the Lane
- [ ] holidays
- [ ] reschedule dentist appt

## Backburner

### Keyboard

I'm waiting on the base to ship.
Whenever that is.

| Part              | Purchase           | Received | Link                                                                                                |
| ----------------- | ------------------ | -------- | --------------------------------------------------------------------------------------------------- |
| Base              | Yes $230           | No       | [Link](https://kbdfans.com/products/fully-assembled-tofu65-dz65rgb-v3-hot-swap-mechanical-keyboard) |
| Switches (2 sets) | Yes $40 +shipping  | Yes      | [Link](https://en.akkogear.com/product/akko-cs-lavender-purple-switch-45pcs/)                       |
| Stabilizers       | No                 | No       | [Link](https://www.amazon.com/DUROCK-Stabilizers-Translucent-Keyboard-Mechanical/dp/B0B2RVN19F)     |
| Caps              | Yes $35 + shipping | Yes      | [Link](https://drop.com/buy/gks-xda-v2-dye-subbed-pbt-matcha-keycap-set)                            |

## Excercise Schedule

Starting very simple.

[This chart](https://www.nerdfitness.com/blog/beginner-body-weight-workout-burn-fat-build-muscle/)
every other day or so.

# Archive

--]]
