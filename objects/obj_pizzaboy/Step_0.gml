if (room == rm_editor)
    return;
switch state
{
    case states.idle:
        scr_enemy_idle()
        break
    case (130 << 0):
        scr_enemy_turn()
        break
    case (134 << 0):
        scr_enemy_walk()
        break
    case (136 << 0):
        scr_enemy_land()
        break
    case (137 << 0):
        scr_enemy_hit()
        break
    case (138 << 0):
        scr_enemy_stun()
        break
    case (129 << 0):
        scr_pizzagoblin_throw()
        break
    case (4 << 0):
        scr_enemy_grabbed()
        break
}

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state == states.walk)
    state = states.idle
if (state != states.grabbed)
    depth = 0
if (state != states.stun)
    thrown = 0
if (boundbox == 0)
{
    with (gml_Script_instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}
if (global.stylethreshold >= 3 && state != states.hit && state != states.grabbed)
{
    var player = instance_nearest(x, y, obj_player)
    if (player && abs((player.x - x)) < (50 + (abs(player.movespeed) * 2)) && abs((player.y - y)) < 100)
    {
        var xp = x
        var yp = y
        x -= (player.xscale * irandom_range(200, 400))
        while scr_solid(x, y)
            y--
        while ((!(scr_solid(x, (y + 1)))) && y < room_height)
            y++
        image_xscale = sign((player.x - x))
        vsp = -4
        if (!bbox_in_camera())
        {
            x = xp
            y = yp
            vsp = -20
        }
        else
        {
            global.combotime = 60
            global.heattime = 60
            var n = 5
            for (var i = 0; i < n; i++)
            {
                with (create_red_afterimage(lerp(xp, x, (i / n)), lerp(yp, y, (i / n)), sprite_index, image_index, image_xscale))
                    alpha = lerp(0.35, 1, (i / n))
            }
        }
    }
}
