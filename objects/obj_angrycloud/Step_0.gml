image_speed = 0.35
image_xscale = playerid.xscale
x = playerid.x
y = playerid.y
if ((global.combo < 25 && ((!global.heatmeter) || global.stylethreshold < 2)) || playerid.state != states.normal)
    instance_destroy()
