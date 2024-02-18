if (room == custom_lvl_room)
    tile_layer_delete_at(1, x, y)
if (!in_saveroom())
{
    repeat (2)
    {
        with (create_debris((x + random_range(0, sprite_width)), (y + random_range(0, sprite_height)), spr_forestblockdebris, 0))
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
            image_speed = 0
        }
    }
    notification_push((14 << 0), [object_index])
    scr_sleep(5)
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    add_saveroom()
}
