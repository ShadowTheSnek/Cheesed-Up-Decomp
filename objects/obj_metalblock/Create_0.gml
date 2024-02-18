momentum = 
{
    x: 0,
    y: 0
}

playerindex = 0
depth = 1
particlespr = spr_metalblockdebris
if (global.blockstyle == (1 << 0))
{
    sprite_index = spr_metalb
    particlespr = spr_harddoughblockdead
}
if global.SUGARY
{
    sprite_index = spr_metalblock_ss
    particlespr = spr_metaldebris_ss
}
