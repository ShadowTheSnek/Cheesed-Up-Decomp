function global_message(argument0, argument1, argument2) //gml_Script_global_message
{
    if (argument0 == undefined)
        argument0 = "(error)"
    if (argument1 == undefined)
        argument1 = "Global Message"
    if (argument2 == undefined)
        argument2 = (room_speed * 5)
    with (obj_persistent)
    {
        gotmessage.message = argument0
        gotmessage.author = argument1
        gotmessage.time = argument2
        sound_play_centered("event:/sfx/noise/spin")
    }
}

