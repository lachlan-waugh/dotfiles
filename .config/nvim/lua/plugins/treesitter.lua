return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "apple/pkl-neovim",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      -- 1. Define the languages you want
      local ensure_installed = {
        "lua", "vim", "vimdoc", "python",
        "go", "rust", "svelte", "typescript",
        "tsx", "html", "css", "markdown"
      }

      -- 2. Check which ones are missing and install them
      local to_install = {}
      for _, lang in ipairs(ensure_installed) do
        -- vim.treesitter.language.add returns true if the parser is found
        if not pcall(vim.treesitter.language.add, lang) then
          table.insert(to_install, lang)
        end
      end

      if #to_install > 0 then
        require("nvim-treesitter").install(to_install)
      end

      -- 3. Automatically enable highlighting and indentation when opening a file
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function(args)
          -- Safely attempt to start Treesitter native highlighting
          pcall(vim.treesitter.start, args.buf)

          -- Enable Treesitter-based indentation
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      -- 4. Setup autotag (Main branch no longer manages 3rd party modules)
      require("nvim-ts-autotag").setup()
    end,
  },
}
