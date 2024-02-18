if ((!start) && (!in_saveroom()))
{
    start = 1
    sound_play_3d("event:/sfx/misc/racestart", x, y)
    with (obj_horsey)
    {
        hsp = (other.hsp * other.spd)
        vsp = (other.vsp * other.spd)
        spd = other.spd
        with (gml_Script_instance_create(x, y, obj_objecticontracker))
        {
            objectID = other.id
            sprite_index = spr_icon_horsey
        }
    }
    with (obj_raceend)
        start = 1
    sprite = spr_horsey_start2
    start_index = 0
    global.horse = 1
}
