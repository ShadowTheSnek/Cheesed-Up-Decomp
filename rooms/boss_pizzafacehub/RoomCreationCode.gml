pal_swap_init_system(shd_pal_swapper)
notification_push((49 << 0), [boss_pizzafacehub])
global.gameframe_caption_text = gml_Script_lang_get_value("caption_boss_pizzafacehub")
ini_open_from_string(obj_savesystem.ini_str)
ini_write_real("w5stick", "bosskey", 1)
obj_savesystem.ini_str = ini_close()
gamesave_async_save()
with (obj_player1)
{
    tauntstoredstate = states.normal
    landAnim = 1
    state = states.animation
    buffer = 100
    sprite_index = spr_slipbanan2
    image_index = (sprite_get_number(spr_slipbanan2) - 1)
    image_speed = 0.35
}
global.roommessage = "PIZZA TOWER ISLAND"
global.leveltorestart = tower_finalhallway
