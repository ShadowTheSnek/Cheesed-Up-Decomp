if (!global.option_hud)
    return;
if (!global.gameplay)
{
    for (var i = 0; i < array_length(afterimages); i++)
    {
        var b = afterimages[i]
        trace(string("combo after image {0}: {1}", i, b[3]))
        draw_sprite_ext(b[2], b[3], b[0], b[1], image_xscale, image_yscale, image_angle, image_blend, b[4])
        afterimages[i][4] -= 0.15
    }
}
scr_combotitledraw(sprite_index, x, y, title, title_index)
