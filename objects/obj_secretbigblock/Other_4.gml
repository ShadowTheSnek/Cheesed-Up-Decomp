if in_saveroom()
    instance_destroy()
else
{
    var num = instance_place_list(x, y, obj_baddie, global.instancelist, 0)
    for (var i = 0; i < num; i++)
    {
        var b = ds_list_find_value(global.instancelist, i)
        with (b)
        {
            secretjumped = 0
            savedsecretinvincible = invincible
            state = (266 << 0)
        }
    }
    ds_list_clear(global.instancelist)
}
