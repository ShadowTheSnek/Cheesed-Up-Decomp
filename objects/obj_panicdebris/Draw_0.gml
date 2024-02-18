var _temp_local_var_4;
if global.performance
    return;
if (instance_exists(obj_ghostcollectibles) || (!global.panic))
    return;
if (draw && global.leveltosave != "exit")
{
    y += 3
    var blend = get_dark(16777215, obj_drawcontroller.use_dark)
    draw_sprite_tiled_ext(bg_fallingbricksforefront, global.SUGARY, x, y, 1, 1, blend, 1)
}
var debris_sprite = spr_towerblockdebris
var debris_speed = 0.35
if (global.laps > 2)
{
    if ((scr_current_time() % 100) == 0)
    {
        var _temp_local_var_4 = (min(floor((global.laps / 4)), 4) * (room_width / 960))
        if ((min(floor((global.laps / 4)), 4) * (room_width / 960)) <= 0)
        {
        }
        else
        {
            while (true)
            {
                array_push(debris, 
                {
                    x: random_range(-50, (room_width + 50)),
                    y: -50,
                    ang: irandom(360),
                    img: irandom(sprite_get_number(debris_sprite)),
                    vsp: random_range(-4, 0),
                    hsp: random_range(-4, 4)
                }
)
                var _temp_local_var_4 = ((min(floor((global.laps / 4)), 4) * (room_width / 960)) - 1)
                if ((min(floor((global.laps / 4)), 4) * (room_width / 960)) - 1)
                {
                    continue
                    break
                }
            }
        }
    }
}
for (var i = 0; i < array_length(debris); i++)
{
    var d = debris[i]
    if is_struct(d)
    {
        if (d.y >= (room_height + 64))
        {
            d = undefined
            array_delete(debris, i, 1)
        }
        else
        {
            draw_sprite_ext(debris_sprite, d.img, d.x, d.y, image_xscale, image_yscale, d.ang, image_blend, 0.5)
            d.x += d.hsp
            d.y += d.vsp
            d.img += debris_speed
            if (d.vsp < 12)
                d.vsp += 0.5
        }
    }
}
