image_speed = 0.35
init_collision()
grav = 0.5
part = 0
partx = 0
party = 0
if check_solid(x, y)
{
    y = 16
    part = 1
    partx = x
    party = y
    alarm[0] = 1
    x = clamp(x, 96, (room_width - 96))
}
with (obj_bosscontroller)
    other.sprite_index = spr_playerhp
