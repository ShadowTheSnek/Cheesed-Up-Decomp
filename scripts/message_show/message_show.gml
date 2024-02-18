function message_show(argument0, argument1) //gml_Script_message_show
{
    if (argument1 == undefined)
        argument1 = 100
    with (obj_roomname)
    {
        visible = true
        showtext = 1
        global.roommessage = string_upper(argument0)
        yi = -50
        alarm[0] = argument1
        sound_play_centered("event:/sfx/pep/hurt")
    }
}

