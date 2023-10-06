local cfg = require("yaml-companion").setup({
 schemas = {
    {
      name = "Nais",
      uri = "https://storage.googleapis.com/nais-json-schema-2c91/nais-k8s-all.json",
    },
  },
  -- Add any options here, or leave empty to use the default settings
  -- lspconfig = {
  --   cmd = {"yaml-language-server"}
  -- },
})
