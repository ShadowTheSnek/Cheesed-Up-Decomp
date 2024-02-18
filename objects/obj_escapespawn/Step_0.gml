if (state == states.normal || state == states.revolver)
    instance_deactivate_object_hook(baddieID)
switch state
{
    case states.normal:
        if (!global.panic)
            visible = false
        else
            state = states.revolver
        break
    case 1:
        visible = false
        image_index = 0
        var p = obj_player1.id
        if distance_to_pos(x, y, p.x, p.y, 500, 100)
        {
            state = states.dynamite
            visible = true
        }
        break
    case 2:
        if (floor(image_index) > 5)
        {
            instance_activate_object(baddieID)
            sound_play_3d("event:/sfx/enemies/escapespawn", x, y)
            with (baddieID)
            {
                x = other.x
                y = other.y
                if escapestun
                {
                    state = states.stun
                    sprite_index = stunfallspr
                    stunned = 20
                    if elite
                        stunned *= 6
                }
                boundbox = 0
                create_particle(x, y, (9 << 0))
            }
            state = states.boots
        }
        break
    case 3:
        if (floor(image_index) == (image_number - 1))
            visible = false
        break
}

