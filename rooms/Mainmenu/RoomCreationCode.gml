instance_destroy(obj_pigtotal)
global.gameframe_caption_text = gml_Script_lang_get_value_newline("caption_mainmenu")
with (gml_Script_instance_create(0, 0, obj_loadingscreen))
{
    group_arr = ["menugroup", "baddiegroup"]
    offload_arr = ["introgroup"]
}
with (obj_player)
    state = states.titlescreen
global.leveltorestart = -4
global.leveltosave = -4
global.startgate = 0
global.exitrank = 0
