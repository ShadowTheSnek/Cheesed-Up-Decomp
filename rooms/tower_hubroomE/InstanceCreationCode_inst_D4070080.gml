scr_create_uparrowhitbox()
flags.do_save = 0
function anon@65@gml_RoomCC_tower_hubroomE_3_Create() //gml_Script_anon@65@gml_RoomCC_tower_hubroomE_3_Create
{
    var player = instance_place(x, y, obj_player)
    return (player && player.state == states.normal && player.grounded && player.key_up2);
}

function anon@228@gml_RoomCC_tower_hubroomE_3_Create() //gml_Script_anon@228@gml_RoomCC_tower_hubroomE_3_Create
{
    with (obj_uparrowhitbox)
    {
        if (ID == other.id)
            instance_destroy()
    }
    with (obj_player1)
    {
        state = states.victory
        sprite_index = (isgustavo ? spr_ratmountenterdoor : spr_lookdoor)
    }
    with (gml_Script_instance_create(x, y, obj_eventtrigger))
    {
        function anon@502@anon@228_gml_RoomCC_tower_hubroomE_3_Create() //gml_Script_anon@502@anon@228_gml_RoomCC_tower_hubroomE_3_Create
        {
            return obj_player1.image_index >= (obj_player1.image_number - 1);
        }

        function anon@603@anon@228_gml_RoomCC_tower_hubroomE_3_Create() //gml_Script_anon@603@anon@228_gml_RoomCC_tower_hubroomE_3_Create
        {
            gml_Script_instance_create(0, 0, obj_msdos)
        }

    }
}

