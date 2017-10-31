---Copy entities from data.raw---
local advExchange = table.deepcopy(data.raw["item"]["heat-exchanger"])
local advTurbine = table.deepcopy(data.raw["item"]["steam-turbine"])
local advPipe = table.deepcopy(data.raw["item"]["heat-pipe"])
local advReactor = table.deepcopy(data.raw["item"]["nuclear-reactor"])

---Advanced Heat Exchanger---
advExchange.name = "heat-exchanger-2"
advExchange.place_result = "heat-exchanger-2"

---Advanced Steam Turbine---
advTurbine.name = "steam-turbine-2"
advTurbine.place_result = "steam-turbine-2"

---Advanced Heat Pipe---
advPipe.name = "heat-pipe-2"
advPipe.place_result = "heat-pipe-2"

---Advanced Nuclear Reactor---
advReactor.name = "nuclear-reactor-2"
advReactor.place_result = "nuclear-reactor-2"

---Put new entities into data.raw---
data.raw["item"]["heat-exchanger-2"] = advExchange
data.raw["item"]["steam-turbine-2"] = advTurbine
data.raw["item"]["heat-pipe-2"] = advPipe
data.raw["item"]["nuclear-reactor-2"] = advReactor
