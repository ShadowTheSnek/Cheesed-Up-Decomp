if (global.levelcomplete && (!global.kidspartycutscene))
{
    currentroom = room
    mechactor = -4
    scene_info = [[gml_Script_cutscene_entrance_start], [gml_Script_cutscene_waitfor_sprite, obj_player1], [gml_Script_cutscene_player_idleanim], [gml_Script_cutscene_change_room, hub_warpath], [gml_Script_cutscene_set_player_visible, 0], [gml_Script_cutscene_set_player_pos, 1848, 750], [gml_Script_cutscene_player_float, 1], [gml_Script_cutscene_wait, 50], [function() //gml_Script_anon@378@gml_RoomCC_hub_pizzaboypizzpizza_3_Create
    {
        mechactor = gml_Script_instance_create(1632, 416, obj_actor)
        mechactor.sprite_index = spr_pizzamech
        cutscene_end_action()
    }
], [function() //gml_Script_anon@523@gml_RoomCC_hub_pizzaboypizzpizza_3_Create
    {
        with (mechactor)
        {
            y -= 2
            if (y < 118)
            {
                y = 118
                with (other)
                    cutscene_end_action()
            }
        }
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = (3 / room_speed)
        }
    }
], [gml_Script_cutscene_wait, 100], [gml_Script_cutscene_change_room, currentroom], [gml_Script_cutscene_set_player_visible, 1], [gml_Script_cutscene_player_float, 0], [function() //gml_Script_anon@891@gml_RoomCC_hub_pizzaboypizzpizza_3_Create
    {
        with (obj_player)
        {
            state = states.normal
            x = backtohubstartx
            y = backtohubstarty
        }
        global.levelcomplete = 0
        global.kidspartycutscene = 1
        quick_ini_write_real(get_savefile_ini(), "cutscene", "kidsparty", 1)
        cutscene_end_action()
    }
], [gml_Script_cutscene_save_game]]
}
else if global.levelcomplete
{
    global.levelcomplete = 0
    scene_info = [[gml_Script_cutscene_save_game]]
}
else
    scene_info = [[gml_Script_cutscene_wait, 20]]
