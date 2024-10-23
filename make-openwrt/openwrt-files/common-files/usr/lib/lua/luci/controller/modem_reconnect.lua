module("luci.controller.modem_reconnect", package.seeall)

function index()
    entry({"admin", "modem", "modem_reconnect"}, cbi("modem_reconnect"), _("Modem Reconnect"), 60).dependent = true
end
