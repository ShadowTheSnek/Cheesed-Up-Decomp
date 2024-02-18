active = 1
override_state = -4
override_sprite = obj_player1.spr_hurt
override_vars = {}
spr_open = spr_secretportal_spawnopen
spr_idle = spr_secretportal_spawnidle
spr_close = spr_secretportal_spawnclose
death = object_index == obj_deathportalexit
if death
{
    if (!global.MOD.DeathMode)
        instance_destroy()
    image_blend = 0xF8B8D8
}
sugary = (((!global.sugaryoverride) || death) ? global.SUGARY : check_sugarychar())
if sugary
{
    spr_open = spr_secretportal_spawnopen_ss
    spr_idle = spr_secretportal_spawnidle_ss
    spr_close = spr_secretportal_spawnclose_ss
    sprite_index = spr_open
}
if global.MIDWAY
{
    spr_open = spr_secretportal_spawnopen_bo
    spr_idle = spr_secretportal_spawnidle_bo
    spr_close = spr_secretportal_spawnclose_bo
    sprite_index = spr_open
}
if (death || ((!room_is_secret(obj_player1.lastroom)) && (!room_is_secret(room)) && (!instance_exists(obj_ghostcollectibles)) && (!instance_exists(obj_cyop_loader))) || obj_player1.state != (296 << 0))
{
    active = 0
    visible = false
}
if sugary
{
    with (obj_player1)
        image_blend_func = -4
}
if (obj_player1.lastroom == tower_soundtest || obj_player1.lastroom == tower_soundtestlevel)
    texturegroup_free("soundtestgroup")
