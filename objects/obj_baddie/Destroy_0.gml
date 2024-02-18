var hydra = (global.MOD.DoubleTrouble == 2 && instance_number(obj_baddie) < 64 && object_index != obj_twoliterdog)
if (room == rm_editor)
    return;
if ((!in_baddieroom()) && ((!elite) || elitehit <= 0) && destroyable)
{
    if (object_index != obj_peppinoclone && object_index != obj_ghoul && object_index != obj_bazookabaddie && object_index != obj_snowman && object_index != obj_twoliterdog && object_index != obj_bigcherry && object_index != obj_froth && (!hydra))
    {
        with (gml_Script_instance_create(x, y, obj_sausageman_dead))
        {
            sprite_index = other.spr_dead
            spr_palette = other.spr_palette
            paletteselect = other.paletteselect
            usepalette = other.usepalette
            if (!usepalette)
                paletteselect = 0
            image_alpha = other.image_alpha
            if variable_instance_exists(other, "sugary")
                sugary = other.sugary
            if (other.object_index == obj_ghostknight)
                image_alpha = 0.3
            image_blend = other.image_blend
        }
    }
    else if (object_index == obj_peppinoclone)
    {
        with (gml_Script_instance_create(x, y, obj_explosioneffect))
        {
            image_speed = 0.35
            depth = other.depth
            sprite_index = spr_pepclone_death
            image_xscale = other.image_xscale
        }
    }
    else if (object_index == obj_ghoul)
    {
        var i = 0
        repeat sprite_get_number(spr_ghoul_gibs)
        {
            with (create_debris(x, y, spr_ghoul_gibs))
            {
                image_index = i
                vsp = (-(irandom_range(10, 14)))
            }
            i++
        }
    }
    if (object_index == obj_sausageman && (whoopass || global.stylethreshold >= 3))
    {
        with (gml_Script_instance_create(x, y, obj_whoop))
        {
            create_particle(x, y, (9 << 0))
            vsp = -11
        }
    }
    if (object_index == obj_tank)
    {
        repeat (3)
        {
            with (gml_Script_instance_create(x, y, obj_sausageman_dead))
                sprite_index = other.spr_content_dead
        }
    }
    if (object_index == obj_bazookabaddie)
    {
        with (gml_Script_instance_create(x, y, obj_sausageman_dead))
            sprite_index = spr_tank_dead
        repeat (4)
        {
            with (gml_Script_instance_create(x, y, obj_sausageman_dead))
                sprite_index = spr_tank_wheel
        }
    }
    if (object_index == obj_miniufo)
    {
        if (global.stylethreshold >= 3)
        {
            with (gml_Script_instance_create(x, y, obj_miniufo_grounded))
                important = 1
        }
        else
            gml_Script_instance_create(x, y, obj_playerexplosion)
    }
    if (object_index == obj_twoliterdog)
    {
        var p = instance_nearest(x, y, obj_player)
        if (p && x != p.x)
            image_xscale = sign((x - p.x))
        with (gml_Script_instance_create(x, y, obj_twoliterball))
        {
            if other.explodeInstant
                instance_destroy()
            image_xscale = other.image_xscale
        }
    }
    if (object_index == obj_cheeseslime && snotty)
    {
        ini_open_from_string(obj_savesystem.ini_str)
        ini_write_real("Game", "snotty", 1)
        obj_savesystem.ini_str = ini_close()
        gamesave_async_save()
    }
    notification_push((2 << 0), [room, id, object_index])
}
if ((!in_baddieroom()) && important == 0)
{
    if (global.prank_cankillenemy && (!global.prank_enemykilled))
    {
        global.prank_enemykilled = 1
        trace("P Rank started!")
    }
    if (!instance_exists(obj_bosscontroller))
    {
        if ((!elite) || elitehit <= 0)
        {
            with (obj_player1)
                supercharge += 1
        }
        if ((!elite) || elitehit <= 0)
        {
            global.combo += 1
            global.enemykilled += 1
            global.combotime = 60
        }
        if instance_exists(obj_hardmode)
            global.heatmeter_count++
        if (((!elite) || elitehit <= 0) && (!global.snickchallenge))
        {
            var combototal = (10 + floor((global.combo * 0.5)))
            global.collect += combototal
            global.comboscore += combototal
        }
    }
    sound_play_3d("event:/sfx/enemies/kill", x, y)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    if (!hydra)
    {
        repeat (3)
        {
            with (create_debris(x, y, spr_slapstar))
            {
                hsp = random_range(-5, 5)
                vsp = random_range(-10, 10)
            }
        }
        gml_Script_instance_create(x, y, obj_bangeffect)
        if (global.MOD.DoubleTrouble != 2)
            add_baddieroom()
        if (escape && (!(in_saveroom(ID, global.escaperoom))))
            ds_list_add(global.escaperoom, ID)
        if (0.05 > random(1) && safe_get(id, "sugary"))
            sound_play_3d("event:/modded/sfx/sugaryenemykill", x, y)
    }
    if (global.leveltosave == "sucrose" && (!instance_exists(obj_pizzaface)) && global.fill != 0)
        global.fill += calculate_panic_timer(0, 2.5)
}
else if ((!in_baddieroom()) && important == 1)
{
    sound_play_3d("event:/sfx/enemies/kill", x, y)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    if (!hydra)
    {
        repeat (3)
        {
            create_slapstar(x, y)
            create_baddiegibs(x, y)
        }
        if ((!global.MOD.DoubleTrouble) == 2)
            add_baddieroom()
    }
}
if (object_index != obj_pizzaball)
    fail_modifier(global.MOD.Pacifist)
if (hydra && (!in_baddieroom()))
{
    var vars = variable_instance_get_names(id)
    mach3destroy = 0
    hp = 1
    thrown = 0
    linethrown = 0
    boundbox = 0
    killbyenemybuffer = 30
    hsp /= 3
    if (hsp == 0)
        hsp = 3
    else if (abs(hsp) < 3)
        hsp = (3 * sign(hsp))
    if scr_solid(x, y)
    {
        x = obj_player1.x
        y = obj_player1.y
    }
    with (gml_Script_instance_create(x, y, object_index))
    {
        i = 0
        var n = array_length(vars)
        while (i < n)
        {
            variable_instance_set(id, vars[i], variable_instance_get(other.id, vars[i]))
            i++
        }
        sprite_index = other.sprite_index
        alarm[11] = 15
    }
    if bbox_in_camera()
    {
        with (gml_Script_instance_create(x, y, object_index))
        {
            i = 0
            n = array_length(vars)
            while (i < n)
            {
                variable_instance_set(id, vars[i], variable_instance_get(other.id, vars[i]))
                i++
            }
            hsp *= -1
            vsp += random_range(1, -2)
            sprite_index = other.sprite_index
            alarm[11] = 15
        }
    }
}
