switch state
{
    case states.normal:
        y = (-600 * side)
        vspeed = (20 * side)
        friction = 1
        state = states.revolver
        image_alpha = 0
        break
    case 1:
        if (abs(vspeed) < 10)
        {
            state = states.dynamite
            friction = 0
            if (side == -1)
                gravity_direction = 90
            else
                gravity_direction = 270
            gravity = 1
        }
        break
    case 2:
        if (y < -1080 || y > 1080)
            instance_destroy()
        break
}

image_alpha = Approach(image_alpha, 0.25, 0.05)
draw_set_colour((side == -1 ? c_fuchsia : c_aqua))
var start = (camera_get_view_x(view_camera[0]) * 0.35)
var nd = (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]))
var iter = 20
var f = (start / iter)
for (var i = start; i < (nd + iter); i += iter)
{
    random_set_seed(++f)
    var size = random_range(0.5, 1)
    var xx = ((i - (i % iter)) + (camera_get_view_x(view_camera[0]) * lerp(0.5, 0.35, size)))
    var yy = (camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2))
    yy += (y * lerp(-0.5, 1, size))
    draw_set_alpha((size * image_alpha))
    xx += random_range((-iter), iter)
    var wd = (8 * size)
    var ht = (500 * lerp(-0.5, 1, size))
    draw_roundrect((xx - (wd / 2)), (yy - (ht / 2)), (xx + (wd / 2)), (yy + (ht / 2)), 0)
}
draw_set_alpha(1)
randomize()
draw_set_colour(c_white)
