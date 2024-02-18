var _temp_local_var_7;
draw_set_color(c_white)
for (var i = 0; i < ds_list_size(collectiblelist); i++)
{
    var b = ds_list_find_value(collectiblelist, i)
    draw_sprite_ext(b.sprite_index, b.image_index, b.x, b.y, 1, 1, 0, c_white, b.image_alpha)
    if b.pizzasona
    {
        var _temp_local_var_7 = (global.gameplay ? 46 : 49)
        draw_sprite_ext((check_sugary() ? spr_movingplatformSS : spr_chigaco), b.image_index, b.x, (b.y + b.x), 1, 1, 0, c_white, b.image_alpha)
    }
}
