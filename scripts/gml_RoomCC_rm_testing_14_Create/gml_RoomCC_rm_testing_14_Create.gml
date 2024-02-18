function anon@7@gml_RoomCC_rm_testing_14_Create(argument0) //gml_Script_anon@7@gml_RoomCC_rm_testing_14_Create
{
    if ((!active) && argument0.state == states.backbreaker)
    {
        active = 1
        obj_secretmanager.totems++
    }
}

function anon@153@gml_RoomCC_rm_testing_14_Create() //gml_Script_anon@153@gml_RoomCC_rm_testing_14_Create
{
    if active
    {
        with (instance_place(x, y, obj_totem))
            sprite_index = spr_totemcheese_pep
    }
}

visible = false
