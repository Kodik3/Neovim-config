local uv = vim.loop
local async = require("plenary.async")
local Job = require("plenary.job")

local state = {
  comp_wakatime_time = "",
  routine_init = false,
}

local get_wakatime_time = function()
  local tx, rx = async.control.channel.oneshot()
  local ok, job = pcall(Job.new, Job, {
    command = "wakatime",
    args = { "--today" },
    on_exit = function(j, _)
      local result = j:result()[1] or ""
      local trimmed = result:match("^(.-)%s+Coding") or result
      tx(trimmed)
    end,
  })
  if not ok then
    print("Bad WakaTime call: " .. job)
    return ""
  end
  job:start()
  return rx()
end

local wakatime = function()
  local WAKATIME_UPDATE_INTERVAL = 10000

  if not state.routine_init then
    local timer = uv.new_timer()
    if timer == nil then return "" end
    -- update every some some
    uv.timer_start(timer, 500, WAKATIME_UPDATE_INTERVAL, function()
      async.run(
        get_wakatime_time,
        function(time) state.comp_wakatime_time = time end
      )
    end)
    state.routine_init = true
  end

  return state.comp_wakatime_time
end

return wakatime
