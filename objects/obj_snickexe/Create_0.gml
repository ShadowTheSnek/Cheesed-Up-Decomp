maxspeed = 2
hitboxcreate = 0
image_speed = 0.35
depth = -5
function anon@86@gml_Object_obj_snickexe_Create_0(argument0) //gml_Script_anon@86@gml_Object_obj_snickexe_Create_0
{
    if (argument0 == undefined)
        argument0 = 1
    if (y > -50 && y < (room_height + 50) && argument0)
        create_particle(x, y, (9 << 0))
    if (global.snickrematch && event_type != 7 && object_index != obj_snickexe)
    {
        deactivate = 1
        alarm[1] = (room_speed * 5)
    }
    knocked = 0
    hspeed = 0
    vspeed = 0
    image_angle = 0
    x = (room_width / 2)
    y = -50
    hitboxcreate = 0
    maxspeed = 2
    if (global.lapmode == (2 << 0) && global.laps >= 2)
        maxspeed = 4
    if (room == ruin_4 || room == ruin_7 || room == ruin_4_OLD || room == ruin_7_OLD)
        y = (room_height + 50)
}

knocked = 0
enemybird = 0
enemybirdi = 0
after = 0
deactivate = 0
if (object_index == obj_snickexe)
{
    if global.SUGARY
        sprite_index = spr_yogurtexe
    create_transformation_tip(embed_value_string(gml_Script_lang_get_value_newline("snickiscoming"), [(global.SUGARY ? "Yogurt" : "Snick")]))
}
