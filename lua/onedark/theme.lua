local util = require("onedark.util")
local colors = require("onedark.colors")
local configModule = require("onedark.config")

local M = {}

---@param config Config
---@return Theme
function M.setup(config)
  config = config or configModule.config

  ---@class Theme
  local theme = {}
  theme.config = config
  theme.colors = colors.setup(config)
  local c = theme.colors

  theme.base = {
    -- luacheck: ignore
    Comment = {fg = c.fg_gutter, style = config.commentStyle}, -- any comment
    ColorColumn = {bg = c.bg_visual}, -- used for the columns set with 'colorcolumn'
    Conceal = {fg = c.fg_gutter}, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = {fg = c.bg, bg = c.fg}, -- character under the cursor
    lCursor = {fg = c.bg, bg = c.fg}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = {fg = c.bg, bg = c.fg}, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = {bg = c.bg_highlight}, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = {bg = c.bg_highlight}, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = {fg = c.blue}, -- directory names (and other special names in listings)
    DiffAdd = {bg = c.diff.add}, -- diff mode: Added line |diff.txt|
    DiffChange = {bg = c.diff.change}, -- diff mode: Changed line |diff.txt|
    DiffDelete = {bg = c.diff.delete}, -- diff mode: Deleted line |diff.txt|
    DiffText = {bg = c.diff.text}, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = {fg = config.hideNonText and c.bg or c.fg_dark}, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor  = { }, -- cursor in a focused terminal
    -- TermCursorNC= { }, -- cursor in an unfocused terminal
    ErrorMsg = {fg = c.error}, -- error messages on the command line
    VertSplit = {fg = c.black}, -- the column separating vertically split windows
    Folded = {fg = c.blue, bg = c.black}, -- line used for closed folds
    FoldColumn = {bg = c.bg, fg = c.fg_gutter}, -- 'foldcolumn'
    SignColumn = {bg = config.transparent and c.none or c.bg, fg = c.fg_gutter}, -- column where |signs| are displayed
    SignColumnSB = {bg = c.bg_sidebar, fg = c.fg_gutter}, -- column where |signs| are displayed
    Substitute = {bg = c.red, fg = c.black}, -- |:substitute| replacement text highlighting
    LineNr = {fg = c.fg_gutter}, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = {fg = c.dark5}, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = {fg = c.blue, style = "bold"}, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = {fg = c.fg_dark, style = "bold"}, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = {fg = c.fg_dark}, -- Area for messages and cmdline
    -- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = {fg = c.blue}, -- |more-prompt|
    NonText = {fg = c.bg}, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = {fg = c.fg, bg = config.transparent and c.none or c.bg}, -- normal text
    NormalNC = {fg = c.fg, bg = config.transparent and c.none or c.bg}, -- normal text in non-current windows
    NormalSB = {fg = c.fg_sidebar, bg = c.bg_sidebar}, -- normal text in non-current windows
    NormalFloat = {fg = c.fg, bg = c.bg_float}, -- Normal text in floating windows.
    FloatBorder = {fg = c.cyan},
    Pmenu = {bg = c.bg1, fg = c.fg}, -- Popup menu: normal item.
    PmenuSel = {bg = c.bg_blue, fg = c.bg0}, -- Popup menu: selected item.
    PmenuSbar = {bg = util.lighten(c.bg_popup, 0.95)}, -- Popup menu: scrollbar.
    PmenuThumb = {bg = c.fg_gutter}, -- Popup menu: Thumb of the scrollbar.
    Question = {fg = c.blue}, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = {bg = c.bg_visual, style = "bold"}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = {bg = c.bg_search, fg = c.fg_search}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = {bg = c.orange, fg = c.black}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    SpecialKey = {fg = c.fg_gutter}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = {sp = c.error, style = "undercurl"}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = {sp = c.warning, style = "undercurl"}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = {sp = c.info, style = "undercurl"}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = {sp = c.hint, style = "undercurl"}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = {fg = c.fg_sidebar, bg = c.bg_statusline}, -- status line of current window
    StatusLineNC = {fg = c.fg_gutter, bg = c.bg_statusline}, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = {bg = c.bg_statusline, fg = c.fg_gutter}, -- tab pages line, not active tab page label
    TabLineFill = {bg = c.black}, -- tab pages line, where there are no labels
    TabLineSel = {fg = c.black, bg = c.blue}, -- tab pages line, active tab page label
    Title = {fg = c.blue, style = "bold"}, -- titles for output from ":set all", ":autocmd" etc.
    Visual = {bg = c.bg_visual}, -- Visual mode selection
    VisualNOS = {bg = c.bg_visual}, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = {fg = c.warning}, -- warning messages
    Whitespace = {fg = c.fg_gutter}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = {bg = c.bg_visual}, -- current match in 'wildmenu' completion
    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = {fg = c.orange}, -- (preferred) any constant
    String = {fg = c.green}, --   a string constant: "this is a string"
    Character = {fg = c.green}, --  a character constant: 'c', '\n'
    -- Number        = { }, --   a number constant: 234, 0xff
    Boolean = {fg = c.orange}, --  a boolean constant: TRUE, false
    -- Float         = { }, --    a floating point constant: 2.3e10

    Identifier = {fg = c.red, style = config.variableStyle}, -- (preferred) any variable name
    Function = {fg = c.blue, style = config.functionStyle}, -- function name (also: methods for classes)
    Statement = {fg = c.purple}, -- (preferred) any statement
    -- Conditional   = { }, --  if, then, else, endif, switch, etc.
    -- Repeat        = { }, --   for, do, while, etc.
    -- Label         = { }, --    case, default, etc.
    Operator = {fg = c.red}, -- "sizeof", "+", "*", etc.
    Keyword = {fg = c.cyan, style = config.keywordStyle}, --  any other keyword
    -- Exception     = { }, --  try, catch, throw

    PreProc = {fg = c.cyan}, -- (preferred) generic Preprocessor
    -- Include       = { }, --  preprocessor #include
    -- Define        = { }, --   preprocessor #define
    -- Macro         = { }, --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

    Type = {fg = c.yellow}, -- (preferred) int, long, char, etc.
    -- StorageClass  = { }, -- static, register, volatile, etc.
    -- Structure     = { }, --  struct, union, enum, etc.
    -- Typedef       = { }, --  A typedef

    Special = {fg = c.red}, -- (preferred) any special symbol
    -- SpecialChar   = { }, --  special character in a constant
    -- Tag           = { }, --    you can use CTRL-] on this
    -- Delimiter     = { }, --  character that needs attention
    -- SpecialComment= { }, -- special things inside a comment
    -- Debug         = { }, --    debugging statements

    Underlined = {style = "underline"}, -- (preferred) text that stands out, HTML links
    Bold = {style = "bold"},
    Italic = {style = "italic"},
    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = {fg = c.error}, -- (preferred) any erroneous construct
    Todo = {bg = c.yellow, fg = c.bg}, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    qfLineNr = {fg = c.dark5},
    qfFileName = {fg = c.blue},
    htmlTag = {fg = c.purple, style = "bold"},
    -- mkdHeading = { fg = c.orange, style = "bold" },
    -- mkdCode = { bg = c.bg2, fg = c.fg },
    mkdCodeDelimiter = {bg = c.bg2, fg = c.fg},
    mkdCodeStart = {fg = c.yellow, style = "bold"},
    mkdCodeEnd = {fg = c.yellow, style = "bold"},
    -- mkdLink = { fg = c.blue, style = "underline" },

    markdownHeadingDelimiter = {fg = c.orange, style = "bold"},
    markdownCode = {fg = c.yellow},
    markdownCodeBlock = {fg = c.yellow},
    markdownH1 = {fg = c.red, style = "bold"},
    markdownH2 = {fg = c.blue, style = "bold"},
    markdownLinkText = {fg = c.blue, style = "underline"},
    debugPC = {bg = c.bg_sidebar}, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = {bg = util.darken(c.info, 0.1), fg = c.info}, -- used for breakpoint colors in terminal-debug
    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = {bg = c.fg_gutter}, -- used for highlighting "text" references
    LspReferenceRead = {bg = c.fg_gutter}, -- used for highlighting "read" references
    LspReferenceWrite = {bg = c.fg_gutter}, -- used for highlighting "write" references
    LspDiagnosticsDefaultError = {fg = c.error}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultWarning = {fg = c.warning}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultInformation = {fg = c.info}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultHint = {fg = c.hint}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsVirtualTextError = {bg = c.none, fg = c.diagnostics.error}, -- Used for "Error" diagnostic virtual text
    LspDiagnosticsVirtualTextWarning = {bg = c.none, fg = c.diagnostics.warning}, -- Used for "Warning" diagnostic virtual text
    LspDiagnosticsVirtualTextInformation = {bg = c.none, fg = c.diagnostics.info}, -- Used for "Information" diagnostic virtual text
    LspDiagnosticsVirtualTextHint = {bg = c.none, fg = c.diagnostics.hint}, -- Used for "Hint" diagnostic virtual text
    LspDiagnosticsUnderlineError = {style = "undercurl", sp = c.diagnostics.error}, -- Used to underline "Error" diagnostics
    LspDiagnosticsUnderlineWarning = {style = "undercurl", sp = c.diagnostics.warning}, -- Used to underline "Warning" diagnostics
    LspDiagnosticsUnderlineInformation = {style = "undercurl", sp = c.diagnostics.info}, -- Used to underline "Information" diagnostics
    LspDiagnosticsUnderlineHint = {style = "undercurl", sp = c.diagnostics.hint}, -- Used to underline "Hint" diagnostics
    -- neovim 0.6.0
    DiagnosticDefaultError = {fg = c.error}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticDefaultWarn = {fg = c.warning}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticDefaultInfo = {fg = c.info}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticDefaultHint = {fg = c.hint}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticVirtualTextError = {bg = c.none, fg = c.diagnostics.error}, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = {bg = c.none, fg = c.diagnostics.warning}, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = {bg = c.none, fg = c.diagnostics.info}, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = {bg = c.none, fg = c.diagnostics.hint}, -- Used for "Hint" diagnostic virtual text
    DiagnosticUnderlineError = {style = "undercurl", sp = c.diagnostics.error}, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = {style = "undercurl", sp = c.diagnostics.warning}, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = {style = "undercurl", sp = c.diagnostics.info}, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = {style = "undercurl", sp = c.diagnostics.hint}, -- Used to underline "Hint" diagnostics
    LspSignatureActiveParameter = {fg = c.orange}

    -- LspDiagnosticsFloatingError         = { }, -- Used to color "Error" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingWarning       = { }, -- Used to color "Warning" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingInformation   = { }, -- Used to color "Information" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingHint          = { }, -- Used to color "Hint" diagnostic messages in diagnostics float

    -- LspDiagnosticsSignError             = { }, -- Used for "Error" signs in sign column
    -- LspDiagnosticsSignWarning           = { }, -- Used for "Warning" signs in sign column
    -- LspDiagnosticsSignInformation       = { }, -- Used for "Information" signs in sign column
    -- LspDiagnosticsSignHint              = { }, -- Used for "Hint" signs in sign column
  }

  theme.plugins = {
    TSNote = {fg = c.bg, bg = c.info},
    TSWarning = {fg = c.bg, bg = c.warning},
    TSDanger = {fg = c.bg, bg = c.error},
    TSConstructor = {fg = c.blue}, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    -- TSConditional       = { };    -- For keywords related to conditionnals.
    TSConstant = {fg = c.cyan}, -- For constants
    TSConstBuiltin = {fg = c.orange}, -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro        = { };    -- For constants that are defined by macros: `NULL` in C.
    -- TSError             = { };    -- For syntax/parser errors.
    -- TSException         = { };    -- For exception related keywords.
    TSField = {fg = c.cyan}, -- For fields.
    -- TSFloat             = { };    -- For floats.
    TSFunction = {fg = c.blue, style = config.functionStyle}, -- For function (calls and definitions).
    -- TSFuncBuiltin       = { };    -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro         = { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSInclude = {fg = c.purple}, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSKeyword = {fg = c.purple, style = config.keywordStyle}, -- For keywords that don't fall in previous categories.
    TSKeywordFunction = {fg = c.purple, style = config.functionStyle}, -- For keywords used to define a fuction.
    TSLabel = {fg = c.blue}, -- For labels: `label:` in C and `:label:` in Lua.
    TSMethod = {fg = c.blue, style = config.functionStyle}, -- For method calls and definitions.
    TSNamespace = {fg = c.red}, -- For identifiers referring to modules and namespaces.
    -- TSNone              = { };    -- TODO: docs
    -- TSNumber            = { };    -- For all numbers
    TSOperator = {fg = c.purple}, -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter = {fg = c.red}, -- For parameters of a function.
    -- TSParameterReference= { };    -- For references to parameters of a function.
    -- TSProperty = { fg = c.red }, -- Same as `TSField`.
    TSPunctDelimiter = {fg = c.fg}, -- For delimiters ie: `.`
    TSPunctBracket = {fg = c.fg_dark}, -- For brackets and parens.
    TSPunctSpecial = {fg = c.fg}, -- For special punctutation that does not fall in the catagories before.
    -- TSRepeat            = { };    -- For keywords related to loops.
    -- TSString            = { };    -- For strings.
    TSStringRegex = {fg = c.orange}, -- For regexes.
    TSStringEscape = {fg = c.red}, -- For escape characters within a string.
    -- TSSymbol            = { };    -- For identifiers referring to symbols or atoms.
    TSType = {fg = c.yellow}, -- For types.
    TSTypeBuiltin = {fg = c.blue, style = config.functionStyle}, -- For builtin types.
    TSTag = {fg = c.red}, -- Tags like html tag names.
    TSTagDelimiter = {fg = c.red}, -- Tag delimiter like `<` `>` `/`
    TSTagAttribute = {fg = c.orange, style = config.keywordStyle},
    TSVariable = {style = config.variableStyle, fg = c.yellow}, -- Any variable name that does not have another highlight.
    TSVariableBuiltin = {fg = c.red}, -- Variable names that are defined by the languages, like `this` or `self`.
    TSTextReference = {fg = c.red}, -- FIXME
    -- TSText              = { };    -- For strings considered text in a markup language.
    TSEmphasis = {fg = c.fg, style = config.keywordStyle}, -- For text to be represented with emphasis.
    TSStrong = {fg = c.fg, style = config.keywordStyle}, -- For text to be represented with emphasis.
    -- TSUnderline         = { };    -- For text to be represented with an underline.
    -- TSStrike            = { };    -- For strikethrough text.
    -- TSTitle             = { };    -- Text that is part of a title.
    -- TSLiteral           = { };    -- Literal text.
    -- TSURI               = { };    -- Any URI like a link or email.

    -- cpp
    cppTSType = {fg = c.orange},
    -- markdown
    TSURI = {fg = c.blue, style = "underline"},
    TSLiteral = {fg = c.red},
    TSTextReference = {fg = c.blue},
    TSTitle = {fg = c.red, style = "bold"},
    TSStrong = {style = "bold"},
    TSEmphasis = {style = "bold"},
    -- Lua
    -- luaTSProperty = { fg = c.red }, -- Same as `TSField`.

    -- LspTrouble
    LspTroubleText = {fg = c.fg_dark},
    LspTroubleCount = {fg = c.purple, bg = c.fg_gutter},
    LspTroubleNormal = {fg = c.fg_sidebar, bg = c.bg_sidebar},
    -- Illuminate
    illuminatedWord = {bg = c.fg_gutter},
    illuminatedCurWord = {bg = c.fg_gutter},
    -- diff
    diffAdded = {fg = c.git.add},
    diffRemoved = {fg = c.git.delete},
    diffChanged = {fg = c.git.change},
    diffOldFile = {fg = c.yellow},
    diffNewFile = {fg = c.orange},
    diffFile = {fg = c.blue},
    diffLine = {fg = c.fg_gutter},
    diffIndexLine = {fg = c.purple},
    -- GitSigns
    GitSignsAdd = {fg = c.gitSigns.add}, -- diff mode: Added line |diff.txt|
    GitSignsChange = {fg = c.gitSigns.change}, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = {fg = c.gitSigns.delete}, -- diff mode: Deleted line |diff.txt|
    GitSignsCurrentLineBlame = {fg = c.fg_gutter},
    -- NvimTree
    NvimTreeFolderIcon = {fg = c.fg_dark},
    NvimTreeOpenedFile = {fg = c.purple},
    NvimTreeEndOfBuffer = config.darkSidebar and {fg = c.bg2} or {fg = c.bg},
    NvimTreeRootFolder = {fg = c.fg_light, style = "bold"},
    NvimTreeGitDirty = {fg = c.yellow2},
    NvimTreeGitNew = {fg = c.git.add},
    NvimTreeGitDeleted = {fg = c.git.delete},
    NvimTreeSpecialFile = {fg = c.fg},
    NvimTreeIndentMarker = {fg = c.fg_gutter},
    NvimTreeImageFile = {fg = c.fg_sidebar},
    NvimTreeSymlink = {fg = c.purple},
    NvimTreeFolderName = {fg = c.blue},
    NvimTreeOpenedFolderName = {fg = c.purple, style = "bold"},
    NvimTreeNormal = {fg = c.grey, bg = c.bg_sidebar},
    LspDiagnosticsError = {fg = c.error},
    LspDiagnosticsWarning = {fg = c.warning},
    LspDiagnosticsInformation = {fg = c.info},
    LspDiagnosticsHint = {fg = c.hint},
    -- Dashboard
    DashboardShortCut = {fg = c.purple},
    DashboardHeader = {fg = c.yellow},
    DashboardCenter = {fg = c.blue},
    DashboardFooter = {fg = c.yellow, style = "italic"},
    -- WhichKey
    WhichKey = {fg = c.purple, style = "bold"},
    WhichKeyGroup = {fg = c.blue},
    WhichKeyDesc = {fg = c.red},
    WhichKeySeperator = {fg = c.fg_gutter},
    WhichKeySeparator = {fg = c.fg_gutter},
    WhichKeyFloat = {bg = c.bg},
    WhichKeyValue = {fg = c.dark5},
    -- LspSaga
    DiagnosticError = {fg = c.error},
    DiagnosticWarning = {fg = c.warning},
    DiagnosticInformation = {fg = c.info},
    DiagnosticHint = {fg = c.hint},
    -- NeoVim
    healthError = {fg = c.error},
    healthSuccess = {fg = c.green},
    healthWarning = {fg = c.warning},
    -- Barbar
    BufferTabpageFill = {bg = c.bg2, fg = c.bg_visual}, -- filler after the buffer section
    BufferCurrent = {bg = c.bg, fg = c.cyan},
    BufferCurrentIndex = {bg = c.bg, fg = c.blue},
    BufferCurrentMod = {bg = c.bg, fg = c.yellow},
    BufferCurrentSign = {link = "BufferCurrentIndex"},
    BufferCurrentTarget = {bg = c.bg, fg = c.red, style = "bold"},
    BufferVisible = {bg = c.bg, fg = util.darken(c.fg, 0.8)},
    BufferVisibleIndex = {link = "BufferCurrentIndex"},
    BufferVisibleMod = {link = "BufferVisibleMod"},
    BufferVisibleSign = {bg = c.bg, fg = util.darken(c.blue, 0.8)},
    BufferVisibleTarget = {link = "BufferCurrentTarget"},
    BufferInactive = {bg = c.bg2, fg = util.darken(c.fg, 0.5)},
    BufferInactiveIndex = {bg = c.bg2, fg = util.darken(c.fg, 0.25)},
    BufferInactiveMod = {bg = c.bg2, fg = util.darken(c.yellow, 0.7)},
    BufferInactiveSign = {link = "BufferInactiveIndex"},
    BufferInactiveTarget = {bg = c.bg2, fg = c.red, style = "bold"},
    -- Hop
    HopNextKey = {fg = c.purple},
    HopNextKey1 = {fg = c.purple},
    HopNextKey2 = {fg = c.purple},
    HopUnmatched = {fg = c.grey},
    LightspeedGreyWash = {fg = c.dark5},
    -- NVIM CMP - VSCode like highlights
    CmpItemAbbrMatch = {fg = c.purple},
    CmpItemAbbrMatchFuzzy = {fg = c.red},
    CmpItemKindFunction = {fg = c.orange},
    CmpItemKindMethod = {fg = c.orange},
    CmpItemKindVariable = {fg = c.orange},
    CmpItemKindInterface = {fg = c.orange},
    CmpItemKindText = {fg = c.orange},
    CmpItemKindModule = {fg = c.orange},
    CmpItemKindClass = {fg = c.orange},
    CmpItemKindKeyword = {fg = c.orange},
    CmpItemKindSnippet = {fg = c.orange},
    CmpItemKindFolder = {fg = c.orange},
    CmpItemKindConstructor = {fg = c.orange},
    CmpItemKindField = {fg = c.orange},
    CmpItemKindProperty = {fg = c.orange},
    CmpItemKindUnit = {fg = c.orange},
    CmpItemKindValue = {fg = c.orange},
    CmpItemKindEnum = {fg = c.orange},
    CmpItemKindFile = {fg = c.orange},
    CmpItemKindReference = {fg = c.orange},
    CmpItemKindEnumMember = {fg = c.orange},
    CmpItemKindConstant = {fg = c.orange},
    CmpItemKindStruct = {fg = c.orange},
    CmpItemKindEvent = {fg = c.orange},
    CmpItemKindOperator = {fg = c.orange},
    CmpItemKindTypeParameter = {fg = c.orange},
    CmpItemAbbrDeprecated = {style = "strikethrough", fg = c.fg_gutter},
    CmpItemMenu = {fg = c.blue},
    -- notify
    NotifyERRORBorder = {fg = c.diagnostics.error},
    NotifyWARNBorder = {fg = c.diagnostics.warn},
    NotifyINFOBorder = {fg = c.diagnostics.info},
    NotifyDEBUGBorder = {fg = c.diagnostics.hint},
    NotifyTRACEBorder = {fg = c.purple},
    NotifyERRORIcon = {fg = c.diagnostics.error},
    NotifyWARNIcon = {fg = c.diagnostics.warn},
    NotifyINFOIcon = {fg = c.diagnostics.info},
    NotifyDEBUGIcon = {fg = c.diagnostics.hint},
    NotifyTRACEIcon = {fg = c.purple},
    NotifyERRORTitle = {fg = c.diagnostics.error},
    NotifyWARNTitle = {fg = c.diagnostics.warn},
    NotifyINFOTitle = {fg = c.diagnostics.info},
    NotifyDEBUGTitle = {fg = c.diagnostics.hint},
    NotifyTRACETitle = {fg = c.purple},
    -- indent_blackline
    IndentBlanklineChar = {fg = c.bg1, style = "NONE"},
    -- Telescope
    TelescopeBorder = {fg = c.cyan},
    TelescopeSelection = {fg = c.purple, bg = c.bg1},
    TelescopeMatching = {fg = c.green}
  }

  theme.defer = {}
  return theme
end

return M
