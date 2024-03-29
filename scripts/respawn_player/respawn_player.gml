function respawn_player() //gml_Script_respawn_player
{
    with (obj_player1)
    {
        if (room != Mainmenu && room != tower_outside && room != Realtitlescreen && room != Longintro && room != Endingroom && room != Johnresurrectionroom && room != Creditsroom && room != rank_room)
        {
            with (instance_nearest(x, y, obj_checkpoint_invis))
                event_user(0)
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = (3 / room_speed)
            }
            if (state == states.ghostpossess)
            {
                state = states.ghost
                sprite_index = spr_ghostidle
            }
            var s = state
            notification_push((8 << 0), [id, s])
            state = states.actor
            visible = false
            hsp = 0
            sound_play_3d("event:/sfx/pep/groundpound", x, (room_height - 100))
            with (gml_Script_instance_create(x, (y + 540), obj_technicaldifficulty))
                playerid = other.id
            vsp = 10
        }
        else
        {
            state = states.titlescreen
            x = -100
            y = -100
        }
    }
}

