depth = 1
global.afterimage_list = ds_list_create()
alpha = array_create((8 << 0), 1)
alpha[(2 << 0)] = 0.5
color1 = shader_get_uniform(shd_mach3effect, "color1")
color2 = shader_get_uniform(shd_mach3effect, "color2")
mach_color1 = make_colour_rgb(96, 208, 72)
mach_color2 = make_colour_rgb(248, 0, 0)
