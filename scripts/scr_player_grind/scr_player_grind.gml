function scr_player_grind() //gml_Script_scr_player_grind
{
    sprite_index = ((!skateboarding) ? spr_grind : spr_clown)
    image_speed = 0.35
    machhitAnim = 0
    crouchslideAnim = 1
    hsp = (xscale * movespeed)
    if (movespeed < 10)
        movespeed = Approach(movespeed, 10, 0.5)
    if ((!(place_meeting(x, (y + 18), obj_grindrail))) && (!(place_meeting(x, (y + 18), obj_grindrailslope))))
    {
        if (movespeed < 12 || skateboarding)
        {
            state = states.mach2
            sprite_index = spr_mach2jump
        }
        else
        {
            state = states.mach3
            sprite_index = spr_mach4
        }
    }
    if (check_solid((x + xscale), y) && (!(place_meeting(x, (y + 18), obj_grindrailslope))) && (!(check_slope(x, (y + 1)))))
    {
        state = states.bump
        hsp = ((-xscale) * 5)
        vsp = 1
        if global.gameplay
        {
            gml_Script_instance_create((x + (10 * xscale)), (y + 10), obj_bumpeffect)
            sound_play_3d("event:/sfx/pep/bumpwall", x, y)
        }
    }
    if (input_buffer_jump > 0)
    {
        input_buffer_jump = 0
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0))
        vsp = -11
        jumpstop = 0
        if skateboarding
        {
            sprite_index = spr_clownjump
            image_index = 0
        }
        if (movespeed < 12 || skateboarding)
        {
            state = states.mach2
            sprite_index = spr_mach2jump
        }
        else
        {
            state = states.mach3
            sprite_index = spr_mach3jump
        }
        if (character == "BN")
        {
            sprite_index = spr_playerBN_grindJump
            image_index = 0
        }
    }
    if (!instance_exists(obj_grindeffect))
        gml_Script_instance_create(x, y, obj_grindeffect)
}

