if (room == rm_editor)
    return;
switch state
{
    case states.wait:
        image_speed = 0.35
        hsp = 0
        vsp = 20
        if (!global.panic)
            sprite_index = spr_charcherry_wait
        else if (grounded && sprite_index != spr_charcherry_popout)
        {
            var player = instance_nearest(x, y, obj_player)
            if (player && player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
            {
                image_index = 0
                sprite_index = spr_charcherry_popout
            }
        }
        if (sprite_index == spr_charcherry_popout && floor(image_index) == (image_number - 1))
        {
            state = (128 << 0)
            sprite_index = spr_charcherry_run
            movespeed = 8
            vsp = 0
        }
        break
    case (138 << 0):
        scr_enemy_stun()
        stunned = min(stunned, 5)
        break
    case (137 << 0):
        scr_enemy_hit()
        break
    case (128 << 0):
        var targetplayer = obj_player1
        var playerposition = (x - targetplayer.x)
        if (x != targetplayer.x && image_xscale != (-sign(playerposition)))
        {
            movespeed = 10
            image_xscale = (-sign(playerposition))
            slide = ((-image_xscale) * (movespeed + 4))
        }
        if (slide <= 0)
            slide += 0.2
        else if (slide > 0)
            slide -= 0.2
        hsp = ((image_xscale * movespeed) + slide)
        if (grounded && scr_solid((x + image_xscale), y))
            vsp -= 8
        break
    default:
        state = (128 << 0)
        movespeed = 8
        var targetplayer = obj_player1
        var playerposition = (x - targetplayer.x)
        if (x != targetplayer.x && image_xscale != (-sign(playerposition)))
        {
            movespeed = 10
            image_xscale = (-sign(playerposition))
            slide = ((-image_xscale) * (movespeed + 4))
        }
        if (slide <= 0)
            slide += 0.2
        else if (slide > 0)
            slide -= 0.2
        hsp = ((image_xscale * movespeed) + slide)
        if (grounded && scr_solid((x + image_xscale), y))
            vsp -= 8
        break
}

if (sprite_index != spr_charcherry_wait && (!global.panic))
{
    sprite_index = spr_charcherry_wait
    state = states.wait
}
player = instance_place(x, y, obj_player)
if (player && global.panic)
{
    if (state != states.wait)
    {
        instance_destroy()
        gml_Script_instance_create(x, y, obj_canonexplosion)
    }
    else if (player.instakillmove && sprite_index == spr_charcherry_popout)
        instance_destroy()
}
