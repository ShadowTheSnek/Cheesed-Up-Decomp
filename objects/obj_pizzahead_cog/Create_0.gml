image_speed = 0
depth = -1
sound_play_3d("event:/sfx/enemies/projectile", x, y)
snd = fmod_event_create_instance("event:/sfx/pizzahead/cog")
init_collision()
landed = 0
alarm[0] = 10
bullethit = 3
flash = 0
flashbuffer = 0
