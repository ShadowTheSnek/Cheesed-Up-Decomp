function scr_player_ladder() //gml_Script_scr_player_ladder
{
    suplexmove = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    turning = 0
    jumpstop = 0
    movespeed = 0
    hsp = 0
    if (key_up && hooked == 0)
    {
        sprite_index = spr_laddermove
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
    else if (key_down && hooked == 0)
    {
        sprite_index = spr_ladderdown
        vsp = 10
        image_speed = 0.35
    }
    else
    {
        sprite_index = spr_Ladder
        vsp = 0
    }
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    machhitAnim = 0
    if ((!(place_meeting(x, y, obj_ladder))) && (!(place_meeting(x, y, obj_stairs))))
    {
        landAnim = 0
        jumpAnim = 0
        state = states.normal
        image_index = 0
        if ((!hooked) && vsp < 0)
        {
            var _y = 1
            while (!(scr_solid(x, (y + _y))))
            {
                _y++
                if (_y > 32)
                {
                    _y = 0
                    break
                }
                else
                    continue
            }
            y += (_y - 1)
        }
        vsp = 0
        hooked = 0
    }
    if (input_buffer_jump > 0)
    {
        input_buffer_jump = 0
        hooked = 0
        sprite_index = spr_jump
        ladderbuffer = 20
        if place_meeting(x, y, obj_hookup)
            ladderbuffer = 30
        jumpAnim = 1
        state = states.jump
        if key_down
            vsp = 5
        else
            vsp = -9
        image_index = 0
    }
    if (key_down && grounded && (!(place_meeting(x, y, obj_platform))))
    {
        state = states.normal
        image_index = 0
    }
}

