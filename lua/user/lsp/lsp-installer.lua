local status_ok, mason_lsp_installer = pcall(require, "mason-lspconfig")
if status_ok then
    mason_lsp_installer.setup()
end
if not status_ok then
  return 
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return 
end

-- the above is enough, but if you want to replicate the "on_server_ready" behaviour
-- where your installed servers are setup "automatically" you can do the following
mason_lsp_installer.setup_handlers {
    -- default handler - setup with default settings
    function (server_name)
        lspconfig[server_name].setup { on_attach = require("user.lsp.handlers").on_attach, capabilities = require("user.lsp.handlers").capabilities}
    end,

   -- Example of an override per LSP
   --["jdtls"] = function ()
   --  ["jdtls"].setup {opts, } 
   -- end
}

