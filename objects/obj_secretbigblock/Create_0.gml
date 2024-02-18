event_inherited()
particlespr = spr_towerblockdebris
targettiles = ["Tiles_1", "Tiles_2", "Tiles_3", "Tiles_4", "Tiles_Foreground1", "Tiles_Foreground2"]
if (global.blockstyle == (2 << 0))
    particlespr = spr_bigdebris
if global.SUGARY
    particlespr = spr_bigdebris_ss
if global.MIDWAY
    sprite_index = spr_towerblock_bo
if (instance_exists(obj_ghostcollectibles) && global.gameplay)
    particlespr = spr_eyedebris
