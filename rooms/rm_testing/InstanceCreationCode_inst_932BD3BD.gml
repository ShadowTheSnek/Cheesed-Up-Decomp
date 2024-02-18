trigger = 1
function anon@21@gml_RoomCC_rm_testing_3_Create(argument0) //gml_Script_anon@21@gml_RoomCC_rm_testing_3_Create
{
    if (!active)
    {
        if (argument0.state == states.freefallland)
            active = 1
    }
}

