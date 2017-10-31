local mult = settings.startup["recipe-multiplier"].value


---Copy entities from data.raw---
local advExchange = table.deepcopy(data.raw["recipe"]["heat-exchanger"])
local advTurbine = table.deepcopy(data.raw["recipe"]["steam-turbine"])
local advPipe = table.deepcopy(data.raw["recipe"]["heat-pipe"])
local advReactor = table.deepcopy(data.raw["recipe"]["nuclear-reactor"])

---Advanced Heat Exchanger---
  --Constant
advExchange.name = "heat-exchanger-2"
advExchange.result = "heat-exchanger-2"
  --Changing
advExchange.enabled = true
advExchange.ingredients = {{"steel-plate", math.floor(mult*10)}, {"copper-plate", math.floor(mult*100)}, {"pipe", math.floor(mult*10)}}


---Advanced Steam Turbine---
  --Constant
advTurbine.name = "steam-turbine-2"
advTurbine.result = "steam-turbine-2"
  --Changing
advTurbine.enabled = true
advTurbine.ingredients = {{"iron-gear-wheel", math.floor(mult*50)}, {"copper-plate", math.floor(mult*50)}, {"pipe", math.floor(mult*20)}}

---Advanced Heat Pipe---
  --Constant
advPipe.name = "heat-pipe-2"
advPipe.result = "heat-pipe-2"
  --Changing
advPipe.enabled = true
advPipe.ingredients = {{"steel-plate", math.floor(mult*10)}, {"copper-plate", math.floor(mult*20)}}

---Advanced Nuclear Reactor---
  --Constant
advReactor.name = "nuclear-reactor-2"
advReactor.result = "nuclear-reactor-2"
  --Changing
advReactor.enabled = true
advReactor.ingredients = 
    {
      {"concrete", math.floor(mult*500)},
      {"steel-plate", math.floor(mult*500)},
      {"advanced-circuit", math.floor(mult*500)},
      {"copper-plate", math.floor(mult*500)},
    }

---Put new entities into data.raw---
data.raw["recipe"]["heat-exchanger-2"] = advExchange
data.raw["recipe"]["steam-turbine-2"] = advTurbine
data.raw["recipe"]["heat-pipe-2"] = advPipe
data.raw["recipe"]["nuclear-reactor-2"] = advReactor