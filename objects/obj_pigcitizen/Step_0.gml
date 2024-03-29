switch state
{
    case states.normal:
        if (!global.panic)
        {
            image_speed = 0.15
            sprite_index = walkspr
            if (randombuffer > 0)
                randombuffer--
            else
            {
                randombuffer = (80 + irandom(50))
                var _move = irandom(100)
                image_xscale = choose(-1, 1)
                if (_move > 50)
                    movespeed = 1
                else
                    movespeed = 0
            }
            hsp = (movespeed * image_xscale)
            if (check_solid((x + sign(hsp)), y) && (!(check_slope((x + sign(hsp)), y))))
                image_xscale *= -1
            if (movespeed == 0)
                image_index = 0
        }
        else
        {
            image_speed = 0.35
            sprite_index = panicspr
            hsp = (image_xscale * 5)
            if (randombuffer > 0)
                randombuffer--
            else
            {
                randombuffer = (80 + irandom_range(-40, 80))
                image_xscale = choose(-1, 1)
            }
            if (check_solid((x + sign(hsp)), y) && (!(check_slope((x + sign(hsp)), y))))
                image_xscale *= -1
        }
        if (obj_player.state == states.backbreaker && bbox_in_camera(view_camera[0], 50))
        {
            if (state != states.backbreaker)
                sound_play_3d("event:/sfx/voice/pigphoto", x, y)
            tauntstoredhsp = hsp
            tauntstoredvsp = vsp
            state = states.backbreaker
            hsp = 0
            vsp = 0
            if (x != obj_player.x)
                image_xscale = sign((obj_player.x - x))
            if (!in_saveroom())
            {
                add_saveroom()
                notification_push((22 << 0), [room, id])
            }
        }
        break
    case (84 << 0):
        sprite_index = tauntspr
        if (obj_player.state != states.backbreaker)
        {
            state = states.normal
            hsp = tauntstoredhsp
            vsp = tauntstoredvsp
        }
        break
}

scr_collide()
