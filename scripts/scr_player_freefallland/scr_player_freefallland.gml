function scr_player_freefallland() //gml_Script_scr_player_freefallland
{
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    movespeed = 0
    facehurt = 1
    start_running = 1
    alarm[4] = 14
    vsp = 0
    hsp = 0
    var jump = 0
    if (key_jump && global.poundjump)
        jump = 1
    else if (floor(image_index) == (image_number - 1))
    {
        if (key_jump2 && global.poundjump)
            jump = 1
        else
        {
            if (character != "S")
            {
                facehurt = 1
                sprite_index = spr_facehurtup
                image_index = 0
            }
            state = states.normal
            jumpstop = 1
        }
    }
    if jump
    {
        state = states.jump
        vsp = -13
        jumpstop = 1
        scr_fmod_soundeffect(jumpsnd, x, y)
        if (spr_groundpoundjump != spr_player_groundpoundjump || character == "P")
            sprite_index = spr_groundpoundjump
        else
            sprite_index = spr_machfreefall
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
    }
    image_speed = 0.35
}

