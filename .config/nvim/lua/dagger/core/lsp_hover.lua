--- Slightly *fancier* LSP hover handler.
local lsp_hover = {}

---@class hover.opts
---
---@field border_hl? string Highlight group for the window borders.
---@field name_hl? string Highlight group for the `name`. Defaults to `border_hl`.
---@field name string
---
---@field min_width? integer
---@field max_width? integer
---
---@field min_height? integer
---@field max_height? integer

--- Configuration for lsp_hovers from different
--- servers.
---
---@type { default: hover.opts, [string]: hover.opts }
lsp_hover.config = {
  default = {
    border_hl = "@annotation",
    name = "󰗊 LSP/Hover",

    min_width = 20,
    max_width = math.floor(vim.o.columns * 0.6),

    min_height = 1,
    max_height = math.floor(vim.o.lines * 0.5),
  },
}

--- Finds matching configuration.
--- NOTE: The output is the merge of the {config} and {default}.
---@param str string
---@return hover.opts
local match = function(str)
  ---+${lua}

  local ignore = { "default" }
  local config = lsp_hover.config.default or {}

  ---@type string[]
  local keys = vim.tbl_keys(lsp_hover.config)

  --- Sorting is nice in-case the same pattern can
  --- match multiple servers.
  table.sort(keys)

  for _, k in ipairs(keys) do
    if vim.list_contains(ignore, k) == false and string.match(str, k) then
      return vim.tbl_extend("force", config, lsp_hover.config[k])
    end
  end

  return config

  ---_
end

--- Get which quadrant to open the window on.
---
--- ```txt
---    top, left ↑ top, right
---            ← █ →
--- bottom, left ↓ bottom, right
--- ```
---@param w integer
---@param h integer
---@return [ "left" | "right" | "center", "top" | "bottom" | "center" ]
local function get_quadrant(w, h)
  ---+${lua}

  ---@type integer
  local window = vim.api.nvim_get_current_win()
  ---@type [ integer, integer ]
  local src_c = vim.api.nvim_win_get_cursor(window)

  --- (Terminal) Screen position.
  ---@class screen.pos
  ---
  ---@field row integer Screen row.
  ---@field col integer First screen column.
  ---@field endcol integer Last screen column.
  ---
  ---@field curscol integer Cursor screen column.
  local scr_p = vim.fn.screenpos(window, src_c[1], src_c[2])

  ---@type integer, integer Vim's width & height.
  local vW, vH = vim.o.columns, vim.o.lines - (vim.o.cmdheight or 0)
  ---@type "left" | "right", "top" | "bottom"
  local x, y

  if scr_p.curscol - w <= 0 then
    --- Not enough spaces on `left`.
    if scr_p.curscol + w >= vW then
      --- Not enough space on `right`.
      return { "center", "center" }
    else
      --- Enough spaces on `right`.
      x = "right"
    end
  else
    --- Enough space on `left`.
    x = "left"
  end

  if scr_p.row + h >= vH then
    --- Not enough spaces on `top`.
    if scr_p.row - h <= 0 then
      --- Not enough spaces on `bottom`.
      return { "center", "center" }
    else
      y = "top"
    end
  else
    y = "bottom"
  end

  return { x, y }
  ---_
end

---@type integer? LSP hover buffer.
lsp_hover.buffer = nil
---@type integer? LSP hover window.
lsp_hover.window = nil

--- Initializes the hover buffer & window.
---@param config table
lsp_hover.__init = function(config)
  ---+${lua}

  if not config then
    return
  end

  if not lsp_hover.buffer or vim.api.nvim_buf_is_valid(lsp_hover.buffer) then
    pcall(vim.api.nvim_buf_delete, lsp_hover.buffer, { force = true })
    lsp_hover.buffer = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_buf_set_keymap(lsp_hover.buffer, "n", "q", "", {
      desc = "Closes LSP hover window",
      callback = function()
        pcall(vim.api.nvim_win_close, lsp_hover.window, true)
        lsp_hover.window = nil
      end,
    })
  end

  if not lsp_hover.window then
    lsp_hover.window = vim.api.nvim_open_win(lsp_hover.buffer, false, config)
  elseif vim.api.nvim_win_is_valid(lsp_hover.window) == false then
    pcall(vim.api.nvim_win_close, lsp_hover.window, true)
    lsp_hover.window = vim.api.nvim_open_win(lsp_hover.buffer, false, config)
  else
    vim.api.nvim_win_set_config(lsp_hover.window, config)
  end

  ---_
end

--- Custom hover function.
---@param error table Error.
---@param result table Result of the hover.
---@param context table Context for this hover.
---@param _ table Hover config(we won't use this).
lsp_hover.hover = function(error, result, context, _)
  ---+${lua}

  if error then
    --- Emit error message.
    vim.api.nvim_echo({
      { "  Lsp hover: ", "DiagnosticVirtualTextError" },
      { " " },
      { error.message, "Comment" },
    }, true, {})
  end

  if lsp_hover.window and vim.api.nvim_win_is_valid(lsp_hover.window) then
    --- If Hover window is active then switch to that
    --- window.
    vim.api.nvim_set_current_win(lsp_hover.window)
    return
  elseif vim.api.nvim_get_current_buf() ~= context.bufnr then
    --- Buffer was changed before the request was
    --- resolved.
    return
  elseif not result or not result.contents then
    --- No result.
    vim.api.nvim_echo({
      { "  Lsp hover: ", "DiagnosticVirtualTextInfo" },
      { " " },
      { "No information available!", "Comment" },
    }, true, {})
    return
  end

  ---@type string[]
  local lines = {}
  local ft

  if type(result.contents) == "table" and result.contents.kind == "plaintext" then
    ft = "text"
  else
    ft = "markdown"
  end

  lines = vim.split(result.contents.value or "", "\n", { trimempty = true })

  ---@type integer LSP client ID.
  local client_id = context.client_id
  ---@type { name: string } LSP client info.
  local client = vim.lsp.get_client_by_id(client_id) or { name = "Unknown" }

  ---@type hover.opts
  local config = match(client.name)

  local w = config.min_width or 20
  local h = config.min_height or 1

  local max_height = config.max_height or 10
  local max_width = config.max_width or 60

  for _, line in ipairs(lines) do
    if vim.fn.strdisplaywidth(line) >= max_width then
      w = max_width
      break
    elseif vim.fn.strdisplaywidth(line) > w then
      w = vim.fn.strdisplaywidth(line)
    end
  end

  h = math.max(math.min(#lines, max_height), h)

  --- Window configuration.
  local win_conf = {
    relative = "cursor",

    row = 1,
    col = 0,
    width = w,
    height = h,

    style = "minimal",
  }

  --- Window borders.
  local border = {
    { "", config.border_hl or "FloatBorder" },
    { "", config.border_hl or "FloatBorder" },
    { "", config.border_hl or "FloatBorder" },

    { "│", config.border_hl or "FloatBorder" },
    { "", config.border_hl or "FloatBorder" },
    { "", config.border_hl or "FloatBorder" },

    { "│", config.border_hl or "FloatBorder" },
    { "│", config.border_hl or "FloatBorder" },
  }

  --- Which quadrant to open the window on.
  ---@type [ "left" | "right" | "center", "top" | "bottom" | "center" ]
  local quad = get_quadrant(w + 2, h + 2)

  if quad[1] == "left" then
    win_conf.col = (w * -1)
  elseif quad[1] == "right" then
    win_conf.col = -10
  else
    win_conf.relative = "editor"
    win_conf.col = math.ceil((vim.o.columns - w) / 2)
  end

  if quad[2] == "top" then
    win_conf.row = (h * -1)
  elseif quad[2] == "bottom" then
    win_conf.row = 1
  else
    win_conf.relative = "editor"
    win_conf.row = math.ceil((vim.o.lines - h) / 2)
  end

  win_conf.border = border
  lsp_hover.__init(win_conf)

  vim.api.nvim_buf_set_lines(lsp_hover.buffer, 0, -1, false, lines)

  vim.bo[lsp_hover.buffer].ft = ft

  vim.wo[lsp_hover.window].conceallevel = 3
  vim.wo[lsp_hover.window].concealcursor = "n"
  vim.wo[lsp_hover.window].signcolumn = "no"

  vim.wo[lsp_hover.window].wrap = true
  vim.wo[lsp_hover.window].linebreak = true

  if package.loaded["markview"] and package.loaded["markview"].render then
    --- If markview is available use it to render stuff.
    --- This is for `v25`.
    require("markview").render(lsp_hover.buffer, { enable = true, hybrid_mode = false })
  end

  ---_
end

--- Setup function.
---@param config { default: hover.opts, [string]: hover.opts } | nil
lsp_hover.setup = function(config)
  ---+${lua}

  if config then
    lsp_hover.config = vim.tbl_deep_extend("force", lsp_hover.config, config)
  end

  --- Set-up the new provider.
  --vim.lsp.handlers["textDocument/hover"] = lsp_hover.hover

  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    callback = function(event)
      if event.buf == lsp_hover.buffer then
        --- Don't do anything if the current buffer
        --- is the hover buffer.
        return
      elseif lsp_hover.window and vim.api.nvim_win_is_valid(lsp_hover.window) then
        pcall(vim.api.nvim_win_close, lsp_hover.window, true)
        lsp_hover.window = nil
      end
    end,
  })

  ---_
end

return lsp_hover
