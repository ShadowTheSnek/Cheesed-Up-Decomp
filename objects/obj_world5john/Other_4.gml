if in_saveroom()
    instance_destroy()
if (global.panic == 0)
    instance_destroy()
else
{
    layer_background_visible(bgid, false)
    add_saveroom()
}
