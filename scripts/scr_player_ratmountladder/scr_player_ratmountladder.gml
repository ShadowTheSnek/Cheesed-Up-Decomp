function scr_player_ratmountladder() //gml_Script_scr_player_ratmountladder
{
    movespeed = 0
    hsp = 0
    if (key_up && (!hooked))
    {
        sprite_index = spr_lonegustavoladder
        vsp = -6
        if (steppybuffer > 0)
            steppybuffer--
        else
        {
            create_particle(x, (y + 43), (1 << 0), 0)
            steppybuffer = 12
            sound_play_3d("event:/sfx/pep/step", x, y)
        }
        image_speed = 0.35
    }
    else if (key_down && (!hooked))
    {
        sprite_index = spr_lonegustavoladderdown
        vsp = 10
        image_speed = -0.35
    }
    else
    {
        sprite_index = spr_lonegustavoladder
        vsp = 0
        image_speed = 0
    }
    ladderbuffer = 20
    if ((!(place_meeting(x, y, obj_ladder))) && (!(place_meeting(x, y, obj_stairs))))
    {
        hooked = 0
        state = states.ratmountjump
        sprite_index = spr_ratmount_groundpoundfall
        image_index = 0
        vsp = 0
    }
    if (input_buffer_jump > 0)
    {
        hooked = 0
        input_buffer_jump = 0
        ladderbuffer = 20
        if place_meeting(x, y, obj_hookup)
            ladderbuffer = 30
        state = states.ratmountjump
        sprite_index = spr_ratmount_groundpound
        if key_down
            vsp = 5
        else
            vsp = -9
        image_index = 0
    }
    if (key_down && grounded && (!(place_meeting(x, y, obj_platform))))
    {
        hooked = 0
        sprite_index = spr_ratmount_groundpoundfall
        state = states.ratmountjump
        image_index = 0
    }
}

