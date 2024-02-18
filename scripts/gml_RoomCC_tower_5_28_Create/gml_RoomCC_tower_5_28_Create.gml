if in_saveroom()
    return;
ini_open_from_string(obj_savesystem.ini_str_options)
var con = ini_read_real("Modded", "con", 0)
ini_close()
if ((con > 0 || irandom(5) != 0 || (get_timer() / 1000000) < 300 || safe_get(obj_shell, "WC_showinvisible") || safe_get(obj_shell, "WC_showcollisions") || safe_get(obj_shell, "WC_select_mode") != -1 || safe_get(obj_player, "state") == (208 << 0) || 1) && (!((0 && keyboard_check(ord("E"))))))
{
    with (instance_place(x, (y - 32), obj_solid))
        image_yscale += 2
    instance_destroy(id, false)
    with (obj_secretbigblock)
    {
        if (x > other.x)
            instance_destroy(id, false)
    }
    with (obj_hallway)
    {
        if (x > other.x)
            instance_destroy(id, false)
    }
    with (obj_doorX)
    {
        if (x > other.x)
            instance_destroy(id, false)
    }
    instance_destroy(obj_eventtrigger)
}
