function anon@15@gml_RoomCC_tower_5_21_Create() //gml_Script_anon@15@gml_RoomCC_tower_5_21_Create
{
    var t = "garbage13X"
    switch obj_player1.character
    {
        case "P":
        case "SN":
        case "G":
            t = "garbage13"
            break
    }

    text = gml_Script_lang_get_value_newline(t)
}

self.refresh_func()
