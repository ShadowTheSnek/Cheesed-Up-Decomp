if (global.levelcomplete && (!global.freezercutscene))
{
    global.levelcomplete = 0
    with (obj_player1)
    {
        other.backx = backtohubstartx
        other.backy = backtohubstarty
    }
    currentroom = room
    dragonactor = 127112
    scene_info = [[gml_Script_cutscene_medieval_start], [gml_Script_cutscene_waitfor_sprite, obj_player1], [function() //gml_Script_anon@322@gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (obj_actor)
        {
            if (id != other.dragonactor)
            {
                sprite_index = spr_idle
                visible = true
            }
        }
        cutscene_end_action()
    }
], [gml_Script_cutscene_set_player_visible, 0], [gml_Script_cutscene_player_idleanim], [gml_Script_cutscene_player_float, 1], [gml_Script_cutscene_player_pos_lerp, 832, 288, 0.07], [gml_Script_cutscene_wait, 40], [function() //gml_Script_anon@658@gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (dragonactor)
        {
            image_speed = 0.35
            sprite_index = spr_cheesedragon_goingup
            repeat (3)
                create_debris(x, y, 3385)
        }
        cutscene_end_action()
    }
], [function() //gml_Script_anon@854@gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (dragonactor)
        {
            y -= 5
            if (y < -100)
            {
                with (other)
                    cutscene_end_action()
            }
        }
    }
], [gml_Script_cutscene_change_room, hub_grandpizzardtower], [gml_Script_cutscene_set_player_visible, 0], [gml_Script_cutscene_set_player_pos, 1407, 415], [gml_Script_cutscene_wait, 20], [function() //gml_Script_anon@1141@gml_RoomCC_hub_freezerlobby_3_Create
    {
        dragonactor = gml_Script_instance_create(1407, -125, obj_actor)
        dragonactor.sprite_index = spr_cheesedragon_idle
        dragonactor.image_speed = 0.35
        cutscene_end_action()
    }
], [function() //gml_Script_anon@1334@gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (dragonactor)
        {
            y += 5
            if place_meeting(x, (y + 128), obj_solid)
            {
                sprite_index = spr_cheesedragon_stomp
                image_index = 0
                with (other)
                    cutscene_end_action()
            }
        }
    }
], [function() //gml_Script_anon@1571@gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (dragonactor)
        {
            y += 5
            if place_meeting(x, (y + 5), obj_solid)
            {
                while (!(place_meeting(x, (y + 1), obj_solid)))
                    y++
                with (other)
                    cutscene_end_action()
            }
        }
    }
], [gml_Script_cutscene_soundeffect, "event:/sfx/pep/groundpound"], [gml_Script_cutscene_camera_shake, 5, (3 / room_speed)], [function() //gml_Script_anon@1885@gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (dragonactor)
        {
            if (floor(image_index) == (image_number - 1))
            {
                sprite_index = spr_cheesedragon_idle
                with (other)
                    cutscene_end_action()
            }
        }
    }
], [gml_Script_cutscene_wait, 50], [function() //gml_Script_anon@2112@gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (obj_freezerblock)
            instance_destroy()
        cutscene_end_action()
    }
], [gml_Script_cutscene_wait, 50], [gml_Script_cutscene_change_room, hub_plains], [gml_Script_cutscene_set_player_visible, 0], [gml_Script_cutscene_set_player_pos, 190, 600], [gml_Script_cutscene_soundeffect, "event:/sfx/pep/groundpound"], [gml_Script_cutscene_camera_shake, 5, (3 / room_speed)], [gml_Script_cutscene_wait, 50], [function() //gml_Script_anon@2449@gml_RoomCC_hub_freezerlobby_3_Create
    {
        with (obj_freezerblock)
            instance_destroy()
        cutscene_end_action()
    }
], [gml_Script_cutscene_wait, 50], [gml_Script_cutscene_change_room, currentroom], [gml_Script_cutscene_set_player_pos, backx, backy], [gml_Script_cutscene_set_player_visible, 1], [gml_Script_cutscene_player_float, 0], [function() //gml_Script_anon@2716@gml_RoomCC_hub_freezerlobby_3_Create
    {
        instance_destroy(obj_actor)
        with (obj_player)
        {
            if (object_index != obj_player2 || global.coop)
            {
                state = states.normal
                x = backtohubstartx
                y = backtohubstarty
            }
        }
        global.levelcomplete = 0
        global.freezercutscene = 1
        quick_ini_write_real(get_savefile_ini(), "cutscene", "freezer", 1)
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
