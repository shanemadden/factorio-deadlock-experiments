local copper = {
  type = "recipe",
  name = "stacked-copper-plate",
  category = "smelting",
  energy_required = 16,
  ingredients = {{ "deadlock-stack-copper-ore", 1}},
}
if settings.startup["experiments-directsmelting-outputstacks"].value then
  copper.result = "deadlock-stack-copper-plate"
else
  copper.result = "copper-plate"
  copper.result_count = 5
end

local iron = {
  type = "recipe",
  name = "stacked-iron-plate",
  category = "smelting",
  energy_required = 16,
  ingredients = {{ "deadlock-stack-iron-ore", 1}},
}
if settings.startup["experiments-directsmelting-outputstacks"].value then
  iron.result = "deadlock-stack-iron-plate"
else
  iron.result = "iron-plate"
  iron.result_count = 5
end

local stone = {
  type = "recipe",
  name = "stacked-stone-brick",
  category = "smelting",
  energy_required = 16,
  ingredients = {{ "deadlock-stack-stone", 1}},
}
if settings.startup["experiments-directsmelting-outputstacks"].value then
  stone.result = "deadlock-stack-stone-brick"
else
  stone.result = "stone-brick"
  stone.result_count = 5
end

local steel = {
  type = "recipe",
  name = "stacked-steel-plate",
  category = "smelting",
}
if settings.startup["experiments-directsmelting-outputstacks"].value then
  steel.normal = {
    enabled = false,
    energy_required = 80,
    ingredients = {{"deadlock-stack-iron-plate", 5}},
    result = "deadlock-stack-steel-plate"
  }
  steel.expensive = {
    enabled = false,
    energy_required = 160,
    ingredients = {{"deadlock-stack-iron-plate", 10}},
    result = "deadlock-stack-steel-plate"
  }
else
  steel.normal = {
    enabled = false,
    energy_required = 80,
    ingredients = {{"deadlock-stack-iron-plate", 5}},
    result = "steel-plate",
    result_count = 5,
  }
  steel.expensive = {
    enabled = false,
    energy_required = 160,
    ingredients = {{"deadlock-stack-iron-plate", 10}},
    result = "steel-plate",
    result_count = 5,
  }
end
data:extend({copper, iron, stone, steel})
-- add the unlock of the tech for the steel recipe to the steel tech
table.insert(data.raw.technology["steel-processing"].effects, {recipe = "stacked-steel-plate", type = "unlock-recipe"})
