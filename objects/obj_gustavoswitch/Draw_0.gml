pal_swap_player_palette(undefined, undefined, undefined, undefined, undefined, 1)
if (sprite_index == spr_gustavoswitch2 && instance_exists(obj_charswitch_intro) && obj_charswitch_intro.state != states.fall)
    draw_sprite_ext(spr_gustavoswitch1, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
else if visible
    draw_self()
pal_swap_reset()
