---Copy entities from data.raw---
local advExchange = table.deepcopy(data.raw["item"]["heat-exchanger"])
local advTurbine = table.deepcopy(data.raw["item"]["steam-turbine"])
local advPipe = table.deepcopy(data.raw["item"]["heat-pipe"])
local advReactor = table.deepcopy(data.raw["item"]["nuclear-reactor"])

---Advanced Heat Exchanger---
advExchange.name = "dry-heat-exchanger"
advExchange.place_result = "dry-heat-exchanger"

---Advanced Steam Turbine---
advTurbine.name = "dry-steam-turbine"
advTurbine.place_result = "dry-steam-turbine"

---Advanced Heat Pipe---
advPipe.name = "dry-heat-pipe"
advPipe.place_result = "dry-heat-pipe"

---Advanced Nuclear Reactor---
advReactor.name = "dry-nuclear-reactor"
advReactor.place_result = "dry-nuclear-reactor"

---Put new entities into data.raw---
data.raw["item"]["dry-heat-exchanger"] = advExchange
data.raw["item"]["dry-steam-turbine"] = advTurbine
data.raw["item"]["dry-heat-pipe"] = advPipe
data.raw["item"]["dry-nuclear-reactor"] = advReactor
