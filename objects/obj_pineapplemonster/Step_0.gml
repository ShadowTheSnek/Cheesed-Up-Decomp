var accel = 0.1
if (image_index > 3 && snd == 0)
{
    sound_play_3d("event:/sfx/enemies/minijohnpunch", x, y)
    snd = 1
}
if (!fadeout)
{
    if (image_index == 0 && image_alpha < 1)
    {
        image_alpha += accel
        if (image_alpha >= 1)
        {
            image_speed = 0.35
            image_alpha = 1
        }
    }
}
else
{
    image_alpha -= accel
    if (image_alpha <= 0)
        instance_destroy()
}
