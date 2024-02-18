if (delay > 0)
    delay--
else
{
    delay = delaymax
    pos++
    if (!is_array(objectlist))
    {
        if (asset_get_type(objectlist) == 0)
            objectlist = [objectlist]
        else
        {
            repeat (5)
                show_message(string("{0} objectlist is not array\nblame beebawp also screenshot this\n\n{1}", id, objectlist))
            instance_destroy()
            return;
        }
    }
    if (pos >= array_length(objectlist))
        pos = 0
    with (gml_Script_instance_create(x, (y - 32), objectlist[pos]))
    {
        repeat (4)
            gml_Script_instance_create(x, y, obj_factorycreateeffect)
        switch object_index
        {
            case obj_dashpad:
                image_xscale = other.dir
                break
            case obj_superspring:
                use_collision = 1
                break
            case obj_pinballlauncher:
                use_collision = 1
                break
        }

    }
}
