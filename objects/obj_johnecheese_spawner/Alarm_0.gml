if instance_exists(obj_vigilanteboss)
{
    if (obj_vigilanteboss.x > (room_width / 2))
        gml_Script_instance_create((room_width - 200), -80, obj_johnecheese)
    else
        gml_Script_instance_create(200, -80, obj_johnecheese)
}
