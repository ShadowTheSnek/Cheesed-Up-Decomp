switch state
{
    case states.fall:
        hsp = 0
        if (grounded && vsp > 0)
        {
            sound_play_3d("event:/sfx/noise/bombbounce", x, y)
            sprite_index = spr_playerN_noisebombland
            image_index = 0
            state = states.land
        }
        break
    case (0 << 0):
        hsp = (image_xscale * 6)
        if (floor(image_index) == (image_number - 1))
        {
            if (sprite_index == spr_playerN_noisebombland)
                sprite_index = spr_playerN_noisebomb
            if (sprite_index == spr_playerN_noisebombhitwall)
                sprite_index = spr_playerN_noisebomb
        }
        if (grounded && vsp > 0)
        {
            sound_play_3d("event:/sfx/noise/bombbounce", x, y)
            sprite_index = spr_playerN_noisebombland
            image_index = 0
            state = states.land
        }
        else if check_solid((x + sign(hsp)), y)
        {
            sprite_index = spr_playerN_noisebombhitwall
            image_index = 0
            image_xscale *= -1
        }
        break
    case (136 << 0):
        hsp = 0
        vsp = 0
        if (floor(image_index) >= 5)
        {
            state = states.normal
            vsp = -5
        }
        break
}

if (sprite_index == spr_playerN_noisebomb && cooldown <= 60)
    sprite_index = spr_playerN_noisebombflash
if (state != states.fall)
{
    if (cooldown > 0)
        cooldown--
    else
        instance_destroy()
}
scr_collide()
