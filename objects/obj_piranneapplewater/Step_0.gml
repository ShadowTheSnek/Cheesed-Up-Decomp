if (vsp < 12)
    vsp += grav
if (floor(image_index) == 3 && (!shot))
{
    sound_play_3d("event:/sfx/misc/piranhabite", x, y)
    shot = 1
}
else if (floor(image_index) != 3)
    shot = 0
x += hsp
y += floor(vsp)
