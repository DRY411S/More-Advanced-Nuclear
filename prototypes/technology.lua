local turbinePower = settings.startup["dry-turbine-power-output"].value or 1
data:extend(
{
  {
    type = "technology",
    name = "more-nuclear-power",
    icon = "__base__/graphics/technology/nuclear-power.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "dry-nuclear-reactor"
      },
      {
        type = "unlock-recipe",
        recipe = "dry-heat-exchanger"
      },
      {
        type = "unlock-recipe",
        recipe = "dry-heat-pipe"
      },
      {
        type = "unlock-recipe",
        recipe = "dry-steam-turbine"
      }
    },
    prerequisites = {"nuclear-power"},
    unit =
    {
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30,
      count = 1000*turbinePower
    },
    order = "e-p-b-c"
  },
}
)