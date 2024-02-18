function scr_collectspr(argument0, argument1, argument2) //gml_Script_scr_collectspr
{
    if (argument0 == undefined)
        argument0 = object_index
    if (argument1 == undefined)
        argument1 = obj_player1
    if (argument2 == undefined)
        argument2 = 1
    var char = argument1.character
    var spr = spr_shroomcollect
    switch argument0
    {
        case obj_bigcollect:
            switch char
            {
                case "N":
                    spr = choose(spr_pizzacollect1halloween, spr_pizzacollect2halloween, spr_pizzacollect3halloween)
                    break
                case "SP":
                    spr = choose(spr_bigcollect1SP, spr_bigcollect2SP, spr_bigcollect3SP, spr_bigcollect4SP, spr_bigcollect5SP, spr_bigcollect6SP)
                    if (global.blockstyle == (2 << 0))
                        spr = choose(spr_bigcollect1SP_old, spr_bigcollect2SP_old, spr_bigcollect3SP_old)
                    break
                case "SN":
                    spr = choose(spr_bigcollect1SN, spr_bigcollect2SN, spr_bigcollect3SN)
                    break
                case "S":
                    spr = spr_snickcollectible2
                    break
                case "BN":
                    spr = choose(spr_pizzacollect1halloween_bo, spr_pizzacollect2halloween_bo, spr_pizzacollect3halloween_bo)
                    break
                default:
                    spr = choose(spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5)
                    if (global.blockstyle == (2 << 0))
                        spr = choose(spr_pizzacollect1_old, spr_pizzacollect2_old, spr_pizzacollect3_old)
                    break
            }

            break
        case obj_giantcollect:
            switch char
            {
                case "N":
                    spr = spr_giantpizzahalloween
                    break
                case "SP":
                    spr = choose(spr_giantcollect1SP, spr_giantcollect2SP, spr_giantcollect3SP, spr_giantcollect4SP)
                    if (global.blockstyle == (2 << 0))
                        spr = spr_giantcollectSP_old
                    break
                case "S":
                    spr = spr_snickcollectible3
                    break
                default:
                    spr = spr_giantpizza
                    break
            }

            break
        default:
            switch char
            {
                case "N":
                    spr = choose(spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5)
                    break
                case "SP":
                    spr = choose(spr_collect1SP, spr_collect2SP, spr_collect3SP, spr_collect4SP, spr_collect5SP)
                    if (global.blockstyle == (2 << 0))
                        spr = ds_map_find_value(global.SPRITES, (sprite_get_name(spr) + "_old"))
                    spr_palette = spr_collectSP_palette
                    paletteselect = choose(1, 2, 3, 4, 5)
                    break
                case "S":
                    spr = spr_snickcollectible1
                    break
                case "BN":
                    spr = choose(spr_halloweencollectibles1_bo, spr_halloweencollectibles2_bo, spr_halloweencollectibles3_bo, spr_halloweencollectibles4_bo, spr_halloweencollectibles5_bo)
                    break
                default:
                    spr = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect)
                    if (global.blockstyle == (2 << 0))
                        spr = ds_map_find_value(global.SPRITES, (sprite_get_name(spr) + "_old"))
                    break
            }

            break
    }

    if argument2
        sprite_index = spr
    return spr;
}

