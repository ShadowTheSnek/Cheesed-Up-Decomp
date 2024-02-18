event_inherited()
if (move_hor != 0)
{
    switch sel.side
    {
        case 0:
            var sel_prev = sel.hat
            sel.hat = clamp((sel.hat + move_hor), 0, (array_length(hats) - 1))
            if (sel_prev != sel.hat)
            {
                sound_play("event:/sfx/ui/step")
                charshift[0] = (move_hor * 50)
                charshift[2] = 0
            }
            break
        case 1:
            sel_prev = sel.pet
            sel.pet = clamp((sel.pet + move_hor), 0, (array_length(pets) - 1))
            if (sel_prev != sel.pet)
            {
                sound_play("event:/sfx/ui/step")
                charshift[0] = (move_hor * 50)
                charshift[2] = 0
            }
            break
    }

}
if ((sel.side == 0 && move_ver == 1) || (sel.side == 1 && move_ver == -1))
{
    charshift[1] = (move_ver * 100)
    charshift[2] = 0
    sel.side = (!sel.side)
    sound_play("event:/sfx/ui/angelmove")
    for (var i = 0; i < array_length(hats); i++)
    {
        if (obj_player1.hat == hats[i].hat)
            sel.hat = i
    }
    for (i = 0; i < array_length(pets); i++)
    {
        if (obj_player1.pet == pets[i].pet)
            sel.pet = i
    }
}
if (anim_t >= 1 && (!shown_tip))
{
    shown_tip = 1
    with (create_transformation_tip("{u}[u][d][l][r] Switch between cosmetics/", "cosmetictip"))
        alarm[1] = 180
}
charshift[0] = lerp(charshift[0], 0, 0.25)
charshift[1] = lerp(charshift[1], 0, 0.25)
charshift[2] = lerp(charshift[2], 1, 0.25)
charshift[3] = lerp(charshift[3], 1, 0.25)
