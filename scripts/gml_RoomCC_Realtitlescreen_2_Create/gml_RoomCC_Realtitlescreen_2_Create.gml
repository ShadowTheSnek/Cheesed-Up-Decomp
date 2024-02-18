if (!variable_global_exists("titlecutscene"))
    global.titlecutscene = 1
if global.titlecutscene
    scene_info = [[gml_Script_cutscene_title_start], [gml_Script_cutscene_set_sprite, obj_player1, spr_file2, 0.35, 1], [gml_Script_cutscene_wait, 120], [gml_Script_cutscene_title_middle], [gml_Script_cutscene_set_sprite, obj_player1, spr_player_bossintro, 0.3, -1], [gml_Script_cutscene_set_vsp, obj_player1, -6], [gml_Script_cutscene_waitfor_sprite, obj_player1], [gml_Script_cutscene_title_end]]
else
    scene_info = [[gml_Script_cutscene_wait, 2]]
