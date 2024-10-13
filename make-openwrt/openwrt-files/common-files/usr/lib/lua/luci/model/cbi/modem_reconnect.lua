local sys = require "luci.sys"

m = Map("modem_reconnect", "Modem Reconnect Settings", "Configure settings for auto reconnecting the modem interface.")

s = m:section(TypedSection, "modem", "Modem Configuration")
s.addremove = false
s.anonymous = true

-- Interface Name with combobox
interface = s:option(ListValue, "interfaceName", "Interface Name")
interface.rmempty = false

-- Populate the combobox with available network interfaces
local devices = sys.net.devices()
for _, dev in ipairs(devices) do
    interface:value(dev)
end

-- Primary Target
primary = s:option(Value, "primaryTarget", "Primary Ping Target")
primary.default = "vidio.com"
primary.rmempty = false

-- Secondary Target
secondary = s:option(Value, "secondaryTarget", "Secondary Ping Target")
secondary.default = "fb.me"
secondary.rmempty = false

-- Retry Interval
retry = s:option(Value, "retryInterval", "Retry Interval (in seconds)")
retry.datatype = "uinteger"
retry.default = "30"
retry.rmempty = false

-- Fail Sleep Time
failSleep = s:option(Value, "failSleepTime", "Fail Sleep Time (in seconds)")
failSleep.datatype = "uinteger"
failSleep.default = "300"
failSleep.rmempty = false

-- Ping Timeout
timeout = s:option(Value, "pingTimeout", "Ping Timeout (in seconds)")
timeout.datatype = "uinteger"
timeout.default = "60"
timeout.rmempty = false

return m
