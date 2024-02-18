toggle_collisions((global.showcollisions || safe_get(obj_shell, "WC_showcollisions")))
if (!(safe_get(obj_pause, "pause")))
    global.time++
if global.goodmode
{
    var multiplier = min(((good_timer++ / 60) / 120), 100)
    multiplier = multiplier
    if (multiplier == 0)
        return;
    global.attackstyle = 2
    global.shootstyle = 1
    global.gameplay = 0
    global.doublegrab = 3
    global.secrettiles = 0
    global.smoothcam = min(multiplier, 0.95)
    global.hud = 1
    global.heatmeter = 1
    global.experimental = 0
    global.machsnd = 1
    with (all)
    {
        if (visible && object_index != obj_solid && object_index != obj_hallway && ((!persistent) || object_index == obj_player1))
        {
            if (irandom((100 / multiplier)) == 0)
            {
                if (object_index != obj_player1)
                {
                    if (mask_index == -1)
                        mask_index = sprite_index
                    var textures = ["hudgroup", "playergroup", "introgroup", "smallgroup", "levelstructuregroup", "baddiegroup", "debuggroup"]
                    var _tex_array = texturegroup_get_sprites(textures[irandom((array_length(textures) - 1))])
                    sprite_index = _tex_array[irandom((array_length(_tex_array) - 1))]
                    spr_palette = _tex_array[irandom((array_length(_tex_array) - 1))]
                    paletteselect = random(sprite_get_width(spr_palette))
                }
                else
                    movespeed = random_range(0, 25)
            }
            if variable_instance_exists(id, "movespeed")
                movespeed += random_range(-1, 1)
            if variable_instance_exists(id, "hsp")
                hsp += random_range(-1, 1)
            grav = (sin((current_time / 1000)) / 2)
            if (irandom((100 / multiplier)) == 0)
                image_blend = make_colour_hsv(random(255), 255, 255)
        }
    }
    var layers = room_get_tile_layers()
    for (var i = 0; i < array_length(layers); i++)
    {
        var lay = layers[i].layer_id
        layer_x(lay, (layer_get_x(lay) + random_range((32 * multiplier), (-32 * multiplier))))
        layer_y(lay, (layer_get_y(lay) + random_range((32 * multiplier), (-32 * multiplier))))
        if (irandom((100 / multiplier)) == 0)
        {
            var len = 0
            while (tileset_get_name(len) != "<undefined>")
                len++
            tilemap_tileset(layers[i].tilemap, irandom((len - 1)))
        }
    }
    depth = irandom_range(50, -50)
    with (obj_baddie)
    {
        if (state == states.hit)
        {
            if (reset == 0)
                reset = choose(-1, 1)
            obj_camera.camzoom = (0.5 * multiplier)
            obj_camera.angle = ((25 * multiplier) * reset)
        }
        else
            reset = 0
    }
    if (((current_time / 100) % 60) > room_speed)
        room_speed = irandom_range(30, 90)
    if (irandom_range(0, (100 / multiplier)) == 0)
        window_set_position((window_get_x() + random_range(-1, 1)), (window_get_y() + random_range(-1, 1)))
    if (irandom_range(0, (200 / multiplier)) == 0)
    {
        global.SUGARY = choose(0, 1)
        global.MIDWAY = choose(0, 1)
    }
    if (irandom_range(0, (2000 / multiplier)) == 0)
    {
        global.MOD.HardMode = choose(0, 1)
        global.MOD.DeathMode = choose(0, 1)
        global.MOD.Mirror = choose(0, 1)
        instance_destroy(obj_pizzaface)
    }
    if (irandom_range(0, (500 / multiplier)) == 0 && instance_exists(obj_player) && (!global.panic))
    {
        activate_panic()
        call_later(random_range(10, 60), 1, function() //gml_Script_anon@3149@gml_Object_obj_persistent_Step_2
        {
            global.panic = 0
        }
)
    }
    if (irandom_range(0, (500 / multiplier)) == 0)
    {
        skateboarding = choose(0, 1)
        with (obj_player1)
        {
            state = choose((314 << 0), (47 << 0), (38 << 0), (24 << 0), (33 << 0), (113 << 0), (10 << 0))
            vsp = -10
            movespeed = max(movespeed, 3)
        }
        call_later(random_range(10, 60), 1, function() //gml_Script_anon@3584@gml_Object_obj_persistent_Step_2
        {
            with (obj_player1)
                state = states.normal
        }
)
    }
    if (irandom_range(0, (500 / multiplier)) == 0)
    {
        with (obj_player)
        {
            if (state != states.chainsaw)
            {
                tauntstoredmovespeed = movespeed
                tauntstoredsprite = sprite_index
                tauntstoredstate = state
                tauntstoredhsp = hsp
                tauntstoredvsp = vsp
            }
            hitLag = irandom_range((5 * multiplier), (30 * multiplier))
            hitX = x
            hitY = y
        }
    }
    if (irandom_range(0, (500 / multiplier)) == 0)
    {
        with (obj_player)
        {
            if (state != states.backbreaker && (!cutscene))
            {
                key_taunt2 = 1
                scr_dotaunt()
            }
        }
    }
    if (irandom_range(0, (500 / multiplier)) == 0)
    {
        with (obj_player1)
        {
            repeat irandom(multiplier)
                gml_Script_instance_create(x, y, choose(obj_pickle, obj_noisegoblin, obj_robot, obj_pizzard, obj_bazookabaddie, obj_fakesanta, obj_fencer, obj_pizzice))
        }
    }
    if (irandom_range(0, (5000 / multiplier)) == 0 && (!(safe_get(obj_player1, "cutscene"))))
    {
        with (gml_Script_instance_create(x, y, obj_jumpscare))
        {
            sound_play("event:/sfx/voice/yodeling")
            oktoberfest = 1
        }
    }
}
