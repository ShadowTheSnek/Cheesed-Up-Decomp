with (obj_player)
{
    if place_meeting(x, y, other)
    {
        with (other)
        {
            if (!(((other.state != states.tumble || (other.sprite_index != other.spr_tumble && other.sprite_index != other.spr_tumblestart && other.sprite_index != other.spr_tumbleend)) && other.state != states.backbreaker && other.state != states.chainsaw && other.state != states.bump && other.y > other.yprevious && (((!other.isgustavo) && other.y <= (y + 10)) || (other.isgustavo && other.y < y)))))
            {
            }
            else if (global.MIDWAY && (other.state == states.backbreaker || other.vsp < 0))
            {
            }
            else if (!other.isgustavo)
            {
                if (other.state == states.punch)
                    other.movespeed = abs(other.hsp)
                other.y = (y - 49)
                other.state = states.grind
            }
            else if (other.state != states.ratmountgrind)
            {
                with (other)
                {
                    if (brick == 1)
                    {
                        with (gml_Script_instance_create(x, y, obj_brickcomeback))
                            wait = 1
                    }
                    with (gml_Script_instance_create(x, (y - 5), obj_parryeffect))
                    {
                        sound_play_3d("event:/sfx/pep/step", x, y)
                        sprite_index = spr_grabhangeffect
                        image_speed = 0.35
                    }
                    brick = 0
                    if (state == states.ratmounttrickjump || state == states.tumble)
                        movespeed *= sign(hsp)
                }
                other.y = (y + 8)
                other.state = states.ratmountgrind
            }
        }
    }
}
