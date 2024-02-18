event_inherited()
global.breaksound = 0
depth = 1
particlespr = spr_towerblockdebris
particlespd = 0.35
if (global.blockstyle == (1 << 0))
{
    sprite_index = spr_destroyable
    particlespr = spr_doughblockdead
}
if (global.blockstyle == (2 << 0))
{
    sprite_index = spr_destroyable_old
    particlespr = spr_debris
    particlespd = 0
}
if global.SUGARY
{
    sprite_index = spr_destroyable_ss
    particlespr = spr_debris_ss
    particlespd = 0
}
if global.MIDWAY
{
    sprite_index = spr_towerblocksmall_bo
    image_speed = 0
    image_index = irandom(image_number)
    particlespr = spr_towerblockdebris_bo
}
image_index = random_range(0, (image_number - 1))
