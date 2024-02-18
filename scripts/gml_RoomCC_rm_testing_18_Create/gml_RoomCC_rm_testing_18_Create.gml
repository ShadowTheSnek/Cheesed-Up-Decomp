trigger = 6
function anon@21@gml_RoomCC_rm_testing_18_Create(argument0) //gml_Script_anon@21@gml_RoomCC_rm_testing_18_Create
{
    if (!active)
    {
        if following_has_follower(obj_alienfollow)
        {
            active = 1
            instance_destroy(obj_alienfollow)
        }
    }
}

