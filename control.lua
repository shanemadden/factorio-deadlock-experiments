local function on_load(event)
  for _, force in pairs(game.forces) do
    if force.technologies["steel-processing"].researched then
      force.recipes["stacked-steel-plate"].enabled = true
    end
  end
end

script.on_init(on_load)