pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER ISLAND"
global.leveltorestart = room
global.gameframe_caption_text = gml_Script_lang_get_value("caption_boss_pizzaface")
global.level_minutes = 0
global.level_seconds = 0
with (obj_player)
{
    backtohubroom = tower_outside
    backtohubstartx = 522
    backtohubstarty = 2328
}
