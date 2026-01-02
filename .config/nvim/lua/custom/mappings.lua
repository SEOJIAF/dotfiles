require "nvchad.mappings"

local map = vim.keymap.set

-- Move cursor word-by-word
-- 'q' moves left (b), 'e' moves right (w)
map({ "n", "v" }, "q", "b", { desc = "Move word left" })
map({ "n", "v" }, "e", "w", { desc = "Move word right" })

-- Since you used 'q', remap macro recording to 'Q'
map("n", "Q", "q", { desc = "Record Macro" })

-- To confirm this file is loading, you can uncomment the next line:
print("Mappings loaded!")
