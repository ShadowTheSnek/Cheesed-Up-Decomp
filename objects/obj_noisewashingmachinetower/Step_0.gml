if (grounded && vsp > 0)
{
    sound_play_3d("event:/sfx/enemies/killingblow", x, y)
    sound_play_3d("event:/sfx/pep/jump", x, y)
    vsp = -11
    image_index = 0
    gml_Script_instance_create(x, (y + 43), obj_bangeffect)
    create_particle(x, y, (3 << 0))
}
if (floor(image_index) == (image_number - 1))
    image_index = (image_number - 1)
mask_index = spr_player_mask
scr_collide()
