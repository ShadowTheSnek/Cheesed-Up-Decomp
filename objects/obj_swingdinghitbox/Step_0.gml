x = playerid.x
y = playerid.y
with (playerid)
{
    if ((state != states.grab || sprite_index != spr_swingding) && state != states.punch)
        instance_destroy(other)
}
