if settings.startup["experiments-sciencestacking"].value then
	require("prototypes.science")
end
if settings.startup["experiments-directsmelting"].value then
	require("prototypes.directsmelting")
end
if settings.startup["experiments-directcrafting"].value then
	require("prototypes.directcrafting")
end
