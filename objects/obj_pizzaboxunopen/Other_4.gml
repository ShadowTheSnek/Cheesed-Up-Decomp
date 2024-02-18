if (global.timeattack == 1)
{
    instance_destroy()
    return;
}
if in_saveroom()
{
    instance_destroy()
    return;
}
if (!is_real(content))
    content = real(content)
if (content == obj_pizzakinshroom && global.shroomfollow)
{
    instance_destroy(id, false)
    return;
}
if (content == obj_pizzakincheese && global.cheesefollow)
{
    instance_destroy(id, false)
    return;
}
if (content == obj_pizzakintomato && global.tomatofollow)
{
    instance_destroy(id, false)
    return;
}
if (content == obj_pizzakinsausage && global.sausagefollow)
{
    instance_destroy(id, false)
    return;
}
if (content == obj_pizzakinpineapple && global.pineapplefollow)
{
    instance_destroy(id, false)
    return;
}
if global.snickchallenge
{
    instance_destroy(id, false)
    return;
}
if (content == obj_bigcollect)
{
    sprite_index = spr_pizzaboxunopen_old
    mask_index = -1
    return;
}
scr_fmod_soundeffect(snd, x, y)
