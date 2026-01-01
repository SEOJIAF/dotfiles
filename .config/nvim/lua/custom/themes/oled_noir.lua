-- Ultra-dark "OLED Noir" theme for NvChad/base46

local M = {}

-- These two keys are required by some base46 versions
M.type = "dark"
M.theme_name = "oled_noir"

M.base_30 = {
  white = "#cdd6f4",
  darker_black = "#000000",
  black = "#000000",
  black2 = "#05070a",
  one_bg = "#070a10",
  one_bg2 = "#0b0f18",
  one_bg3 = "#101827",

  grey = "#2a3140",
  grey_fg = "#3a4256",
  grey_fg2 = "#4a5470",
  light_grey = "#58627d",

  red = "#ff5c7a",
  baby_pink = "#ff7aa2",
  pink = "#ff4fd8",

  green = "#4dffb5",
  vibrant_green = "#2dff9b",

  blue = "#5aa7ff",
  nord_blue = "#7aa2ff",
  yellow = "#ffd866",
  sun = "#ffe08a",
  purple = "#b18cff",
  dark_purple = "#8f6bff",

  teal = "#2ee9ff",
  orange = "#ff9f5e",
  cyan = "#56dfff",

  statusline_bg = "#05070a",
  lightbg = "#0b0f18",
  pmenu_bg = "#7aa2ff",
  folder_bg = "#7aa2ff",
  line = "#0b0f18",
}

M.base_16 = {
  base00 = "#000000",
  base01 = "#05070a",
  base02 = "#0b0f18",
  base03 = "#2a3140",
  base04 = "#3a4256",
  base05 = "#cdd6f4",
  base06 = "#e6e9ff",
  base07 = "#ffffff",

  base08 = "#ff5c7a",
  base09 = "#ff9f5e",
  base0A = "#ffd866",
  base0B = "#4dffb5",
  base0C = "#2ee9ff",
  base0D = "#7aa2ff",
  base0E = "#b18cff",
  base0F = "#ff7aa2",
}

M.polish_hl = {
  defaults = {
    CursorLine = { bg = "#05070a" },
    Visual = { bg = "#101827" },
    Search = { bg = "#2a3140", fg = "#ffffff" },
    IncSearch = { bg = "#7aa2ff", fg = "#000000" },
  },
}

return M
