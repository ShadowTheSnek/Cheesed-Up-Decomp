use_static = 1
static_index = (sprite_get_number(spr_tvstatic) - 1)
static_dir = -1
sound_play("event:/sfx/ui/tvswitchback")
with (playerid)
{
    if (!isgustavo)
        state = states.normal
    else
        state = states.ratmount
    visible = true
    x = roomstartx
    y = roomstarty
    landAnim = 0
}
with (obj_ghostfollow)
{
    x = xstart
    y = ystart
}
