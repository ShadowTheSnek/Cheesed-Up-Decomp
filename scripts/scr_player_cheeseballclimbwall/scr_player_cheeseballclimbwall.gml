function scr_player_cheeseballclimbwall() //gml_Script_scr_player_cheeseballclimbwall
{
    hsp = 0
    vsp = (-wallspeed)
    if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(check_slope((x + sign(hsp)), y))) || scr_solid_slope((x + sign(hsp)), y)) && (!(check_slope((x - sign(hsp)), y))))
    {
        sound_play_3d("event:/sfx/pep/groundpound", x, y)
        image_index = 0
        movespeed = 0
        cheesepeptimer = 2
        state = states.cheesepepjump
        sprite_index = spr_cheesepepfall
        repeat (8)
            create_debris((x + random_range(-8, 8)), (y + random_range(-8, 8)), spr_cheesechunk)
    }
    wallspeed = Approach(wallspeed, 12, 1)
    if (!(scr_solid((x + xscale), y)))
    {
        if (movespeed > 8)
            movespeed = 8
        particle_set_scale((5 << 0), (global.gameplay ? xscale : 1), 1)
        create_particle(x, y, (5 << 0))
        vsp = 0
        state = states.cheeseball
        movespeed = wallspeed
        hsp = (xscale * movespeed)
    }
    if key_jump
    {
        vsp = -6
        movespeed = 6
        state = states.cheeseball
        repeat (4)
            create_debris((x + (xscale * 30)), (y + random_range(-8, 8)), spr_slimedebris)
        xscale *= -1
    }
    if (grounded && (floor(image_index) % 4) == 0)
        create_debris((x + (xscale * 30)), y, spr_slimedebris)
}

