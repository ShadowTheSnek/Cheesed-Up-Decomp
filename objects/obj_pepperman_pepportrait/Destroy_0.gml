gml_Script_instance_create(x, y, obj_bangeffect)
with (gml_Script_instance_create(x, y, obj_sausageman_dead))
{
    sprite_index = other.sprite_index
    image_xscale = other.image_xscale
    vsp = -5
    hsp = other.sourcehsp
}
sound_play_3d("event:/sfx/enemies/kill", x, y)
