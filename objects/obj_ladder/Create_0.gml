depth = 7
if global.SUGARY
{
    visible = true
    sprite_index = spr_ladder_sugary
    depth = 32
}
if (((global.leveltosave == "grinch" || global.leveltosave == "etb" || global.leveltosave == "ancient") && (!room_is_secret(room))) || global.MOD.OldLevels)
    visible = true
if global.gameplay
    mask_index = spr_solid
