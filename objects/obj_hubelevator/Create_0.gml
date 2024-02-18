ini_open_from_string(obj_savesystem.ini_str)
if (((!(ini_key_exists("Ranks", "exit"))) && (!global.sandbox)) || instance_exists(obj_cyop_loader))
{
    var tr = room
    if variable_instance_exists(id, "targetRoom")
        tr = targetRoom
    instance_change(obj_door, true)
    targetRoom = tr
    event_perform_object(obj_door, ev_other, ev_room_start)
    ini_close()
    return;
}
ini_close()
scr_create_uparrowhitbox()
depth = 99
sprite_index = spr_elevatoropen
state = states.normal
targetDoor = "A"
sel = 0
if global.panic
{
    gml_Script_instance_create((x + 50), (y + 96), obj_rubble)
    instance_destroy()
}
outback = animcurve_get_channel(curve_menu, "outback")
incubic = animcurve_get_channel(curve_menu, "incubic")
anim_t = 0
angle = 360
scr_init_input()
hub_array = []
function add_floor@gml_Object_obj_hubelevator_Create_0(argument0, argument1, argument2, argument3, argument4) //gml_Script_add_floor@gml_Object_obj_hubelevator_Create_0
{
    if (argument3 == undefined)
        argument3 = -4
    if (argument4 == undefined)
        argument4 = -4
    var a = [argument0, argument1, argument2, argument3, argument4]
    array_push(hub_array, a)
    return a;
}

if (!instance_exists(obj_cyop_loader))
{
    add_floor(5, tower_5, "E")
    add_floor(4, tower_4, "B")
    add_floor(3, tower_3, "C")
    add_floor(2, tower_2, "E")
    add_floor(1, tower_1, "E")
    add_floor(0, tower_extra, "G")
    add_floor(6, tower_sugary, "A", ["sugarygroup"])
}
else
    add_floor(1, room, "A")
offload_arr = -4
buffer = 0
