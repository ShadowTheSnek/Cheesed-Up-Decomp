with (gml_Script_instance_create(x, y, obj_bazooka))
{
    create_particle(x, y, (9 << 0))
    sound_play_3d("event:/sfx/enemies/piranha", x, y)
    sprite_index = spr_piraneapple_projectile
    destroy = 0
}
instance_destroy()
