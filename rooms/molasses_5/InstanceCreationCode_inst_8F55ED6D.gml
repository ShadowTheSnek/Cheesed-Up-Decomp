flags.do_once_per_save = 1
function anon@44@gml_RoomCC_molasses_5_5_Create() //gml_Script_anon@44@gml_RoomCC_molasses_5_5_Create
{
    var _check = 0
    with (obj_player1)
    {
        if (targetDoor == "D")
            _check = 1
    }
    return _check;
}

function anon@212@gml_RoomCC_molasses_5_5_Create() //gml_Script_anon@212@gml_RoomCC_molasses_5_5_Create
{
    with (obj_geyserCutscene)
    {
        sprite_index = spr_geysercutscene_active
        image_index = 0
    }
}

