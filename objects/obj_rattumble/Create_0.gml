event_inherited()
spr_dead = spr_rattumbleblock_dead
depth = 2
anim = 0
animy = 0
sniffsnd = fmod_event_create_instance("event:/sfx/rat/ratsniff")
sound_instance_move(sniffsnd, x, y)
deadsnd = "event:/sfx/rat/ratbowling"
use_sound = 1
if (place_meeting((x + 1), y, object_index) && place_meeting((x - 1), y, object_index))
    use_sound = 0
if (use_sound && place_meeting((x + 1), y, object_index) && (!(place_meeting((x - 1), y, object_index))))
    use_sound = 0
