global.roommessage = gml_Script_lang_get_value("room_tower3")
if (global.panic == 0)
    global.gameframe_caption_text = gml_Script_lang_get_value_newline("caption_tower3")
if global.panic
{
    with (obj_door)
        gml_Script_instance_create((x + 50), (y + 96), obj_rubble)
    with (obj_bossdoor)
        gml_Script_instance_create((x + 50), (y + 96), obj_rubble)
    instance_destroy(obj_door)
    instance_destroy(obj_bossdoor)
}
global.door_sprite = spr_door
global.door_index = 2
scr_random_granny()
if global.panic
    global.roommessage = "LETS MAKE SOME NOISE"
