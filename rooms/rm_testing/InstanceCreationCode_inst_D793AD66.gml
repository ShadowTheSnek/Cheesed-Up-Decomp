trigger = 7
function anon@21@gml_RoomCC_rm_testing_20_Create(argument0) //gml_Script_anon@21@gml_RoomCC_rm_testing_20_Create
{
    if (!active)
    {
        if (following_count(obj_chickenfollow) >= 3)
        {
            active = 1
            instance_destroy(obj_chickenfollow)
        }
    }
}

