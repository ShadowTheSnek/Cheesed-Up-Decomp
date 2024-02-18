pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER WITH THE DEAD"
global.pepanimatronic = 1
global.gameframe_caption_text = gml_Script_lang_get_value("caption_kidsparty")
if (global.panic == 1)
{
    var lay = layer_get_id("Backgrounds_still1")
    layer_background_sprite(layer_background_get_id_fix(lay), bg_kidsparty_empty)
}
