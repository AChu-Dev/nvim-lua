local status_ok, mason = pcall(require, "mason")
if status_ok then
    mason.setup()
end
if not status_ok then
  return 
end

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

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()


