if (room == rm_editor)
    return;
event_inherited()
image_speed = 0.35
depth = 1
solid_inst = -4
if instance_exists(obj_cyop_loader)
    alarm[0] = 1
else
    event_perform(ev_alarm, 0)
if (global.blockstyle == (2 << 0))
    sprite_index = spr_onewaybigblock_old
sugary = global.SUGARY
if sugary
    sprite_index = spr_onewaybigblock_ss
bo = global.MIDWAY
if bo
    sprite_index = spr_onewaybigblock_bo
