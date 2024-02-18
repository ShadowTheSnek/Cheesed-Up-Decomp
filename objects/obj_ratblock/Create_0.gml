event_inherited()
spr_dead = spr_ratblock_dead
depth = 2
anim = 0
baddie = 0
animy = 0
sniffsnd = fmod_event_create_instance("event:/sfx/rat/ratsniff")
sound_instance_move(sniffsnd, x, y)
use_sound = 1
deadsnd = "event:/sfx/rat/ratdead"
if (place_meeting((x + 1), y, object_index) && place_meeting((x - 1), y, object_index))
    use_sound = 0
if (use_sound && place_meeting((x + 1), y, object_index) && (!(place_meeting((x - 1), y, object_index))))
    use_sound = 0
if (global.MIDWAY && sprite_index == spr_ratblock)
{
    sprite_index = spr_ratblock_bo
    spr_dead = spr_ratblock_dead_bo
    use_sound = 0
}
sugary = global.SUGARY
if (sugary && sprite_index == spr_ratblock)
{
    sprite_index = spr_chocofrogbig
    spr_dead = spr_chocofrogbigdead
    use_sound = 0
}
