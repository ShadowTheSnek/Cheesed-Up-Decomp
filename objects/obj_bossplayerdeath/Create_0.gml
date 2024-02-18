with (obj_player1)
{
    state = states.actor
    sprite_index = spr_player_outofpizza1
    image_index = 0
    deathspeed = 10
    vsp = -12
}
depth = -600
fade = 0
fade2 = 0
fade2start = 0
state = states.jump
if (global.jukebox != -4)
    return;
with (obj_music)
{
    if (music != noone)
        fmod_event_instance_stop(music.event, 0)
}
