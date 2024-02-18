var _block = id
with (obj_player)
{
    if (state != states.gameover && place_meeting(x, (y + 1), _block))
    {
        jumpstop = 1
        suplexmove = 0
        grounded = 0
        if (state == states.machslide)
            state = states.jump
        if (state == states.normal || state == states.freefall)
            state = states.jump
        if (state == states.climbwall)
            state = states.mach2
        vsp = -11
        _block.image_index = 0
        _block.image_speed = 0.35
    }
}
