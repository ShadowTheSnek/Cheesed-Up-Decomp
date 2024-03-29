if (!in_saveroom())
{
    gml_Script_instance_create((x + (sprite_width / 2)), (y + (sprite_height / 2)), obj_bangeffect)
    repeat (8)
    {
        with (create_debris((x + random_range(0, sprite_width)), (y + random_range(0, sprite_height)), spr_deadjohndebris))
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
        }
    }
    notification_push((14 << 0), [obj_deadjohnparent])
    repeat (5)
    {
        with (gml_Script_instance_create((x + random_range(0, 64)), (y + random_range(0, 64)), obj_parryeffect))
        {
            sprite_index = spr_deadjohnsmoke
            image_speed = 0.35
        }
    }
    scr_sleep(5)
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    gml_Script_instance_create((x + 32), (y + (sprite_height / 2)), obj_bangeffect)
    add_saveroom()
}
