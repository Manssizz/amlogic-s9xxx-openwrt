module ("luci.controller.modem-reconnect", package.seeall)

function index()
    entry({"admin", "modem", "modem-reconnect"}, cbi("modem-reconenct"), _("Modem Reconnect"), 60).dependent = true
end