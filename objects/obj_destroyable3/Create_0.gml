event_inherited()
depth = 1
particlespr = spr_towerblockdebris
particlespd = 0.35
if (global.blockstyle == (1 << 0))
{
    sprite_index = spr_bigdestroy
    particlespr = spr_bigdoughblockdead
}
if (global.blockstyle == (2 << 0))
{
    sprite_index = spr_bigdestroy_old
    particlespr = spr_bigdebris
    particlespd = 0
}
if global.SUGARY
{
    sprite_index = spr_destroyable3_ss
    particlespr = spr_bigdebris_ss
    particlespd = 0
}
if global.MIDWAY
{
    sprite_index = spr_towerblock_bo
    image_speed = 0
    image_index = irandom(image_number)
    particlespr = spr_towerblockdebris_bo
}
