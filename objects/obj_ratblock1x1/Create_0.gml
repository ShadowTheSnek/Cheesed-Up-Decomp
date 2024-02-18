event_inherited()
spr_dead = spr_ratblock6_dead
if global.MIDWAY
{
    sprite_index = spr_ratblock6_bo
    spr_dead = spr_ratblock6_dead_bo
}
if sugary
{
    sprite_index = spr_chocofrogsmall
    spr_dead = spr_chocofrogsmalldead
}
depth = 2
anim = 0
animy = 0
if (check_char("V") || check_char("G") || check_char("S"))
    instance_destroy(other, false)
