local copper_density = deadlock.get_item_stack_density("copper-ore", "item")
local copper = {
  type = "recipe",
  name = "stacked-copper-plate",
  category = "smelting",
  energy_required = 3.2 * copper_density,
  ingredients = {{ "deadlock-stack-copper-ore", 1}},
}
if settings.startup["experiments-directsmelting-outputstacks"].value then
  copper.result = "deadlock-stack-copper-plate"
else
  copper.result = "copper-plate"
  copper.result_count = copper_density
end

local iron_density = deadlock.get_item_stack_density("iron-ore", "item")
local iron = {
  type = "recipe",
  name = "stacked-iron-plate",
  category = "smelting",
  energy_required = 3.2 * iron_density,
  ingredients = {{ "deadlock-stack-iron-ore", 1}},
}
if settings.startup["experiments-directsmelting-outputstacks"].value then
  iron.result = "deadlock-stack-iron-plate"
else
  iron.result = "iron-plate"
  iron.result_count = iron_density
end

local stone_density = deadlock.get_item_stack_density("stone", "item")
local stone = {
  type = "recipe",
  name = "stacked-stone-brick",
  category = "smelting",
  energy_required = 3.2 * stone_density,
  ingredients = {{ "deadlock-stack-stone", 1}},
}
if settings.startup["experiments-directsmelting-outputstacks"].value then
  stone.result = "deadlock-stack-stone-brick"
else
  stone.result = "stone-brick"
  stone.result_count = stone_density
end

local iron_plate_density = deadlock.get_item_stack_density("iron-plate", "item")
local steel = {
  type = "recipe",
  name = "stacked-steel-plate",
  category = "smelting",
}
if settings.startup["experiments-directsmelting-outputstacks"].value then
  steel.normal = {
    enabled = false,
    energy_required = 16 * iron_plate_density,
    ingredients = {{"deadlock-stack-iron-plate", 5}},
    result = "deadlock-stack-steel-plate"
  }
  steel.expensive = {
    enabled = false,
    energy_required = 32 * iron_plate_density,
    ingredients = {{"deadlock-stack-iron-plate", 10}},
    result = "deadlock-stack-steel-plate"
  }
else
  steel.normal = {
    enabled = false,
    energy_required = 16 * iron_plate_density,
    ingredients = {{"deadlock-stack-iron-plate", 5}},
    result = "steel-plate",
    result_count = iron_plate_density,
  }
  steel.expensive = {
    enabled = false,
    energy_required = 32 * iron_plate_density,
    ingredients = {{"deadlock-stack-iron-plate", 10}},
    result = "steel-plate",
    result_count = iron_plate_density,
  }
end
data:extend({copper, iron, stone, steel})
-- add the unlock of the tech for the steel recipe to the steel tech
table.insert(data.raw.technology["steel-processing"].effects, {recipe = "stacked-steel-plate", type = "unlock-recipe"})
