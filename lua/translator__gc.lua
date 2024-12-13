-- Lua GC

local function force_gc()
    -- collectgarbage()
    collectgarbage("step")
end

return force_gc
