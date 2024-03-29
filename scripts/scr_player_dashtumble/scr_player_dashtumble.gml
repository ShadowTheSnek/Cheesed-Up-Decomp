function scr_player_dashtumble() //gml_Script_scr_player_dashtumble
{
    landAnim = 0
    momemtum = 1
    dir = xscale
    hsp = (xscale * movespeed)
    if (movespeed < 10 && grounded)
        movespeed += 0.5
    else if (!grounded)
        movespeed = 10
    if (input_buffer_jump > 0 && grounded && (!key_down))
    {
        jumpstop = 0
        input_buffer_jump = 0
        vsp = -11
        state = states.mach2
        sprite_index = spr_mach2jump
    }
    if (floor(image_index) == (image_number - 1))
    {
        if (!grounded)
            sprite_index = spr_mach2jump
        image_speed = 0.35
        state = states.mach2
        grav = 0.5
    }
    if (scr_solid((x + xscale), y) && ((!(check_slope((x + sign(hsp)), y))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x + xscale), y, obj_destructibles))))
    {
        jumpstop = 1
        state = states.jump
        vsp = -4
        sprite_index = spr_suplexbump
        gml_Script_instance_create((x + (xscale * 10)), (y + 10), obj_bumpeffect)
    }
    if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
    {
        with (gml_Script_instance_create(x, y, obj_slidecloud))
            image_xscale = other.xscale
    }
    image_speed = 0.35
}

