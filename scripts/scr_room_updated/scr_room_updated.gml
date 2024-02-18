function scr_room_updated(argument0) //gml_Script_scr_room_updated
{
    if ((argument0 == room || (room == global.live_blank_room && global.live_live_room == argument0)) && instance_exists(obj_player))
    {
        with (obj_player1)
        {
            hallway = savedhallway
            hallwaydirection = savedhallwaydirection
            vhallwaydirection = savedvhallwaydirection
            verticalhallway = savedverticalhallway
        }
        room_goto_live(argument0)
    }
}

