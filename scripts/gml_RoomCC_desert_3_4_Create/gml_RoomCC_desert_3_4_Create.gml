function anon@7@gml_RoomCC_desert_3_4_Create(argument0) //gml_Script_anon@7@gml_RoomCC_desert_3_4_Create
{
    if (active == 0 && argument0.state == states.backbreaker)
    {
        active = 1
        obj_secretmanager.touchedtriggers += 1
    }
}

