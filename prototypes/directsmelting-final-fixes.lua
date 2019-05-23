for _, recipe in ipairs({"stacked-copper-plate", "stacked-iron-plate", "stacked-stone-brick", "stacked-steel-plate"}) do
  table.insert(data.raw.module["productivity-module"].limitation, recipe)
  table.insert(data.raw.module["productivity-module-2"].limitation, recipe)
  table.insert(data.raw.module["productivity-module-3"].limitation, recipe)
  -- bob's productivity-module-[4-8]
  for i = 4, 8 do
    local module_name = string.format("productivity-module-%d", i)
    if data.raw.module[module_name] then
      table.insert(data.raw.module[module_name].limitation, recipe)
    end
  end
  -- bob's raw-productivity-module-[1-8]
  for i = 1, 8 do
    local module_name = string.format("raw-productivity-module-%d", i)
    if data.raw.module[module_name] then
      table.insert(data.raw.module[module_name].limitation, recipe)
    end
  end
end