to_load = ds_list_create()
wait = method(self, function() //gml_Script_anon@49@gml_Object_obj_cyop_assetloader_Create_0
{
    if (ds_list_size(to_load) == 0)
    {
        trace("Done with sprites!")
        if is_callable(done_func)
            self.done_func()
        instance_destroy()
        return 0;
    }
    else if (sprite_exists(titlecard) && ds_list_find_index(to_load, titlecard) < 0)
    {
        trace("Titlecard loaded in!")
        if is_callable(done_func)
            self.done_func()
        return 0;
    }
    trace(string("Waiting for sprites: {0}", ds_list_size(to_load)))
    return 1;
}
)
done_func = -4
titlecard = -4
