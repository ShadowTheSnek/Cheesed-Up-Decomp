function anon@12@gml_RoomCC_molasses_6_9_Create() //gml_Script_anon@12@gml_RoomCC_molasses_6_9_Create
{
    return (!instance_exists(138886));
}

function anon@86@gml_RoomCC_molasses_6_9_Create() //gml_Script_anon@86@gml_RoomCC_molasses_6_9_Create
{
    with (obj_bigcollect)
    {
        if place_meeting(x, y, other)
        {
            gml_Script_instance_create(x, y, obj_cloudeffect)
            repeat (3)
                gml_Script_instance_create((x + random_range(-5, 5)), (y + random_range(-5, 5)), obj_cloudeffect)
            instance_destroy()
        }
    }
}

