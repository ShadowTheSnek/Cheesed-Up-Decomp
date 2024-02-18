if (object_index == obj_junk)
{
    if ((!instance_exists(obj_cyop_loader)) || global.gameplay)
    {
        instance_change(obj_junkNEW, false)
        event_perform_object(obj_junkNEW, ev_create, 0)
        return;
    }
    else
        scr_initenemy()
}
ratgrabbed = 0
grabbed = 0
state = states.normal
init_collision()
flash = 1
unpickable = 0
hp = 0
grounded = 1
state = states.normal
playerid = obj_player1
image_speed = 0
image_index = random_range(0, (image_number - 1))
mask_index = spr_player_mask
depth = -5
thrown = 0
use_collision = 1
