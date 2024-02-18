alarm[0] = 1
maxmovespeed = 3
movespeed = maxmovespeed
dir = 1
depth = 50
spr_left = -4
spr_right = -4
objectlist = [obj_dashpad, obj_movingspike, obj_fakesuperspring, obj_pinballlauncher]
use_left = 1
use_right = 1
draw = 1
if place_meeting((x + 1), y, obj_solid)
    use_right = 0
if place_meeting((x - 1), y, obj_solid)
    use_left = 0
surf = -4
