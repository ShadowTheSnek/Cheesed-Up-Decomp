image_speed = 0.35
visited = 0
depth = 103
group_arr = -4
offload_arr = -4
locked = 0
john = 0
alarm[0] = 1
uparrowID = scr_create_uparrowhitbox()
if (room == tower_5)
{
    if global.panic
    {
        with (obj_door)
            gml_Script_instance_create((x + 50), (y + 96), obj_rubble)
        with (obj_bossdoor)
            gml_Script_instance_create((x + 50), (y + 96), obj_rubble)
    }
}
compatibility = 0
sugary = global.SUGARY
if sugary
{
    depth = 50
    sprite_index = spr_doorunvisited_ss
}
