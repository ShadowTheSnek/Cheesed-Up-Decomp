pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER ISLAND"
if global.panic
{
    var lay = layer_get_id("Backgrounds_still1")
    layer_background_sprite(layer_background_get_id_fix(lay), bg_kungfupanic)
    var lay4 = layer_get_id("Backgrounds_scroll")
    layer_background_sprite(layer_background_get_id_fix(lay4), bg_cityfiresmoke)
}
