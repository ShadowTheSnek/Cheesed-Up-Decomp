var checker = obj_player1.character == character
if (checker == invert)
    return;
if is_array(obj)
    array_foreach(obj, function(argument0) //gml_Script_anon@126@gml_Object_obj_vigidelete_Other_4
    {
        with (argument0)
        {
            if ((!persistent) && place_meeting(x, y, other))
                instance_destroy(id, false)
        }
    }
)
else
{
    with (obj)
    {
        if ((!persistent) && place_meeting(x, y, other))
            instance_destroy(id, false)
    }
}
