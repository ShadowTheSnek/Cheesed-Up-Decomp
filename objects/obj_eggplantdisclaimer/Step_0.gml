var accel = 0.015
if (!fadeout)
{
    fade = Approach(fade, 0, accel)
    if (fade <= 0)
    {
        fadeout = 1
        alarm[0] = 240
    }
}
else if changeroom
{
    fade = Approach(fade, 1, accel)
    if (fade >= 1 && (!instance_exists(obj_fadeout)))
    {
        with (obj_player)
        {
            targetRoom = rm_levelselect
            targetDoor = "A"
        }
        gml_Script_instance_create(0, 0, obj_fadeout)
    }
}
