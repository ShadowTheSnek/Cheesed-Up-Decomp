if spawn
{
    sound_play_3d("event:/sfx/misc/breakice", x, y)
    with (gml_Script_instance_create(x, y, content))
    {
        santaID = other.baddieID
        important = 1
        state = states.stun
        vsp = -8
        stunned = 20
        create_particle(x, y, (9 << 0))
        switch object_index
        {
            case obj_spike:
                fake = 1
                y -= 32
                break
            default:
                if scr_solid(x, y)
                {
                    var old_y = y
                    while scr_solid(x, y)
                    {
                        y--
                        if (abs((old_y - y)) > room_height)
                        {
                            y = old_y
                            break
                        }
                        else
                            continue
                    }
                }
                break
        }

    }
}
