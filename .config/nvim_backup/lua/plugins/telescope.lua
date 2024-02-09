Util = require("lazyvim.util")
return {
  "nvim-telescope/telescope.nvim",
  commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  keys = {
    -- find
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
    { "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
    -- git
    { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
    { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
    -- search
    { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
    { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
    { "<leader>fg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
    { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    {
      "<leader>ss",
      Util.telescope("lsp_document_symbols", {
        symbols = {
          "Class",
          "Function",
          "Method",
          "Constructor",
          "Interface",
          "Module",
          "Struct",
          "Trait",
          "Field",
          "Property",
        },
      }),
      desc = "Goto Symbol",
    },
    {
      "<leader>sS",
      Util.telescope("lsp_dynamic_workspace_symbols", {
        symbols = {
          "Class",
          "Function",
          "Method",
          "Constructor",
          "Interface",
          "Module",
          "Struct",
          "Trait",
          "Field",
          "Property",
        },
      }),
      desc = "Goto Symbol (Workspace)",
    },
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        i = {
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<a-t>"] = function(...)
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
          end,
          ["<a-i>"] = function()
            local action_state = require("telescope.actions.state")
            local line = action_state.get_current_line()
            Util.telescope("find_files", { no_ignore = true, default_text = line })()
          end,
          ["<a-h>"] = function()
            local action_state = require("telescope.actions.state")
            local line = action_state.get_current_line()
            Util.telescope("find_files", { hidden = true, default_text = line })()
          end,
          ["<C-Down>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-Up>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
        },
        n = {
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      },
    },
  },
}
