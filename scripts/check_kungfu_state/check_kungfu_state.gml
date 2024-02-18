function check_kungfu_state(argument0) //gml_Script_check_kungfu_state
{
    if (argument0 == undefined)
        argument0 = id
    with (argument0)
        return (state == states.punch && string_pos("kungfu", sprite_get_name(sprite_index)) > 0);
}

