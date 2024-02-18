with (other)
{
    if shotgunAnim
    {
        shotgunAnim = 0
        sound_play_3d("event:/sfx/misc/detransfo", x, y)
        with (gml_Script_instance_create(x, y, obj_sausageman_dead))
            sprite_index = spr_shotgunback
    }
}
