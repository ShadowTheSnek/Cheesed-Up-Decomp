if global.gameplay
{
    if (global.panic == 1 || instance_exists(obj_wartimer))
        image_alpha = 1
    else
        image_alpha = 0.35
}
