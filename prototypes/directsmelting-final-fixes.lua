for _, recipe in ipairs({"stacked-copper-plate", "stacked-iron-plate", "stacked-stone-brick", "stacked-steel-plate"}) do
  if data.raw.recipe[recipe] then
    if data.raw.module["productivity-module"] and data.raw.module["productivity-module"] then
      table.insert(data.raw.module["productivity-module"].limitation, recipe)
    end
    if data.raw.module["productivity-module-2"] and data.raw.module["productivity-module-2"] then
      table.insert(data.raw.module["productivity-module-2"].limitation, recipe)
    end
    if data.raw.module["productivity-module-3"] and data.raw.module["productivity-module-3"] then
      table.insert(data.raw.module["productivity-module-3"].limitation, recipe)
    end
    -- bob's productivity-module-[4-8]
    for i = 4, 8 do
      local module_name = string.format("productivity-module-%d", i)
      if data.raw.module[module_name] and data.raw.module[module_name].limitation then
        table.insert(data.raw.module[module_name].limitation, recipe)
      end
    end
    -- bob's raw-productivity-module-[1-8]
    for i = 1, 8 do
      local module_name = string.format("raw-productivity-module-%d", i)
      if data.raw.module[module_name] and data.raw.module[module_name].limitation then
        table.insert(data.raw.module[module_name].limitation, recipe)
      end
    end
  end
end
