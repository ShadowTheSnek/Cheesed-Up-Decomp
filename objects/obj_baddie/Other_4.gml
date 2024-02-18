if in_baddieroom()
{
    instance_destroy()
    return;
}
if instance_exists(obj_cyop_loader)
{
    while place_meeting(x, y, obj_solid)
        y--
    if (paletteselect != 0)
    {
        basepal = paletteselect
        elitepal = paletteselect
    }
}
if safe_get(id, "escape")
{
    if (escapespawnID == -4)
    {
        with (gml_Script_instance_create(x, y, obj_escapespawn))
        {
            baddieID = other.id
            other.escapespawnID = id
        }
        instance_deactivate_object_hook(id)
    }
}
if (safe_get(id, "elite") && object_index != obj_robot)
{
    hp += 1
    elitehp = hp
}
if (object_index == obj_cheeseslime && snotty)
{
    if (global.panic == 1)
    {
        add_baddieroom()
        instance_destroy()
    }
    important = 1
    ini_open_from_string(obj_savesystem.ini_str)
    if ini_read_real("Game", "snotty", 0)
    {
        add_baddieroom()
        instance_destroy()
        if (!global.panic)
            gml_Script_instance_create(x, y, obj_snotty)
    }
    ini_close()
}
if (check_heat() && ((safe_get(id, "elite") && use_elite) || global.stylethreshold >= 3))
    paletteselect = elitepal
if global.SUGARY
{
    var i = 1
    while (i < 32)
    {
        if scr_solid(x, (y + i))
        {
            y += (i - 1)
            break
        }
        else
        {
            i++
            continue
        }
    }
}
