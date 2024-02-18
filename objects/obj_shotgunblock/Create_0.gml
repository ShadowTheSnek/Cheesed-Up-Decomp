depth = 104
with (obj_player1)
{
    if (check_char("G") || check_char("S"))
        instance_destroy(other, false)
}
if (global.blockstyle == (2 << 0))
    sprite_index = spr_targetblock_old
