MAX_TOTEMCHEESE = 2
active = 0
trigger = 1
cheeseID = array_create(MAX_TOTEMCHEESE, -4)
machslidebuffer = 0
machslidecount = 0
machslidecounted = 0
depth = -5
snd = fmod_event_create_instance("event:/sfx/enemies/tribaldance")
sound_instance_move(snd, x, y)
