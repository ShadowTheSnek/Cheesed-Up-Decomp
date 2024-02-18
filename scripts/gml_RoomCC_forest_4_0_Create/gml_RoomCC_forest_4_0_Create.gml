if ((!global.pizzadelivery) && global.pizzasdelivered < 5 && global.panic == 0)
{
    if (!global.failcutscene)
    {
        if (global.pizzasdelivered <= 0)
            scene_info = [[gml_Script_cutscene_set_sprite, obj_gustavo, spr_gustavo_makepizza, 0.35, -1], [gml_Script_cutscene_gustavo_start], [gml_Script_cutscene_wait, 30], [gml_Script_cutscene_set_sprite, obj_gustavo, spr_gustavo_showpizza, 0.35, -1], [gml_Script_cutscene_wait, 10], [gml_Script_cutscene_move_player, obj_player1, (obj_gustavo.x - 48), 6, 16], [gml_Script_cutscene_set_sprite, obj_player1, spr_player_gnomepizza, 0.35, 1], [gml_Script_cutscene_set_sprite, obj_gustavo, spr_gustavo_givepizza, 0.35, -1], [gml_Script_cutscene_gustavo_end]]
        else
            scene_info = [[gml_Script_cutscene_set_sprite, obj_gustavo, spr_gustavo_showpizza, 0.35, -1]]
    }
    else
        scene_info = [[gml_Script_cutscene_gustavofail_start], [gml_Script_cutscene_wait, 20], [gml_Script_cutscene_set_sprite, obj_gustavo, spr_gustavo_scream, 0.35, -1], [gml_Script_cutscene_waitfor_sprite, obj_gustavo], [gml_Script_cutscene_set_sprite, obj_gustavo, spr_gustavo_defeated, 0.35, -1], [gml_Script_cutscene_wait, 50], [gml_Script_cutscene_set_sprite, obj_gustavo, spr_gustavo_poweringup, 0.35, -1], [gml_Script_cutscene_set_sprite, obj_player1, spr_player_gnomecutscene2, 0.35, 1], [gml_Script_cutscene_waitfor_sprite, obj_gustavo], [gml_Script_cutscene_set_sprite, obj_gustavo, spr_gustavo_grab, 0.35, -1], [gml_Script_cutscene_set_hsp, obj_gustavo, -12], [gml_Script_cutscene_set_sprite, obj_player1, spr_player_gnomecutscene3, 0.35, 1], [gml_Script_cutscene_waitfor_sprite, obj_player1], [gml_Script_cutscene_set_sprite, obj_player1, spr_player_gnomecutscene4, 0.35, 1], [gml_Script_cutscene_check_collision, obj_gustavo, obj_player1], [gml_Script_cutscene_set_hsp, obj_gustavo, 0], [gml_Script_cutscene_gustavofail_end, 100], [gml_Script_cutscene_move_actor, obj_gustavo, obj_gustavo.xstart, obj_gustavo.ystart, 0.05], [gml_Script_cutscene_set_sprite, obj_gustavo, spr_gustavo_showpizza, 0.35, -1]]
}
else
    scene_info = [[gml_Script_cutscene_wait, 2]]
