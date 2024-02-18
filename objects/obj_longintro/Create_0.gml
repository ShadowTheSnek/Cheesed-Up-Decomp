scene = -2
scenebuffer = 0
instance_destroy(obj_pigtotal)
draw_set_font(gml_Script_lang_get_font("creditsfont"))
draw_set_halign(fa_left)
draw_set_valign(fa_top)
text = scr_compile_icon_text(gml_Script_lang_get_value("menu_skip"))
showtext = 0
skipbuffer = 0
startbuffer = 0
with (gml_Script_instance_create((room_width / 2), (room_height / 2), obj_logoprop))
{
    depth = -1
    sprite_index = spr_intro_tourdepizza
}
with (obj_player)
    state = states.titlescreen
oldintro = steam_deck().is_steamdeck
