if ((grounded || ((character == "SP" || sprite_index == spr_lunge) && state == states.handstandjump)) && other.sprite_index == spr_swordstone && (state == states.handstandjump || state == states.punch || state == states.lungeattack))
{
    var yy = y
    if (!grounded)
    {
        while (!(scr_solid(x, (y + 1))))
        {
            if (++y > room_height)
            {
                y = yy
                break
            }
            else
                continue
        }
    }
    grounded = 1
    transformationlives = 3
    sound_play_3d("event:/sfx/knight/start", x, y)
    global.SAGEknighttaken = 1
    momentum = 0
    movespeed = 0
    other.image_index = 1
    image_index = 0
    image_speed = 0.35
    sprite_index = spr_knightpepstart
    state = states.knightpep
    hsp = 0
    vsp = 0
    notification_push((56 << 0), [room])
    create_transformation_tip(gml_Script_lang_get_value("knighttip"), "knight")
}
