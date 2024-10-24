local keymap = vim.keymap

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      {
        "j-hui/fidget.nvim", opts = {},
      },
      {
        "folke/neodev.nvim", opts = {},
      },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("nvim-lsp-attach", {clear = true}),
        callback = function(event)

          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            keymap.set(mode, keys, func, {buffer = event.buf, desc = "LSP: " .. desc})
          end

          map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
          map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
          map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementations")
          map("<leader>", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
          map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
          map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
        end
      })
    end
  },
}
