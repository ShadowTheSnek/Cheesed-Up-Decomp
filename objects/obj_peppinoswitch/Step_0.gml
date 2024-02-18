if (global.switchbuffer > 0)
    global.switchbuffer--
if (sprite_index == spr_peppinoswitch2 && instance_exists(obj_charswitch_intro) && obj_charswitch_intro.state != states.fall)
    image_index = 0
if (sprite_index == spr_peppinoswitch2 && floor(image_index) == (image_number - 1))
{
    with (obj_player1)
    {
        visible = true
        gustavodash = 0
        ratmount_movespeed = 8
        isgustavo = 0
        state = states.normal
        jumpAnim = 0
        sprite_index = spr_player_idle
        brick = 0
        x = obj_peppinoswitch.x
        y = obj_peppinoswitch.y
        global.switchbuffer = 100
        self.player_destroy_sounds()
        self.player_init_sounds()
        if (room == street_jail)
        {
            with (obj_music)
            {
                if (music != noone)
                    fmod_event_instance_set_parameter(music.event, "state", 0, 1)
            }
        }
        else if (room == forest_G1)
        {
            with (obj_music)
            {
                if (music != noone)
                    fmod_event_instance_set_parameter(music.event, "state", 0, 1)
            }
        }
    }
    sprite_index = spr_gustavosign
}
if (sprite_index == spr_gustavosign && global.panic != escape)
    visible = false
else
    visible = true
