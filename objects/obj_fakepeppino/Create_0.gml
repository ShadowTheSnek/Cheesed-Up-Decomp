init_collision()
vsp = 1
movespeed = 8
state = states.normal
image_speed = 0.35
depth = -1
appeartimer = 200
start_x = 0
start_y = 0
followqueue = ds_queue_create()
LAG_STEPS = 50
touched = 0
targetRoom = room
targetDoor = obj_player1.targetDoor
steppy = 0
