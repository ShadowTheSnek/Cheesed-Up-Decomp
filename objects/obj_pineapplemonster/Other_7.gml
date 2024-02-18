if (!fadeout)
{
    image_speed = 0
    image_index = (image_number - 1)
    fadeout = 1
    if monster
        scr_monster_activate()
    if (content != noone)
    {
        if (content == obj_bazooka)
            content = obj_pineappleprojectilespawn
        with (gml_Script_instance_create(x, y, content))
        {
            create_particle(x, y, (9 << 0))
            if (object_index == obj_bazooka)
            {
                sound_play_3d("event:/sfx/enemies/piranha", x, y)
                sprite_index = spr_piraneapple_projectile
                destroy = 0
            }
        }
    }
}
