flags.do_save = 0
function anon@30@gml_RoomCC_steamy_7_8_Create() //gml_Script_anon@30@gml_RoomCC_steamy_7_8_Create
{
    with (obj_player)
    {
        if (targetDoor == "F")
            return id;
    }
    return 0;
}

function anon@154@gml_RoomCC_steamy_7_8_Create(argument0) //gml_Script_anon@154@gml_RoomCC_steamy_7_8_Create
{
    with (argument0)
    {
        sound_play_3d("event:/sfx/pep/slip", x, y)
        sprite_index = spr_slipbanan1
        vsp = -11
        movespeed = abs(movespeed)
        hsp = (movespeed * xscale)
        image_index = 0
        state = states.slipbanan
        instance_destroy(other)
    }
}

