data:extend({
	-- startup
	{
		type = "bool-setting",
		name = "experiments-sciencestacking",
		order = "a",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "experiments-directsmelting",
		order = "b",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "experiments-directsmelting-outputstacks",
		order = "c",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "experiments-directcrafting",
		order = "d",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "string-setting",
		name = "experiments-densityoverride",
		order = "e",
		setting_type = "startup",
		default_value = "1",
		allowed_values = {
			"match-stack-size",
			"1",
			"2",
			"5",
			"10"
		},
	},
})
