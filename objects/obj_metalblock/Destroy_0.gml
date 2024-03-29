if (!in_saveroom())
{
    if (particlespr == spr_harddoughblockdead)
    {
        with (gml_Script_instance_create((x + (sprite_width / 2)), (y + (sprite_height / 2)), obj_sausageman_dead))
            sprite_index = other.particlespr
    }
    else
    {
        repeat (8)
        {
            with (create_debris((x + random_range(0, 64)), (y + random_range(0, 64)), particlespr, 0))
            {
                hsp = random_range(-5, 5)
                vsp = random_range(-10, 10)
                image_speed = 0
                image_index = random_range(0, (image_number - 1))
            }
        }
    }
    scr_sleep(5)
    gml_Script_instance_create((x + 32), (y + 32), obj_bangeffect)
    with (obj_camera)
    {
        shake_mag = 20
        shake_mag_acc = (40 / room_speed)
    }
    GamepadSetVibration(playerindex, 1, 1, 0.8)
    sound_play("event:/sfx/misc/breakmetal")
    add_saveroom()
}
