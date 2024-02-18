image_speed = 0.35
mask_index = spr_presentbox_idle
use_collision = 0
init_collision()
activatespr = spr_presentbox_activate
depth = 0
if global.SUGARY
{
    sprite_index = spr_presentbox_ss
    activatespr = spr_presentbox_activate_ss
}
