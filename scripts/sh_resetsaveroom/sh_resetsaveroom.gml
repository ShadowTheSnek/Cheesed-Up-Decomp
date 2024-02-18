function sh_resetsaveroom() //gml_Script_sh_resetsaveroom
{
    if (!WC_debug)
        return "You do not have permission to use this command";
    if (!instance_exists(obj_player1))
        return "Player is not in room";
    if (variable_global_exists("saveroom") && ds_exists(global.saveroom, 2))
        ds_list_clear(global.saveroom)
    if (variable_global_exists("baddieroom") && ds_exists(global.baddieroom, 2))
        ds_list_clear(global.baddieroom)
    if (variable_global_exists("baddietomb") && ds_exists(global.baddietomb, 2))
        ds_list_clear(global.baddietomb)
    if (variable_global_exists("escaperoom") && ds_exists(global.escaperoom, 2))
        ds_list_clear(global.escaperoom)
    with (obj_player)
        targetDoor = "none"
    with (all)
    {
        if ((!persistent) && id != other.id)
            instance_destroy(id, false)
    }
    if instance_exists(obj_cyop_loader)
        scr_room_goto(obj_cyop_loader.room_name)
    else
        room_restart()
    if (!isOpen)
        create_transformation_tip(gml_Script_lang_get_value_newline("resetleveldata"))
    else
        return "Reset all level data, and restarted current room";
}

function meta_resetsaveroom() //gml_Script_meta_resetsaveroom
{
    return 
    {
        description: "clears global.saveroom and similar lists"
    };
}

