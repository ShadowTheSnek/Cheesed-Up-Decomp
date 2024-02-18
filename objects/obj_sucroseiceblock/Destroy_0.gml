if (!in_saveroom())
{
    repeat (7)
    {
        with (gml_Script_instance_create((x + 32), (y + 32), obj_debris))
            sprite_index = spr_metaldebrishard_ss
    }
    sound_play_3d("event:/modded/sfx/glassbreak", x, y)
    if (content != noone)
        gml_Script_instance_create(x, y, content)
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    add_saveroom()
}
