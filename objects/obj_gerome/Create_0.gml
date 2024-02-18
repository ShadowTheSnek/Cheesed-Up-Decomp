event_inherited()
image_speed = 0.35
if global.SUGARY
    sprite_index = spr_gerome_idle_ss
else
    sprite_index = choose(spr_gerome_idle1, spr_gerome_idle2, spr_gerome_idle3)
image_xscale = 1
grabbed = 0
init_collision()
flash = 1
unpickable = 0
hp = 0
state = states.normal
playerid = obj_player1
mask_index = spr_player_mask
depth = -5
thrown = 0
