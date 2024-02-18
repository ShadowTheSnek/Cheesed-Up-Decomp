init_collision()
thrown = 0
hithsp = 0
hitvsp = 0
destroy = 0
clone = 0
image_speed = 0.35
alarm[0] = 10
while check_solid(x, y)
{
    if (x > (room_width / 2))
        x--
    else
        x++
}
