function scr_timedgate_object(argument0) //gml_Script_scr_timedgate_object
{
    if timedgate
    {
        if (!(in_saveroom(undefined, argument0)))
            add_saveroom(undefined, argument0)
        with (gml_Script_instance_create(x, y, obj_timedgatespawn))
        {
            content = other.object_index
            image_xscale = other.image_xscale
            image_yscale = other.image_yscale
        }
        instance_destroy()
    }
}

function timedgate_trigger() //gml_Script_timedgate_trigger
{
    with (obj_timedgatespawn)
    {
        if (!instance_exists(contentID))
        {
            with (gml_Script_instance_create(x, y, content))
            {
                other.contentID = id
                important = 1
                image_xscale = other.image_xscale
                image_yscale = other.image_yscale
                create_particle(x, y, (1 << 0), 0)
            }
        }
    }
}

function timedgate_add_objects(argument0, argument1) //gml_Script_timedgate_add_objects
{
    with (argument0)
    {
        if (!(variable_instance_exists(id, "timedgate")))
            timedgate = 0
        scr_timedgate_object(argument1)
    }
}

