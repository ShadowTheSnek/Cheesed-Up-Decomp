active = 1
trigger = 0
touched = 0
playerid = -4
secret = room_is_secret(room)
depth = 107
soundtest = 0
spr_open = spr_secretportal_open
spr_idle = spr_secretportal_idle
spr_close = spr_secretportal_close
death = global.MOD.DeathMode
if death
    image_blend = 0xF8B8D8
sugary = (((!global.sugaryoverride) || death) ? global.SUGARY : check_sugarychar())
if sugary
{
    spr_open = spr_secretportal_open_ss
    spr_idle = spr_secretportal_idle_ss
    spr_close = spr_secretportal_close_ss
    sprite_index = spr_idle
    mask_index = spr_idle
}
if (global.SUGARY && secret)
    depth = 10
if global.MIDWAY
{
    spr_open = spr_secretportal_open_bo
    spr_idle = spr_secretportal_idle_bo
    spr_close = spr_secretportal_close_bo
    sprite_index = spr_idle
    mask_index = spr_idle
}
ID = id
