if (global.levelcomplete && (!global.factorycutscene))
{
    currentroom = room
    global.factorycutscene = 1
    scene_info = [[gml_Script_cutscene_entrance_start], [gml_Script_cutscene_waitfor_sprite, obj_player1], [gml_Script_cutscene_player_idleanim], [gml_Script_cutscene_change_room, hub_laundryroom], [gml_Script_cutscene_set_player_visible, 0], [gml_Script_cutscene_set_player_pos, 428, 296], [gml_Script_cutscene_wait, 100], [gml_Script_cutscene_change_room, hub_pizzaboypizzpizza], [gml_Script_cutscene_set_player_visible, 0], [gml_Script_cutscene_set_player_pos, 684, 506], [gml_Script_cutscene_wait, 100], [gml_Script_cutscene_change_room, currentroom], [gml_Script_cutscene_set_player_visible, 1], [gml_Script_cutscene_factory_end], [gml_Script_cutscene_save_game]]
}
else if global.levelcomplete
{
    global.levelcomplete = 0
    scene_info = [[gml_Script_cutscene_save_game]]
}
else
    scene_info = [[gml_Script_cutscene_wait, 20]]
