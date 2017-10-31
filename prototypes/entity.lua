local turbinePower = settings.startup["turbine-power-output"].value or 1
local reactorFuel = settings.startup["reactor-fuel-use"].value or 1

local tempChange = 485*turbinePower
local steamTemp = 15 + tempChange
local maxTemp = steamTemp*2.5
local reacPower = 40*turbinePower
local reactorPower = reacPower.."MW"
local reactorEff = turbinePower/reactorFuel

---Copy entities from data.raw---
local advExchange = table.deepcopy(data.raw["boiler"]["heat-exchanger"])
local advTurbine = table.deepcopy(data.raw["generator"]["steam-turbine"])
local advPipe = table.deepcopy(data.raw["heat-pipe"]["heat-pipe"])
local advReactor = table.deepcopy(data.raw["reactor"]["nuclear-reactor"])



---Advanced Heat Exchanger---
  --Constants
advExchange.name = "heat-exchanger-2"
advExchange.minable = {hardness = 0.2, mining_time = 0.5, result = "heat-exchanger-2"}
  --Changing
advExchange.energy_consumption = "40MW"
advExchange.target_temperature = steamTemp --Changes
advExchange.energy_source =
    {
      type = "heat",
      max_temperature = maxTemp, --Changes
      specific_heat = "1MJ",
      max_transfer = "2GW",
      connections =
      {
        {
          position = {0, 0.5},
          direction = defines.direction.south
        }
      },
      pipe_covers =

        make_4way_animation_from_spritesheet(
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings.png",
          line_length = 4,
          width = 32,
          height = 32,
          direction_count = 4,
          hr_version = {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-endings.png",
            line_length = 4,
            width = 64,
            height = 64,
            direction_count = 4,
            scale = 0.5
          }
        })

    }


---Advanced Steam Turbine---
  --Constants
advTurbine.name = "steam-turbine-2"
advTurbine.minable = {mining_time = 1, result = "steam-turbine-2"}
  --Changing
advTurbine.fluid_usage_per_tick = 1 --Reduces number of turbines needed
advTurbine.maximum_temperature = steamTemp 


---Advanced Heat Pipe---
  --Constants
advPipe.name = "heat-pipe-2"
advPipe.minable = {hardness = 0.2, mining_time = 0.5, result = "heat-pipe-2"}
  --Changing
advPipe.heat_buffer =
    {
      max_temperature = maxTemp, --Changes
      specific_heat = "1MJ",
      max_transfer = "1GW",
      connections =
      {
        {
          position = {0, 0},
          direction = defines.direction.north
        },
        {
          position = {0, 0},
          direction = defines.direction.east
        },
        {
          position = {0, 0},
          direction = defines.direction.south
        },
        {
          position = {0, 0},
          direction = defines.direction.west
        }
      }
    }

---Advanced Nuclear Reactor---
  --Constants
advReactor.name = "nuclear-reactor-2"
advReactor.minable = {mining_time = 1.5, result = "nuclear-reactor-2"}
  --Changing
advReactor.consumption = reactorPower
advReactor.burner =
    {
      fuel_category = "nuclear",
      effectivity = reactorEff, --Changes
      fuel_inventory_size = 1,
      burnt_inventory_size = 1
    }
advReactor.heat_buffer =
    {
      max_temperature = maxTemp, --Changes
      specific_heat = "10MJ",
      max_transfer = "10GW", --Changes if needed
      connections =
      {
        {
          position = {-2, -2},
          direction = defines.direction.north
        },
        {
          position = {0, -2},
          direction = defines.direction.north
        },
        {
          position = {2, -2},
          direction = defines.direction.north
        },
        {
          position = {2, -2},
          direction = defines.direction.east
        },
        {
          position = {2, 0},
          direction = defines.direction.east
        },
        {
          position = {2, 2},
          direction = defines.direction.east
        },
        {
          position = {2, 2},
          direction = defines.direction.south
        },
        {
          position = {0, 2},
          direction = defines.direction.south
        },
        {
          position = {-2, 2},
          direction = defines.direction.south
        },
        {
          position = {-2, 2},
          direction = defines.direction.west
        },
        {
          position = {-2, 0},
          direction = defines.direction.west
        },
        {
          position = {-2, -2},
          direction = defines.direction.west
        }
      }
    }

---Put new entities into data.raw---
data.raw["boiler"]["heat-exchanger-2"] = advExchange
data.raw["generator"]["steam-turbine-2"] = advTurbine
data.raw["heat-pipe"]["heat-pipe-2"] = advPipe
data.raw["reactor"]["nuclear-reactor-2"] = advReactor