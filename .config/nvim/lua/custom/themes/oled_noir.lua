vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "oled-noir"

local theme

local function link(to)
  return { link = to }
end

local function diag_undercurl(color)
  return { undercurl = true, sp = color }
end

---@diagnostic disable: undefined-global
if vim.o.background == "dark" then
  -- terminal colors
  vim.g.terminal_color_0 = "#000000"
  vim.g.terminal_color_1 = "#d2322d"
  vim.g.terminal_color_2 = "#6abf40"
  vim.g.terminal_color_3 = "#cd974b"
  vim.g.terminal_color_4 = "#217EBC"
  vim.g.terminal_color_5 = "#9B3596"
  vim.g.terminal_color_6 = "#178F79"
  vim.g.terminal_color_7 = "#cecece"
  vim.g.terminal_color_8 = "#333333"
  vim.g.terminal_color_9 = "#c33c33"
  vim.g.terminal_color_10 = "#95cb82"
  vim.g.terminal_color_11 = "#dfdf8e"
  vim.g.terminal_color_12 = "#71aed7"
  vim.g.terminal_color_13 = "#cc8bc9"
  vim.g.terminal_color_14 = "#47BEA9"
  vim.g.terminal_color_15 = "#ffffff"

  -- colors
  local bg = "#0e1415"
  local fg = "#cecece"
  local punct_fg = "#708b8d"
  local def_fg = "#71ade7"
  local const_fg = "#cc8bc9"
  local active = "#cd974b"
  local string_fg = "#95cb82"
  local darker_fg = "#7d7d7d"
  local diffadd = "#6abf40"
  local diffdelete = "#d2322d"
  local diffchange = "#ec8013"
  local statusline = "#162022"
  local comment = "#dfdf8e"
  local dim_comment = "#696969"
  local mistake = {
    fg = "#c33c33",
    bg = "#2b1d1e",
  }
  local error = "#d13e23"
  local warn = "#f4b371"
  local hint = "#8ebeec"
  local info = "#88cc66"
  local ansi = {
    black = "#333333",
    blue = "#71aed7",
    brightyellow = "#dfdf8e",
    cyan = "#47bea9",
    green = "#95cb82",
    magenta = "#cc8bc9",
    red = "#c33c33",
    white = "#cecece",
    yellow = "#cd974b",
  }

  local comment_fg = vim.g.alabaster_dim_comments and dim_comment or comment
  local pmenu_bg = "#182325"
  local float_bg = vim.g.alabaster_floatborder and bg or pmenu_bg
  local floatborder = vim.g.alabaster_floatborder and { bg = bg, fg = "#333333" }
    or { bg = float_bg, fg = float_bg }

  theme = {
    -- Core UI
    Normal = { bg = bg, fg = fg },
    NormalNC = { bg = bg, fg = fg },
    EndOfBuffer = { fg = "#354c50" },
    NonText = { fg = "#696969" },
    SpecialKey = { fg = ansi.cyan },

    Cursor = { bg = active, fg = "#000000" },
    TermCursorNC = { fg = bg, bg = fg },

    ColorColumn = { bg = "#182325" },
    CursorColumn = { bg = "#182325" },
    CursorLine = { bg = "#182325" },
    CursorLineNr = { fg = ansi.blue, bold = true },
    LineNr = { fg = "#5c5c5c" },

    SignColumn = {},
    CursorLineSign = { bg = "#182325" },
    CursorLineFold = { bg = "#182325" },

    Directory = { fg = ansi.blue },

    -- Splits / separators (0.10 uses WinSeparator)
    VertSplit = { fg = "#2b3d40" },
    WinSeparator = { fg = "#2b3d40" },

    Folded = { bg = "#182325", fg = "#7d7d7d" },
    FoldColumn = { bg = bg, fg = "#4d4d4d" },

    MatchParen = { underline = true, sp = active },

    Pmenu = { bg = pmenu_bg },
    PmenuSel = { bg = "#354c50" },
    PmenuSbar = { bg = "#212f31" },
    PmenuThumb = { bg = "#47666b" },

    -- Optional newer completion menu groups
    PmenuKind = link("Pmenu"),
    PmenuKindSel = link("PmenuSel"),
    PmenuExtra = link("Pmenu"),
    PmenuExtraSel = link("PmenuSel"),

    NormalFloat = { bg = float_bg },
    FloatBorder = floatborder,

    StatusLine = { bg = statusline, fg = fg },
    StatusLineNC = { bg = statusline, fg = "#9f9f9f" },
    TabLine = { bg = statusline, fg = "#7d7d7d" },
    TabLineFill = { bg = statusline },
    TabLineSel = { bg = statusline, fg = ansi.blue },

    WinBar = { bg = bg, fg = ansi.white, bold = true },
    WinBarNC = { bg = bg, fg = "#7d7d7d" },

    Visual = { bg = "#293334" },
    VisualNOS = { bg = "#293334" },

    Search = { bg = "#354c50" },
    IncSearch = { bg = ansi.yellow, fg = bg },
    QuickFixLine = { bg = "#182325" },

    Title = { fg = const_fg },
    Question = { fg = diffadd },
    MoreMsg = { fg = ansi.green, bold = true },
    WarningMsg = { fg = "#e1ad4c" },
    ErrorMsg = { fg = error, bg = mistake.bg },

    Comment = { fg = comment_fg },
    Conceal = { fg = "#b0b0b0" },

    DiffAdd = { bg = "#244032", fg = "#56d364" },
    DiffDelete = { bg = "#462c32", fg = "#f85149" },
    DiffChange = { bg = "#341a00", fg = "#e3b341" },
    DiffText = { fg = "#341a00", bg = "#fff987" },

    SpellBad = { undercurl = true, sp = ansi.red },
    SpellCap = { undercurl = true, sp = ansi.blue },
    SpellLocal = { undercurl = true, sp = ansi.cyan },
    SpellRare = { undercurl = true, sp = ansi.magenta },

    Underlined = { underline = true },
    Italic = { italic = true },

    Error = { bg = mistake.bg, fg = mistake.fg },
    Todo = { bg = "#d0d058", fg = bg },

    -- Syntax base
    Constant = { fg = const_fg },
    String = { fg = string_fg },
    Character = { fg = const_fg },
    Number = { fg = const_fg },
    Boolean = { fg = const_fg },
    Float = { fg = const_fg },
    Operator = { fg = punct_fg },

    Identifier = { fg = ansi.white },
    Function = { fg = def_fg },
    Statement = { fg = ansi.white },
    Conditional = { fg = ansi.white },
    Repeat = { fg = ansi.white },
    Label = { fg = def_fg },
    Keyword = { fg = ansi.white },
    Exception = { fg = ansi.white },
    PreProc = { fg = ansi.white },
    Include = { fg = ansi.white },
    Define = { fg = ansi.white },
    Macro = { fg = ansi.white },
    PreCondit = { fg = ansi.white },
    Type = { fg = ansi.white },
    StorageClass = { fg = ansi.white },
    Structure = { fg = def_fg },
    Typedef = { fg = def_fg },

    Special = { fg = ansi.yellow },
    SpecialComment = { bg = "#1d292b", fg = ansi.blue },

    -- LSP references
    LspReferenceText = { bg = "#253437" },
    LspReferenceRead = { bg = "#253437" },
    LspReferenceWrite = { bg = "#253437", underline = true, sp = active },
    LspCodeLens = { fg = "#5c5c5c" },
    LspCodeLensSeparator = { fg = "#5c5c5c" },

    -- Diagnostics
    DiagnosticError = { fg = error },
    DiagnosticWarn = { fg = warn },
    DiagnosticHint = { fg = hint },
    DiagnosticInfo = { fg = info },

    DiagnosticVirtualTextError = { bg = "#350B0B", fg = "#D1503A" },
    DiagnosticVirtualTextWarn = { bg = "#3F240A", fg = "#C8935D" },
    DiagnosticVirtualTextHint = { bg = "#1D2B37", fg = "#7E9CB9" },
    DiagnosticVirtualTextInfo = { bg = "#162C0B", fg = "#7BAC62" },

    DiagnosticUnderlineError = diag_undercurl(error),
    DiagnosticUnderlineWarn = diag_undercurl(warn),
    DiagnosticUnderlineHint = diag_undercurl(hint),
    DiagnosticUnderlineInfo = diag_undercurl(info),

    -- Treesitter preferred @ groups (plus a few essentials)
    ["@punctuation.delimiter"] = { fg = punct_fg },
    ["@punctuation.bracket"] = { fg = "#bababa" },
    ["@punctuation.special"] = { fg = punct_fg },

    ["@string"] = { fg = string_fg },
    ["@string.regex"] = { bg = "#1d292b", fg = const_fg },
    ["@string.escape"] = { bg = "#1d292b", fg = const_fg },

    ["@constant.builtin"] = { fg = const_fg },
    ["@constant.macro"] = { fg = ansi.white },

    ["@function"] = { fg = def_fg },
    ["@function.builtin"] = { fg = def_fg },
    ["@function.macro"] = { fg = def_fg },
    ["@method"] = { fg = def_fg },

    ["@keyword"] = { fg = ansi.white },
    ["@keyword.function"] = { fg = ansi.white },
    ["@keyword.operator"] = { fg = punct_fg },

    ["@type"] = { fg = ansi.white },
    ["@type.builtin"] = { fg = ansi.white },

    ["@variable"] = { fg = ansi.white },
    ["@variable.builtin"] = { fg = ansi.white },

    ["@tag"] = { fg = ansi.white },
    ["@tag.delimiter"] = { fg = punct_fg },

    ["@text.note"] = { bg = "#1d292b", fg = ansi.blue },
    ["@text.warning"] = { bg = "#d0d058", fg = bg },

    -- Keep old TS groups for compatibility
    TSPunctDelimiter = { fg = punct_fg },
    TSPunctBracket = { fg = "#bababa" },
    TSPunctSpecial = { fg = punct_fg },
    TSString = { fg = string_fg },
    TSConstBuiltin = { fg = const_fg },
    TSConstructor = { fg = ansi.white },

    -- Semantic tokens: link so they don’t flatten colors
    ["@lsp.type.function"] = link("@function"),
    ["@lsp.type.method"] = link("@method"),
    ["@lsp.type.variable"] = link("@variable"),
    ["@lsp.type.keyword"] = link("@keyword"),
    ["@lsp.type.type"] = link("@type"),
    ["@lsp.type.class"] = link("@type"),
    ["@lsp.type.enum"] = link("@type"),
    ["@lsp.type.enumMember"] = link("@constant"),
  }
else
  -- terminal colors
  vim.g.terminal_color_0 = "#000000"
  vim.g.terminal_color_1 = "#aa3731"
  vim.g.terminal_color_2 = "#448c27"
  vim.g.terminal_color_3 = "#cb9000"
  vim.g.terminal_color_4 = "#325cc0"
  vim.g.terminal_color_5 = "#7a3e9d"
  vim.g.terminal_color_6 = "#0083b2"
  vim.g.terminal_color_7 = "#f7f7f7"
  vim.g.terminal_color_8 = "#777777"
  vim.g.terminal_color_9 = "#f05050"
  vim.g.terminal_color_10 = "#60cb00"
  vim.g.terminal_color_11 = "#ffbc5d"
  vim.g.terminal_color_12 = "#007acc"
  vim.g.terminal_color_13 = "#e64ce6"
  vim.g.terminal_color_14 = "#00aacb"
  vim.g.terminal_color_15 = "#f7f7f7"

  -- colors
  local bg = "#f7f7f7"
  local fg = "#000000"
  local punct_fg = "#777777"
  local def_fg = "#325cc0"
  local const_fg = "#7a3e9d"
  local active = "#ffbc5d"
  local active_blue = "#007acc"
  local string_fg = "#448c27"
  local diffadd = "#284918"
  local diffdelete = "#B40600"
  local statusline = "#c9c9c9"
  local comment = "#aa3731"
  local dim_comment = "#696969"
  local mistake = {
    fg = "#c33c33",
    bg = "#f8b28f",
  }
  local ansi = {
    black = "#000000",
    blue = "#325cc0",
    brightyellow = "#ffbc5d",
    cyan = "#0083b2",
    green = "#448c27",
    magenta = "#7a3e9d",
    red = "#aa3731",
    white = "#f7f7f7",
    yellow = "#cb9000",
  }
  local error = "#d13e23"
  local warn = "#BC7500"
  local hint = ansi.blue
  local info = "#278C00"

  local comment_fg = vim.g.alabaster_dim_comments and dim_comment or comment
  local pmenu_bg = "#e7e7e7"
  local float_bg = vim.g.alabaster_floatborder and bg or pmenu_bg
  local floatborder = vim.g.alabaster_floatborder and { bg = bg, fg = "#999999" }
    or { bg = float_bg, fg = float_bg }

  theme = {
    Normal = { bg = bg, fg = fg },
    NormalNC = { bg = bg, fg = fg },
    EndOfBuffer = { fg = "#b6b6b6" },
    NonText = { fg = "#696969" },

    Cursor = { bg = active_blue, fg = "#bfdbfe" },
    TermCursorNC = { fg = bg, bg = fg },

    ColorColumn = { bg = "#E2EEEE" },
    CursorColumn = { bg = "#E2EEEE" },
    CursorLine = { bg = "#E2EEEE" },
    CursorLineNr = { fg = ansi.blue, bold = true },
    LineNr = { fg = "#7d7c7c" },

    SignColumn = {},
    CursorLineSign = { bg = "#E2EEEE" },
    CursorLineFold = { bg = "#E2EEEE" },

    Directory = { fg = ansi.blue },

    VertSplit = { fg = "#abbdc0" },
    WinSeparator = { fg = "#abbdc0" },

    Folded = { bg = "#dddddd", fg = "#7d7d7d" },
    FoldColumn = { bg = bg, fg = "#4d4d4d" },

    MatchParen = { underline = true, sp = active },

    Pmenu = { bg = pmenu_bg },
    PmenuSel = { bg = "#c7c7c7" },
    PmenuSbar = { bg = "#777777" },
    PmenuThumb = { bg = "#333333" },
    PmenuKind = link("Pmenu"),
    PmenuKindSel = link("PmenuSel"),
    PmenuExtra = link("Pmenu"),
    PmenuExtraSel = link("PmenuSel"),

    NormalFloat = { bg = float_bg },
    FloatBorder = floatborder,

    StatusLine = { bg = statusline, fg = fg },
    StatusLineNC = { bg = statusline, fg = "#9f9f9f" },

    TabLine = { bg = statusline, fg = "#7d7d7d" },
    TabLineFill = { bg = statusline },
    TabLineSel = { bg = statusline, fg = ansi.blue },

    WinBar = { bg = bg, fg = ansi.black, bold = true },
    WinBarNC = { bg = bg, fg = "#7d7d7d" },

    Visual = { bg = "#bfdbfe" },
    VisualNOS = { bg = "#bfdbfe" },

    Search = { bg = "#fae9b7", fg = fg },
    IncSearch = { bg = active, fg = fg },

    Title = { fg = const_fg },
    Question = { fg = ansi.green },
    MoreMsg = { fg = ansi.green, bold = true },
    WarningMsg = { fg = "#e1ad4c" },
    ErrorMsg = { fg = error, bg = mistake.bg },

    Comment = { fg = comment_fg },
    Conceal = { fg = "#b0b0b0" },

    DiffAdd = { bg = "#ADFFB7", fg = "#0A7816" },
    DiffDelete = { bg = "#F8B28F", fg = "#872C28" },
    DiffChange = { bg = "#fff987", fg = "#341a00" },
    DiffText = { fg = "#fff987", bg = "#876004" },

    SpellBad = { undercurl = true, sp = ansi.red },
    SpellCap = { undercurl = true, sp = ansi.blue },
    SpellLocal = { undercurl = true, sp = ansi.cyan },
    SpellRare = { undercurl = true, sp = ansi.magenta },

    Underlined = { underline = true },
    Italic = { italic = true },

    Error = { bg = mistake.bg, fg = mistake.fg },
    Todo = { bg = "#FFDEAA", fg = ansi.blue },

    -- Syntax
    Constant = { fg = const_fg },
    String = { fg = string_fg },
    Operator = { fg = punct_fg },
    Identifier = { fg = ansi.black },
    Function = { fg = def_fg },
    Keyword = { fg = ansi.black },
    Type = { fg = ansi.black },
    Special = { fg = ansi.yellow },
    SpecialComment = { bg = "#FFDEAA", fg = ansi.blue },

    -- LSP references (FIXED TYPO)
    LspReferenceText = { bg = "#dadada" },
    LspReferenceRead = { bg = "#dadada" },
    LspReferenceWrite = { bg = "#dadada", underline = true, sp = active_blue },
    LspCodeLens = { fg = "#999999" },
    LspCodeLensSeparator = { fg = "#999999" },

    -- Diagnostics
    DiagnosticError = { fg = error },
    DiagnosticWarn = { fg = warn },
    DiagnosticHint = { fg = hint },
    DiagnosticInfo = { fg = info },

    DiagnosticVirtualTextError = { bg = "#F8B28F", fg = "#411414" },
    DiagnosticVirtualTextWarn = { bg = "#fff987", fg = fg },
    DiagnosticVirtualTextHint = { fg = "#0F171D", bg = "#C3D0DA" },
    DiagnosticVirtualTextInfo = { bg = "#ADFFB7", fg = "#042F09" },

    DiagnosticUnderlineError = diag_undercurl(error),
    DiagnosticUnderlineWarn = diag_undercurl(warn),
    DiagnosticUnderlineHint = diag_undercurl(hint),
    DiagnosticUnderlineInfo = diag_undercurl(info),

    -- Treesitter preferred @ groups
    ["@punctuation.delimiter"] = { fg = punct_fg },
    ["@string"] = { fg = string_fg },
    ["@constant.builtin"] = { fg = const_fg },
    ["@function"] = { fg = def_fg },
    ["@keyword"] = { fg = ansi.black },
    ["@type"] = { fg = ansi.black },
    ["@variable"] = { fg = ansi.black },

    -- Semantic tokens: link so they don’t flatten
    ["@lsp.type.function"] = link("@function"),
    ["@lsp.type.method"] = link("@function"),
    ["@lsp.type.variable"] = link("@variable"),
    ["@lsp.type.keyword"] = link("@keyword"),
    ["@lsp.type.type"] = link("@type"),
  }
end

for group, hl in pairs(theme) do
  vim.api.nvim_set_hl(0, group, hl)
end

-- vi:nowrap
