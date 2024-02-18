global.roommessage = gml_Script_lang_get_value("room_towertask3")
if global.panic
{
    with (obj_door)
        gml_Script_instance_create((x + 50), (y + 96), obj_rubble)
    with (obj_bossdoor)
        gml_Script_instance_create((x + 50), (y + 96), obj_rubble)
    instance_destroy(obj_door)
    instance_destroy(obj_bossdoor)
}
