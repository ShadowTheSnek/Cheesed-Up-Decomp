function scr_player_comingoutdoor() //gml_Script_scr_player_comingoutdoor
{
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    machhitAnim = 0
    hsp = 0
    if (c < 255)
        c += 5
    image_blend = make_colour_hsv(0, 0, c)
    if (sprite_index != spr_Timesup && sprite_index != spr_ratmountdoorclosed)
    {
        if (steppybuffer > 0)
            steppybuffer--
        else
        {
            steppybuffer = 16
            sound_play_3d("event:/sfx/pep/step", x, y)
        }
        if isgustavo
            sprite_index = spr_ratmountexitdoor
        else
            sprite_index = spr_walkfront
    }
    if (floor(image_index) == (image_number - 1))
    {
        movespeed = 0
        if isgustavo
            state = states.ratmount
        else
        {
            state = states.normal
            if (character == "P" && keydoor)
            {
                image_index = 0
                sprite_index = spr_player_keydoor
                idle = 150
            }
        }
        image_alpha = 1
        c = 0
        image_blend = c_white
        keydoor = 0
    }
    image_speed = 0.35
}

