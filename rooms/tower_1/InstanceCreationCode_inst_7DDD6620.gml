function anon@15@gml_RoomCC_tower_1_15_Create() //gml_Script_anon@15@gml_RoomCC_tower_1_15_Create
{
    var t = "garbage1X"
    switch obj_player1.character
    {
        case "P":
            t = "garbage1"
            break
        case "N":
            t = "garbage1N"
            break
        case "V":
            t = "garbage1V"
            break
        case "G":
            t = "garbage1G"
            break
    }

    text = gml_Script_lang_get_value_newline(t)
}

self.refresh_func()
