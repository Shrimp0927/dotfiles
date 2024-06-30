local wezterm = require("wezterm")

local M = {}

function M.update_config(config)
  config.font = wezterm.font_with_fallback {
    { family = "Iosevka Term", stretch = "Expanded", style = "Normal", weight = "Regular" },
  }
  config.font_size = 13.0
end

return M
