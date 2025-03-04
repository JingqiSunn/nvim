require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
    "jdtls",
    "pyright",
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}

require("lspconfig").jdtls.setup({
  capabilities = capabilities,
  settings = {
    java = {
      configuration = {
        jdkHome = "/nix/store/xqpp39hasmly9g1d3i0f8zb54sxgwahq-zulu-ca-jdk-17.0.12/zulu-17.jdk/Contents/Home",  -- Change this to your JDK 17 path
        maven = {
          enabled = true,  -- Enable Maven support
        },
      },
    },
  },
})

require("lspconfig").pyright.setup({
  capabilities = capabilities,
  settings = {
    python = {
      pythonPath = "/opt/homebrew/bin/python3",  -- Specify your Python path, especially if you're using a virtualenv
    },
  },
})
