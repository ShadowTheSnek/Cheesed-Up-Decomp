function scr_player_keyget() //gml_Script_scr_player_keyget
{
    hsp = 0
    vsp = 0
    image_speed = 0.35
    movespeed = 0
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    machhitAnim = 0
    global.combotime = 60
    sprite_index = spr_keyget
    if ((!keysound) && floor(image_index) >= 16)
    {
        keysound = 1
        scr_fmod_soundeffect(snd_voiceok, obj_player1.x, obj_player1.y)
    }
    if (floor(image_index) == (image_number - 1))
    {
        global.keyget = 0
        state = states.normal
        if isgustavo
            state = states.ratmount
        image_index = 0
        gml_Script_instance_create(x, y, obj_keyfollow)
    }
}

