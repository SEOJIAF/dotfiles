local micro = import("micro")
local shell = import("os/shell")

function copy(bp)
    local text = bp.Buf:GetSelection()
    if text ~= "" then
        shell.ExecCommand("wl-copy", text)
    end
end

function paste(bp)
    local f = io.popen("wl-paste")
    local text = f:read("*a")
    f:close()
    bp.Buf:Insert(text)
end

micro.Bind("Ctrl-C", copy, true)
micro.Bind("Ctrl-V", paste, true)
