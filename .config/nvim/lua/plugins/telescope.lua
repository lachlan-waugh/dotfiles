return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",

    -- 1. We replace `init` with `keys`.
    -- Lazy will automatically map these keys and ONLY load Telescope when you press them.
    keys = {
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffer" },
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find File" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find with Grep" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find Help" },
      -- Fixed a typo here in your path string (%:p:h instead of %:p:help)
      { "<leader>fn", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "File Browser" },
    },

    opts = function()
      return {
        defaults = {
          vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          -- 2. Removed the manual previewer `requires`.
          -- Telescope defaults to these exact previewers automatically,
          -- and calling `require` inside opts can sometimes trigger loading loops.
        },
        extensions = {
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
          },
        },
        extensions_list = {
          "file_browser",
        },
      }
    end,

    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
}
