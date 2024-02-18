function scr_player_chainsaw() //gml_Script_scr_player_chainsaw
{
    hsp = 0
    vsp = 0
    x = (hitX + random_range(-4, 4))
    y = (hitY + random_range(-4, 4))
    hitLag--
    if key_slap2
        input_buffer_slap = 0
    image_speed = 0
    if key_slap2
        input_attack_buffer = 8
    if (hitLag <= 0)
    {
        x = hitX
        y = hitY
        movespeed = tauntstoredmovespeed
        sprite_index = tauntstoredsprite
        state = tauntstoredstate
        vsp = tauntstoredvsp
        if (character == "S")
            hsp = tauntstoredhsp
        if ((tauntstoredstate == states.handstandjump && (tauntstoredsprite == spr_ungroundedattack || tauntstoredsprite == spr_airattack || tauntstoredsprite == spr_airattackstart)) || sprite_index == spr_piledriverland)
        {
            jumpAnim = 1
            state = states.jump
            sprite_index = spr_suplexland
            vsp = -11
            jumpstop = 0
            image_index = 0
        }
        else if (tauntstoredstate == states.handstandjump || tauntstoredstate == states.finishingblow)
            state = states.normal
    }
}

