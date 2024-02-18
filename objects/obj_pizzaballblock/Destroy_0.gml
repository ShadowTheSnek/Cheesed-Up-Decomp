if (!in_saveroom())
{
    if global.gameplay
        scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    for (var i = 0; i < sprite_get_number(spr_pizzaballblock_debris); i++)
    {
        with (create_debris((global.gameplay ? random_range(bbox_left, bbox_right) : x), (global.gameplay ? random_range(bbox_top, bbox_bottom) : y), spr_pizzaballblock_debris))
            image_index = i
    }
    add_saveroom()
}
