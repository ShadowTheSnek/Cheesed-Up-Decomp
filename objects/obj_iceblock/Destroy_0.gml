with (obj_collect)
{
    if place_meeting(x, y, other)
    {
        image_speed = 0.35
        image_alpha = 1
    }
}
if (!in_saveroom())
{
    var a = (image_xscale + image_yscale)
    repeat (6 * a)
    {
        var xx = (x + (irandom(abs(sprite_width)) * image_xscale))
        var yy = (y + (irandom(abs(sprite_height)) * image_yscale))
        if point_in_camera(xx, yy, view_camera[0])
            create_debris(xx, yy, spr_icedebris)
    }
    repeat a
    {
        xx = (x + (irandom(abs(sprite_width)) * image_xscale))
        yy = (y + (irandom(abs(sprite_height)) * image_yscale))
        if point_in_camera(xx, yy, view_camera[0])
            gml_Script_instance_create(xx, yy, obj_parryeffect)
    }
    var val = heat_calculate(10)
    global.collect += val
    with (gml_Script_instance_create((x + 16), y, obj_smallnumber))
        number = string(val)
    global.heattime += 10
    global.heattime = clamp(global.heattime, 0, 60)
    global.combotime += 10
    global.combotime = clamp(global.combotime, 0, 60)
    add_saveroom()
}
scr_destroy_tiles(32, "Tiles_1")
scr_destroy_tiles(32, "Tiles_2")
scr_destroy_tiles(32, "Tiles_3")
