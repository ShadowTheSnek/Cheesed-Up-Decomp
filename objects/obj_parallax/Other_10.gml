var _bg = layer_background_get_id_fix("Backgrounds_still1")
if global.panic
{
    layer_background_sprite(_bg, bg_sucrose_skyActive)
    layer_background_index(_bg, 0)
    layer_background_speed(_bg, 0.35)
    return;
}
sucrose_state++
switch sucrose_state
{
    case 0:
        break
    case 1:
        layer_background_sprite(_bg, bg_sucrose_skyWakingUp)
        layer_background_index(_bg, 0)
        layer_background_speed(_bg, 0.25)
        break
    default:
        instance_create_unique(0, 0, obj_hungrypillarflash)
        activate_panic(1)
        layer_background_sprite(_bg, bg_sucrose_skyActive)
        layer_background_index(_bg, 0)
        layer_background_speed(_bg, 0.35)
        break
}

