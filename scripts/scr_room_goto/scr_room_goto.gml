function scr_room_goto(argument0) //gml_Script_scr_room_goto
{
    if instance_exists(obj_cyop_loader)
    {
        global.SUGARY = 0
        global.MIDWAY = 0
        cyop_room_goto(argument0)
    }
    else
    {
        global.SUGARY = (global.leveltosave == "entryway" || global.leveltosave == "steamy" || global.leveltosave == "molasses" || global.leveltosave == "sucrose" || argument0 == tower_sugary || string_starts_with(room_get_name(argument0), "sugarytut"))
        global.MIDWAY = global.leveltosave == "midway"
        if global.MOD.OldLevels
        {
            var newRoom = asset_get_index((room_get_name(argument0) + "_OLD"))
            if room_exists(newRoom)
            {
                room_goto(newRoom)
                return;
            }
        }
        room_goto(argument0)
    }
}

