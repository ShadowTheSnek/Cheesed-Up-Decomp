if instance_exists(obj_cyop_loader)
    return;
with (obj_deathmode)
    depth = 1
var layers = layer_get_all()
for (var i = 0; i < array_length(layers); i++)
{
    var lay = layers[i]
    if (!layer_exists(lay))
    {
    }
    else
    {
        var layname = layer_get_name_fix(lay)
        if string_starts_with(layname, "Tiles_BG")
        {
            var no = string_digits(layname)
            if (no != "")
                no = (real(no) - 1)
            else
                no = 0
            layer_depth(lay, (200 - no))
        }
        else if string_starts_with(layname, "Tiles_Foreground")
        {
            no = string_digits(layname)
            if (no != "")
                no = real(no)
            else
                no = 0
            layer_depth(lay, (100 - no))
        }
        else if (string_starts_with(layname, "Tiles_") && (!(string_starts_with(layname, "Tiles_Secret"))))
        {
            no = string_digits(layname)
            if (no != "")
                no = (real(no) - 1)
            else
                no = 0
            layer_depth(lay, (100 - no))
        }
        if string_starts_with(layname, "Assets_BG")
        {
            no = string_digits(layname)
            if (no != "")
                no = (real(no) - 1)
            else
                no = 0
            layer_depth(lay, (201 + no))
        }
        if string_starts_with(layname, "Assets_FG")
        {
            no = string_digits(layname)
            if (no != "")
                no = (real(no) - 1)
            else
                no = 0
            layer_depth(lay, (-350 - no))
        }
        var assetlay = array_get_index(asset_layers, layname, 0, infinity)
        if (assetlay != -1)
        {
            var p = asset_parallax[assetlay]
            var q = layer_get_all_elements(lay)
            for (var j = 0; j < array_length(q); j++)
            {
                var _asset = q[j]
                var _x = layer_sprite_get_x(_asset)
                var _y = layer_sprite_get_y(_asset)
                var spr = layer_sprite_get_sprite(_asset)
                if (p[0] != 0)
                    layer_sprite_x(_asset, ((_x - (_x * p[0])) + ((obj_screensizer.actual_width / 4) * p[0])))
                if (p[1] != 0 && spr != spr_industrialpipe && spr != bg_farmdirtwall)
                    layer_sprite_y(_asset, ((_y - (_y * p[1])) + ((obj_screensizer.actual_height / 4) * p[1])))
            }
        }
        var tilemap = layer_tilemap_get_id_fix(lay)
        if (tilemap != -1)
        {
            if global.hidetiles
                layer_set_visible(lay, 0)
            else if global.gameplay
            {
                var newtileset = asset_get_index((tileset_get_name(tilemap_get_tileset(tilemap)) + "_NEW"))
                if (newtileset != -1)
                    tilemap_tileset(tilemap, newtileset)
            }
            with (obj_deathmode)
            {
                var dep = (layer_get_depth(lay) + 1)
                if (depth < dep)
                    depth = dep
            }
        }
        if (layname == "Foreground_A")
        {
            var roombgs = room_get_bg_layers()
            for (j = 0; j < array_length(roombgs); j++)
            {
                spr = roombgs[j].bg_sprite
                if (roombgs[j].layer_id == lay && sprite_exists(spr))
                {
                    var ht = sprite_get_height(spr)
                    var yy = ceil(((room_height - ht) + ((room_height - ht) * 0.15)))
                    if (spr == fg_entrance1)
                        yy += 24
                    yy = (floor((yy / 10)) * 10)
                    roombgs[j].y = yy
                }
            }
        }
        if (string_starts_with(layname, "Backgrounds_Ground") && global.SUGARY)
        {
            roombgs = room_get_bg_layers()
            for (j = 0; j < array_length(roombgs); j++)
            {
                spr = roombgs[j].bg_sprite
                if (roombgs[j].layer_id == lay && sprite_exists(spr))
                {
                    ht = sprite_get_height(spr)
                    yy = ceil((room_height - ht))
                    roombgs[j].y = yy
                }
            }
        }
    }
}
if (room == sucrose_1 || room == sucrose_2)
{
    var _bg = layer_background_get_id_fix("Backgrounds_still1")
    if global.panic
    {
        layer_background_sprite(_bg, bg_sucrose_skyActive)
        layer_background_index(_bg, 0)
        layer_background_speed(_bg, 0.35)
    }
    else
    {
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

    }
}
if layer_exists("Foreground_1")
    layer_depth("Foreground_1", -400)
if layer_exists("Foreground_Ground1")
    layer_depth("Foreground_Ground1", -401)
bg_zigzag1_offset = layer_get_vspeed("Backgrounds_zigzag1")
bg_zigzag2_offset = layer_get_vspeed("Backgrounds_zigzag2")
bg_ZH1_offset = layer_get_vspeed("Backgrounds_stillZH1")
bg_ZH2_offset = layer_get_vspeed("Backgrounds_stillZH2")
layer_vspeed("Backgrounds_zigzag1", 0)
layer_vspeed("Backgrounds_zigzag2", 0)
layer_vspeed("Backgrounds_stillZH1", 0)
layer_vspeed("Backgrounds_stillZH2", 0)
portal_offset = 
{
    x: 0,
    y: 0
}

if global.panic
{
    var lays_chips = []
    var lays_false = []
    if (room == sewer_8 || room == sewer_2 || room == sewer_1 || room == sewer_11 || room == sewer_10 || room == sewer_9)
    {
        if (room != sewer_1)
            lays_chips = ["Backgrounds_scroll"]
        lays_false = ["Backgrounds_scroll2", "Backgrounds_zigzag1"]
    }
    i = 0
    var n = array_length(lays_chips)
    while (i < n)
    {
        layer_set_visible(layer_get_id(lays_chips[i]), 1)
        i++
    }
    i = 0
    n = array_length(lays_false)
    while (i < n)
    {
        layer_set_visible(layer_get_id(lays_false[i]), 0)
        i++
    }
}
if (((!room_is_secret(room)) || instance_exists(obj_wartimer) || global.leveltosave == "sucrose") && (!instance_exists(obj_cyop_loader)))
    scr_panicbg_init()
if (global.sugaryoverride && (room_is_secret(room) || room == secret_entrance))
{
    var target_tiles = -1
    if check_sugarychar()
    {
        if (!global.SUGARY)
            target_tiles = tileset_secret_to_ss
    }
    else if global.SUGARY
        target_tiles = tileset_secret_ss_to_pt
    if (target_tiles != -1)
    {
        layers = layer_get_all()
        i = 0
        while (i < array_length(layers))
        {
            lay = layers[i]
            if (!layer_exists(lay))
            {
                i++
                continue
            }
            else
            {
                tilemap = layer_tilemap_get_id_fix(lay)
                var tileset = tilemap_get_tileset(tilemap)
                if (tileset == tileset_secret_ss && target_tiles == tileset_secret_to_ss)
                    break
                else
                {
                    if (tilemap > -1 && (tileset == tileset_secret || tileset == tileset_secret_ss))
                    {
                        tilemap_tileset(tilemap, target_tiles)
                        if (target_tiles == tileset_secret_to_ss)
                        {
                            for (var xx = 0; xx < tilemap_get_width(tilemap); xx++)
                            {
                                for (yy = 0; yy < tilemap_get_height(tilemap); yy++)
                                {
                                    var tile = (tilemap_get(tilemap, xx, yy) & 524287)
                                    if (tile == 0)
                                    {
                                    }
                                    else
                                    {
                                        if (tile == 36)
                                        {
                                            if (((tilemap_get(tilemap, (xx + 1), yy) & 524287) == 16 || (tilemap_get(tilemap, xx, (yy + 1)) & 524287) == 22) && (tilemap_get(tilemap, (xx + 1), (yy - 1)) & 524287) != 36)
                                                tilemap_set(tilemap, 94, (xx + 1), yy)
                                            if ((tilemap_get(tilemap, xx, (yy + 1)) & 524287) == 16 || (tilemap_get(tilemap, xx, (yy + 1)) & 524287) == 22)
                                                tilemap_set(tilemap, 37, xx, (yy + 1))
                                        }
                                        if (tile == 46)
                                        {
                                            if ((tilemap_get(tilemap, (xx - 1), yy) & 524287) == 16)
                                                tilemap_set(tilemap, 47, (xx - 1), yy)
                                            if ((tilemap_get(tilemap, xx, (yy + 1)) & 524287) == 16)
                                                tilemap_set(tilemap, 47, xx, (yy + 1))
                                        }
                                        if (tile >= 12 && tile <= 14)
                                            tilemap_set(tilemap, (12 + (xx % 3)), xx, yy)
                                        if (tile >= 52 && tile <= 54)
                                            tilemap_set(tilemap, (52 + (xx % 3)), xx, yy)
                                        if (tile == 96)
                                            tilemap_set(tilemap, 99, xx, (yy + 1))
                                        if (tile == 97)
                                            tilemap_set(tilemap, 89, xx, (yy + 1))
                                        if (tile == 77)
                                            tilemap_set(tilemap, 69, xx, (yy + 1))
                                        if (tile == 78)
                                            tilemap_set(tilemap, 79, xx, (yy + 1))
                                        if (tile == 88)
                                        {
                                            if ((tilemap_get(tilemap, (xx - 1), yy) & 524287) > 0)
                                                tilemap_set(tilemap, 98, xx, (yy + 1))
                                        }
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        var background = layer_background_get_id_fix(lay)
                        var sprite = layer_background_get_sprite(background)
                        if (background != -1 && (sprite == bg_secret || sprite == bg_secret_ss))
                        {
                            if (target_tiles == tileset_secret_to_ss)
                                layer_background_sprite(background, bg_secret_ss)
                            if (target_tiles == tileset_secret_ss_to_pt)
                                layer_background_sprite(background, bg_secret)
                        }
                    }
                    i++
                    continue
                }
            }
        }
    }
}
if (!instance_exists(obj_ghostcollectibles))
{
    if (global.leveltosave == "entryway")
    {
        var layerfx = layer_get_fx("Effect_1")
        if (layerfx != -1)
        {
            if (global.panic || room == entryway_11)
                fx_set_parameter(layerfx, "g_TintCol", [0.8470588235294118, 0.7176470588235294, 0.8941176470588236, 1])
            else
                fx_set_parameter(layerfx, "g_TintCol", [1, 0.8666666666666667, 0.8, 1])
        }
    }
    if (global.leveltosave == "steamy" && global.panic)
        layer_destroy("Effect_1")
}
if (room != tower_1)
{
    with (obj_secrettile)
        event_user(0)
}
