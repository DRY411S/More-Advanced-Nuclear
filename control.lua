function replace_entities()
  local surface = game.player.surface
  local forc = game.player.force
  for _,ent in pairs(surface.find_entities_filtered{name = "nuclear-reactor"}) do
    local pos = ent.position
	local dir = ent.direction
	ent.destroy()
	surface.create_entity{name="nuclear-reactor-2",position = pos,direction = dir,force = forc}
  end
  for _,ent in pairs(surface.find_entities_filtered{name = "heat-pipe"}) do
    local pos = ent.position
	local dir = ent.direction
	ent.destroy()
	surface.create_entity{name="heat-pipe-2",position = pos,direction = dir,force = forc}
  end
  for _,ent in pairs(surface.find_entities_filtered{name = "heat-exchanger"}) do
    local pos = ent.position
	local dir = ent.direction
	ent.destroy()
	surface.create_entity{name="heat-exchanger-2",position = pos,direction = dir,force = forc}
  end
  for _,ent in pairs(surface.find_entities_filtered{name = "steam-turbine"}) do
    local pos = ent.position
	local dir = ent.direction
	ent.destroy()
	surface.create_entity{name="steam-turbine-2",position = pos,direction = dir,force = forc}
  end
end
commands.add_command("replace-nuclear","Replaces all nuclear components on your map with the components from the Advanced Nuclear mod.",replace_entities)
  