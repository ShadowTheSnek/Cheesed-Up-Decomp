ini_open_from_string(obj_savesystem.ini_str)
unlocked = ini_read_real(save, "unlocked", 0)
first = ini_read_real(save, "first", 0)
ini_close()
if global.sandbox
{
    first = 1
    unlocked = 1
}
if (first && (!unlocked))
{
    with (gml_Script_instance_create(obj_stick_target.x, obj_stick_target.y, obj_stick))
    {
        state = states.normal
        maxscore = other.maxscore
        save = other.save
    }
}
if ((!unlocked) && (global.pigtotal - global.pigreduction) >= maxscore)
    gml_Script_instance_create(0, 0, obj_mrsticknotification)
if unlocked
{
    if (room != tower_5)
    {
        with (gml_Script_instance_create(x, y, obj_bossdoor))
        {
            sprite_index = other.gate_sprite
            bgsprite = other.bgsprite
            targetRoom = other.targetRoom
            group_arr = other.group_arr
            msg = other.msg
        }
    }
    else
    {
        with (gml_Script_instance_create(x, y, obj_door))
            targetRoom = other.targetRoom
    }
    instance_destroy()
}
