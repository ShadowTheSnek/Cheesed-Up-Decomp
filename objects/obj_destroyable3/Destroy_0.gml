if (!in_saveroom())
{
    if (particlespr == spr_bigdoughblockdead)
    {
        with (gml_Script_instance_create((x + (sprite_width / 2)), (y + (sprite_height / 2)), obj_sausageman_dead))
            sprite_index = other.particlespr
    }
    else
    {
        repeat (8)
        {
            with (create_debris((x + random_range(0, 64)), (y + random_range(0, 64)), particlespr, 1))
            {
                hsp = random_range(-5, 5)
                vsp = random_range(-10, 10)
                image_speed = other.particlespd
            }
        }
    }
    if (sprite_index == spr_towerblock)
    {
        repeat (3)
        {
            with (gml_Script_instance_create((x + random_range(0, 64)), (y + random_range(0, 64)), obj_parryeffect))
            {
                sprite_index = spr_deadjohnsmoke
                image_speed = 0.35
            }
        }
    }
    scr_sleep(5)
    notification_push((45 << 0), [room])
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    add_saveroom()
}
