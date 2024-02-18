if (state == states.grabbed)
{
    grabbedby = 1
    scr_enemy_grabbed()
}
if linethrown
{
    linethrown = 0
    hithsp = clamp(hithsp, -15, 15)
    hsp = clamp(hsp, -15, 15)
}
