image_speed = 0.35
state = states.idle
alarm[0] = 1
depth = 10
start = 0
snd = fmod_event_create_instance("event:/sfx/pizzaface/shower")
fmod_event_instance_play(snd)
sound_instance_move(snd, x, y)
