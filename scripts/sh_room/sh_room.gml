function sh_room(argument0) //gml_Script_sh_room
{
    if (instance_exists(obj_disclaimer) || room == Initroom || 0)
        return "No.";
    if (!WC_debug)
        return "You do not have permission to use this command";
    if (array_length(argument0) < 2)
        return (((("The current room is " + room_get_name(room)) + " (") + string(room)) + ")");
    var roomgoto = argument0[1]
    if instance_exists(obj_cyop_loader)
    {
        if (!(ds_map_exists(global.room_map, roomgoto)))
            return (("The room " + string(roomgoto)) + " doesn't exist in the current custom level");
    }
    else
    {
        if string_is_number(roomgoto)
        {
            roomgoto = real(roomgoto)
            if (!room_exists(roomgoto))
                return (("The room " + string(roomgoto)) + " doesn't exist");
        }
        else if (asset_get_type(roomgoto) != 3)
            return (("The asset " + roomgoto) + " is not a room");
        if (roomgoto == "Initroom" || roomgoto == "Loadiingroom")
            return "Not a good idea.";
        roomgoto = asset_get_index(roomgoto)
        if (array_contains(asset_get_tags(roomgoto, 3), "hidden") || 0)
            return string("The asset {0} is not a room", roomgoto);
    }
    var door = "NONE"
    if (array_length(argument0) >= 3)
        door = argument0[2]
    with (obj_player1)
    {
        targetDoor = string_upper(door)
        set_lastroom()
    }
    scr_room_goto(roomgoto)
    sound_play("event:/sfx/misc/door")
}

function meta_room() //gml_Script_meta_room
{
    return 
    {
        description: "travel to a room",
        var arguments: ["targetRoom", "<targetDoor>"],
        suggestions: [function() //gml_Script_anon@1447@___struct___2_meta_room_sh_room
        {
            var room_array = []
            if instance_exists(obj_cyop_loader)
            {
                var map = ds_map_find_first(global.room_map)
                while (!is_undefined(map))
                {
                    array_push(room_array, map)
                    map = ds_map_find_next(global.room_map, map)
                }
            }
            else
            {
                var tags = tag_get_asset_ids("hidden", 3)
                var i = 0
                while room_exists(i)
                {
                    if (!(array_contains(tags, i)))
                        array_push(room_array, room_get_name(i))
                    i++
                }
                array_sort(room_array, 1)
            }
            return room_array;
        }, ["A", "B", "C", "D", "E", "F", "G"]],
        argumentDescriptions: ["room to travel to, input as name or index", "(optional) door index to place the player at"]
    };
}

