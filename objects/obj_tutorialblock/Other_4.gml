if global.sandbox
{
    instance_destroy(id, false)
    return;
}
ini_open_from_string(obj_savesystem.ini_str)
var _destroyed = ini_read_real("Tutorial", "finished", 0)
if _destroyed
{
    _destroyed = ini_read_real("Tutorial", "tutorialcutscene", 0)
    if (!_destroyed)
    {
        ini_write_real("Tutorial", "tutorialcutscene", 1)
        with (obj_tutorialblock)
        {
            with (obj_player)
            {
                if place_meeting(x, y, obj_startgate)
                    other.alarm[0] = 100
            }
        }
    }
    if (alarm[0] == -1)
        instance_destroy()
    obj_savesystem.ini_str = ini_close()
}
else
    ini_close()
