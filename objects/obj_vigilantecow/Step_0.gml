hsp = (xscale * spd)
if (flashbuffer > 0)
    flashbuffer--
else
    flash = 0
x += hsp
y += vsp
if (y >= ystart && vsp > 0)
{
    sound_play_3d("event:/sfx/vigilante/cowstomp", x, y)
    vsp = -16
    sprite_index = spr_cowbounce
    image_index = 0
    bounce -= 1
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    gml_Script_instance_create((x - 20), 448, obj_stampedecloud)
    gml_Script_instance_create(x, 448, obj_stampedecloud)
    gml_Script_instance_create((x + 20), 448, obj_stampedecloud)
}
if (bounce <= 0)
    instance_destroy()
if (vsp < 20)
    vsp += 0.5
if check_solid((x + (xscale * 4)), y)
    xscale *= -1
if (sprite_index == spr_cowidle)
    image_index = 0
else if (sprite_index == spr_cowbounce && floor(image_index) == (image_number - 1))
    sprite_index = spr_cowidle
mask_index = spr_bouncingcow_mask
