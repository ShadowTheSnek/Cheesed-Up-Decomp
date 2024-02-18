function scr_player_lungeattack() //gml_Script_scr_player_lungeattack
{
    if (sprite_index != spr_suplexland)
    {
        image_speed = 0.35
        hsp = (xscale * movespeed)
        if hit_connected
        {
            movespeed = 6
            vsp = 0
        }
    }
    else
    {
        image_speed = 0.35
        movespeed = Approach(movespeed, 0, 0.1)
    }
    if key_slap
        input_attack_buffer = 60
    if (hit_connected && input_attack_buffer > 0 && input_finisher_buffer <= 0)
        input_attack_buffer = 60
    var cancelindex = 4
    if (image_index >= 6)
        image_index = (image_number - 1)
    if (floor(image_index) == (image_number - 1))
    {
        state = states.normal
        ds_list_clear(hitlist)
        hit_connected = 0
    }
    if (floor(image_index) >= max((image_number - cancelindex), 0) && hit_connected)
    {
        if (state != states.punch && input_attack_buffer > 0)
        {
            ds_list_clear(hitlist)
            hit_connected = 0
            uplaunch = 0
            downlaunch = 0
            if finisher
                finisher_buffer += 15
            input_attack_buffer = 0
            state = states.lungeattack
            if (character == "P")
                randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7, spr_punch])
            else
                randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch])
            image_index = 0
        }
    }
    if (!instance_exists(lungeattackID))
    {
        with (gml_Script_instance_create(x, y, obj_lungehitbox))
        {
            playerid = other.id
            other.lungeattackID = id
        }
    }
}

function randomize_animations(argument0) //gml_Script_randomize_animations
{
    if (ds_list_size(animlist) >= array_length(argument0))
        ds_list_clear(animlist)
    sprite_index = argument0[irandom((array_length(argument0) - 1))]
    while (ds_list_find_index(animlist, sprite_index) != -1)
        sprite_index = argument0[irandom((array_length(argument0) - 1))]
    ds_list_add(animlist, sprite_index)
}

function DoFinisher() //gml_Script_DoFinisher
{
    ds_list_clear(hitlist)
    input_finisher_buffer = 0
    input_up_buffer = 0
    input_down_buffer = 0
    hit_connected = 0
    if key_up
    {
        state = states.punch
        movespeed = 6
        image_index = 0
        sprite_index = spr_breakdanceuppercut
        fmod_event_instance_play(snd_uppercut)
        vsp = -16
        hsp = (xscale * movespeed)
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
    }
    else
    {
        state = states.punch
        sprite_index = spr_lungehit
        image_index = 0
        movespeed = ((!key_attack) ? 7 : 14)
        with (gml_Script_instance_create(x, y, obj_superdashcloud))
        {
            image_xscale = other.xscale
            image_yscale = other.yscale
        }
        particle_set_scale((2 << 0), xscale, 1)
        create_particle(x, y, (2 << 0), 0)
    }
}

