local iron_density = deadlock.get_item_stack_density("iron-plate", "item")
local gear_density = deadlock.get_item_stack_density("iron-gear-wheel", "item")
local gear = {
  type = "recipe",
  name = "stacked-iron-gear-wheel",
  normal = {
    enabled = true,
    energy_required = 0.5 * gear_density,
    ingredients = {{"deadlock-stack-iron-plate", 2}},
    result = "deadlock-stack-iron-gear-wheel",
  },
  expensive = {
    enabled = true,
    energy_required = 0.5 * gear_density,
    ingredients = {{"deadlock-stack-iron-plate", 4}},
    result = "deadlock-stack-iron-gear-wheel",
  },
}

data:extend({gear})
-- add the unlock of the tech for the steel recipe to the steel tech
-- table.insert(data.raw.technology["steel-processing"].effects, {recipe = "stacked-steel-plate", type = "unlock-recipe"})

local iron_density = deadlock.get_item_stack_density("iron-plate", "item")
local copper_density = deadlock.get_item_stack_density("copper-plate", "item")
local coal_density = deadlock.get_item_stack_density("coal", "item")
local plastic_bar_density = deadlock.get_item_stack_density("plastic-bar", "item")
local cable_density = deadlock.get_item_stack_density("copper-cable", "item")
local electronic_circuit_density = deadlock.get_item_stack_density("electronic-circuit", "item")
local advanced_circuit_density = deadlock.get_item_stack_density("advanced-circuit", "item")
local processing_unit_density = deadlock.get_item_stack_density("processing-unit", "item")
-- we assume all these are equal. Otherwise ratios will be screwed

local stacked_cable = {
  type = "recipe",
  name = "stacked-copper-cable",
  normal = {
    enabled = true,
    energy_required = 0.5 * cable_density,
    ingredients = {{"deadlock-stack-copper-plate", 1}},
    results = {{"deadlock-stack-copper-cable",2}},
  },
  expensive = {
      enabled = true,
      energy_required = 0.5 * cable_density,
      ingredients = {{"deadlock-stack-copper-plate", 1}},
      results = {{"deadlock-stack-copper-cable",2}},
  },
}

local stacked_electronic_circuit = {
  type = "recipe",
  name = "stacked-electronic-circuit",
  normal = {
    enabled = true,
    energy_required = 0.5 * electronic_circuit_density,
    ingredients = {{"deadlock-stack-copper-cable", 3}, {"deadlock-stack-iron-plate", 1}},
    result = "deadlock-stack-electronic-circuit",
  },
  expensive = {
      enabled = true,
      energy_required = 0.5 * electronic_circuit_density,
      ingredients = {{"deadlock-stack-copper-cable", 8}, {"deadlock-stack-iron-plate", 2}},
      result = "deadlock-stack-electronic-circuit",
  },
}

local stacked_advanced_circuit = {
  type = "recipe",
  name = "stacked-advanced-circuit",
  normal = {
    enabled = true,
    energy_required = 6.0 * advanced_circuit_density,
    ingredients = {{"deadlock-stack-copper-cable", 4}, {"deadlock-stack-electronic-circuit", 2}, {"deadlock-stack-plastic-bar", 2}},
    result = "deadlock-stack-advanced-circuit",
  },
  expensive = {
      enabled = true,
      energy_required = 6.0 * advanced_circuit_density,
      ingredients = {{"deadlock-stack-copper-cable", 8}, {"deadlock-stack-electronic-circuit", 2}, {"deadlock-stack-plastic-bar", 4}},
      result = "deadlock-stack-advanced-circuit",
  },
}

local stacked_processing_unit = {
  type = "recipe",
  name = "stacked-processing-unit",
  category = "crafting-with-fluid",
  normal = {
    enabled = true,
    energy_required = 10.0 * advanced_circuit_density,
    ingredients = {
        {type="item", name="deadlock-stack-advanced-circuit", amount=2},
        {type="item", name="deadlock-stack-electronic-circuit", amount=20},
        {type="fluid", name="sulfuric-acid", amount=5*processing_unit_density}
    },
    result = "deadlock-stack-processing-unit",
  },
  expensive = {
      enabled = true,
      energy_required = 10.0 * advanced_circuit_density,
      ingredients = {
          {type="item", name="deadlock-stack-advanced-circuit", amount=2},
          {type="item", name="deadlock-stack-electronic-circuit", amount=20},
          {type="fluid", name="sulfuric-acid", amount=10*processing_unit_density}
      },
      result = "deadlock-stack-processing-unit",
  },
}

local stacked_plastic_bar = {
  type = "recipe",
  name = "stacked-plastic-bar",
  category = "chemistry",
  energy_required = 1 * plastic_bar_density,
  enabled = true,
  ingredients =
  {
    {type="fluid", name="petroleum-gas", amount=20 * plastic_bar_density},
    {type="item", name="deadlock-stack-coal", amount=1}
  },
  results=
  {
    {type="item", name="deadlock-stack-plastic-bar", amount=2}
  },
  crafting_machine_tint =
  {
    primary = {r = 1.000, g = 1.000, b = 1.000, a = 1.000}, -- #fefeffff
    secondary = {r = 0.771, g = 0.771, b = 0.771, a = 1.000}, -- #c4c4c4ff
    tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000}, -- #c3a9c2ff
    quaternary = {r = 0.000, g = 0.000, b = 0.000, a = 1.000}, -- #000000ff
  }
}

data:extend({stacked_cable})
data:extend({stacked_electronic_circuit})
data:extend({stacked_advanced_circuit})
data:extend({stacked_processing_unit})
data:extend({stacked_plastic_bar})

-- enable productivity modules on the stacked version of intermediate products
for k, v in pairs(data.raw.module) do
  if v.name:find("productivity%-module") and v.limitation then
    table.insert(v.limitation, "stacked-iron-gear-wheel")
    table.insert(v.limitation, "stacked-copper-cable")
    table.insert(v.limitation, "stacked-electronic-circuit")
    table.insert(v.limitation, "stacked-advanced-circuit")
    table.insert(v.limitation, "stacked-processing-unit")
    table.insert(v.limitation, "stacked-plastic-bar")
  end
end
