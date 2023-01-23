local override = require "custom.plugins.configs.override"
local M = {}

M.ensure_installed = override.mason.ensure_installed

return M
