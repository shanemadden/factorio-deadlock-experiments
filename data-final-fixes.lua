if settings.startup["experiments-sciencestacking"].value then
	require("prototypes.bobscience")
end
if settings.startup["experiments-directsmelting"].value then
	require("prototypes.directsmelting-final-fixes")
end
require("prototypes.densityoverride")
