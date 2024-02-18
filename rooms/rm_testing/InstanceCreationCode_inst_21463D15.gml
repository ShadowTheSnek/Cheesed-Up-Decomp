function anon@7@gml_RoomCC_rm_testing_6_Create(argument0) //gml_Script_anon@7@gml_RoomCC_rm_testing_6_Create
{
    if ((!active) && argument0.state == states.handstandjump)
    {
        active = 1
        obj_secretmanager.hittriggers++
        with (argument0)
            scr_pummel()
    }
}

