
local setting_value = settings.startup["experiments-densityoverride"].value
local deadlock_stack_size = settings.startup["deadlock-stack-size"].value
local multiplier
-- 1 is 'same inventory slot density as the base item when stacked', ie, disabled, the behavior of the beltboxes mod without this mod. Do nothing.
if setting_value == "1" then
    return
end
-- if 'matches stack size' setting is selected, look that stack size up from the other mod's setting - otherwise, tonumber
if setting_value == "match-stack-size" then
    multiplier = settings.startup["deadlock-stack-size"].value
else
    multiplier = tonumber(setting_value)
end
-- run through all stacks, set their stack size to multiplier of what we'd normally set 'em to
local item_types = {
    "item",
    "ammo",
    "gun",
    "tool",
    "repair-tool",
    "module",
    "item-with-label",
    "item-with-tags",
    "capsule",
}
for k, v in pairs(data.raw.item) do
    -- if matches scheme and there's an underlying item then update
    if string.match(k, "deadlock%-stack%-") then
        -- looks like a stacked item, chop off the prefix
        local parent_item = string.sub(k, 16)
        for _, item_type in ipairs(item_types) do
            if data.raw[item_type][parent_item] then
                -- found parent item - let's resync the stacked item's stack size to the appropriate multiplier of the base item's stack size
                data.raw.item[k].stack_size = math.floor((data.raw[item_type][parent_item].stack_size / deadlock_stack_size) * multiplier)
            end
        end
    end
end
