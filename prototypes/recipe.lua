local mult = settings.startup["dry-recipe-multiplier"].value or 1


---Copy entities from data.raw---
local advExchange = table.deepcopy(data.raw["recipe"]["heat-exchanger"])
local advTurbine = table.deepcopy(data.raw["recipe"]["steam-turbine"])
local advPipe = table.deepcopy(data.raw["recipe"]["heat-pipe"])
local advReactor = table.deepcopy(data.raw["recipe"]["nuclear-reactor"])

---Advanced Heat Exchanger---
  --Constant
advExchange.name = "dry-heat-exchanger"
advExchange.result = "dry-heat-exchanger"
  --Changing
advExchange.enabled = false
advExchange.ingredients = {{"heat-exchanger", math.floor(mult)},}


---Advanced Steam Turbine---
  --Constant
advTurbine.name = "dry-steam-turbine"
advTurbine.result = "dry-steam-turbine"
  --Changing
advTurbine.enabled = false
advTurbine.ingredients = {{"steam-turbine", math.floor(mult)},}

---Advanced Heat Pipe---
  --Constant
advPipe.name = "dry-heat-pipe"
advPipe.result = "dry-heat-pipe"
  --Changing
advPipe.enabled = false
advPipe.ingredients = {{"heat-pipe", math.floor(mult)},}

---Advanced Nuclear Reactor---
  --Constant
advReactor.name = "dry-nuclear-reactor"
advReactor.result = "dry-nuclear-reactor"
  --Changing
advReactor.enabled = false
advReactor.ingredients = {{"nuclear-reactor", math.floor(mult)},    }

---Put new entities into data.raw---
data.raw["recipe"]["dry-heat-exchanger"] = advExchange
data.raw["recipe"]["dry-steam-turbine"] = advTurbine
data.raw["recipe"]["dry-heat-pipe"] = advPipe
data.raw["recipe"]["dry-nuclear-reactor"] = advReactor