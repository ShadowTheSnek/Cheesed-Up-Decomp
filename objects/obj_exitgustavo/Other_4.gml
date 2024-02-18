var stick = 0
var sugary = check_sugary()
if (global.leveltosave == "forest" || global.leveltosave == "street")
    stick = 1
else if (irandom(100) <= 15)
    stick = 1
var r = string_letters(room_get_name(room))
if (sprite_index != spr_gustavo_exitsign || r == "saloon" || room == space_11b || r == "freezer" || r == "chateau" || r == "floor5")
    stick = 0
if (check_char("G") && (!sugary))
    stick = 1
if stick
{
    if sugary
    {
        spr_fall = spr_polka_fall
        spr_idle = spr_polka_exit
        spr_taunt = spr_polka_taunt
    }
    else
    {
        ystart -= 6
        spr_fall = spr_stick_fall
        spr_idle = spr_stick_exit
    }
}
else if sugary
{
    spr_fall = spr_rosette_fall
    spr_idle = spr_rosette_exit
    spr_taunt = spr_rosette_cheer
    spr_dull = spr_rosette_dull
}
