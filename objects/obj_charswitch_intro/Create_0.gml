x = (obj_screensizer.actual_width / 2)
y = (obj_screensizer.actual_height + sprite_get_height(spr_gustavo_intro))
movespeed = 8
state = states.transitioncutscene
depth = -600
sprite_index = spr_tvstatic
image_index = 0
image_speed = 0.35
spr = -4
obj_camera.lock = 1
sound_play("event:/sfx/ui/tvswitch")
shakey = 0
