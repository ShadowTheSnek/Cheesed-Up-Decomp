function scr_collide_destructibles() //gml_Script_scr_collide_destructibles
{
    with (obj_player)
    {
        if ((state == states.jump && sprite_index == spr_playerN_noisebombspinjump) || (ghostdash && sprite_index != spr_ghostidle) || state == states.slipbanan || state == states.rideweenie || state == states.trickjump || state == states.ratmounttrickjump || state == states.ratmountbounce || (state == states.pogo && pogochargeactive == 1))
        {
            var arr = [[xscale, 0], [(hsp + xscale), 0], [0, (vsp + 1)], [0, (vsp - 1)], [0, 1], [0, -1]]
            var i = 0
            var n = array_length(arr)
            while (i < n)
            {
                var b = arr[i]
                if place_meeting((x + b[0]), (y + b[1]), obj_destructibles)
                {
                    var num = instance_place_list((x + b[0]), (y + b[1]), obj_destructibles, global.instancelist, 0)
                    for (var j = 0; j < num; j++)
                    {
                        var inst = ds_list_find_value(global.instancelist, j)
                        if (inst != noone && inst != self && inst != undefined)
                        {
                            with (inst)
                            {
                                GamepadSetVibration(0, 0.8, 0.8, 0.5)
                                particle_momentum(other)
                                instance_destroy()
                            }
                        }
                    }
                    ds_list_clear(global.instancelist)
                }
                i++
            }
        }
        if (state == states.trashroll || state == states.boxxedpepspin || ratmount_movespeed >= 12 || state == states.ratmountpunch || state == states.ratmounttumble || state == states.punch || state == states.handstandjump || state == states.ratmountattack || state == states.lungeattack || state == states.cheeseball || state == states.bombpepside || state == states.rocket || state == states.shotgundash || state == states.faceplant || state == states.slipnslide || state == states.tacklecharge || sprite_index == spr_barrelroll || sprite_index == spr_player_barrelslipnslide || state == states.chainsawbump || state == states.mach3 || state == states.knightpep || (state == states.boxxedpepjump && boxxeddash) || (state == states.boxxedpep && boxxeddash) || state == states.machroll || state == states.knightpepslopes || state == states.knightpepattack || state == states.tumble || state == (19 << 0) || state == states.shoulderbash || (abs(movespeed) >= 10 && character == "S" && (state == states.normal || state == states.jump)) || sprite_index == spr_cotton_attack || ((state == (304 << 0) || state == (306 << 0)) && movespeed >= 8) || state == (308 << 0))
        {
            with (instance_place((x + hsp), y, obj_destructibles))
            {
                var HP = safe_get(id, "hp")
                particle_hsp(other)
                if (is_undefined(HP) || HP <= 1 || (other.state != states.handstandjump && other.state != states.mach2 && (!check_kungfu_state(other))))
                {
                    GamepadSetVibration(0, 0.8, 0.8, 0.5)
                    instance_destroy()
                }
                else
                {
                    hp--
                    event_user(0)
                    with (other)
                        scr_pummel()
                }
                if (other.state == states.mach2)
                    other.machpunchAnim = 1
            }
        }
        if (state == states.hurt && thrown)
        {
            if place_meeting((x - hsp), y, obj_destructibles)
            {
                with (instance_place((x - hsp), y, obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.8, 0.5)
                    particle_hsp(other)
                    instance_destroy()
                }
            }
        }
        if ((state == states.knightpep || sprite_index == spr_lonegustavogroundpoundstart || state == states.ratmountbounce || sprite_index == spr_lonegustavogroundpound || state == states.jetpackjump || state == states.firemouth || state == states.slipbanan || state == states.superslam || state == (19 << 0) || (state == states.bombpepup && bombup_dir == 1)) && vsp > 0)
        {
            var vy = 1
            if (state == states.ratmountbounce || sprite_index == spr_lonegustavogroundpoundstart || sprite_index == spr_lonegustavogroundpound)
                vy = vsp
            if place_meeting(x, (y + (vy * flip)), obj_destructibles)
            {
                num = instance_place_list(x, (y + (vy * flip)), obj_destructibles, global.instancelist, 0)
                for (i = 0; i < num; i++)
                {
                    with (ds_list_find_value(global.instancelist, i))
                    {
                        GamepadSetVibration(0, 0.8, 0.8, 0.5)
                        particle_vsp(other)
                        instance_destroy()
                    }
                }
                ds_list_clear(global.instancelist)
                if (state == states.firemouth || state == states.jetpackjump)
                {
                    with (instance_place(x, (y + (vy * flip)), obj_tntblock))
                    {
                        GamepadSetVibration(0, 0.8, 0.8, 0.5)
                        instance_destroy()
                    }
                    if (vsp > -11)
                        vsp = -11
                    jumpstop = 0
                }
            }
        }
        if (state == states.firemouth)
        {
            with (instance_place((x + xscale), y, obj_tntblock))
            {
                particle_hsp(other)
                instance_destroy()
                if (other.vsp > -11)
                    other.vsp = -11
                jumpstop = 0
            }
            with (instance_place(x, (y + vsp), obj_tntblock))
            {
                instance_destroy()
                if (other.vsp > -11)
                    other.vsp = -11
                jumpstop = 0
            }
            with (instance_place(x, (y + 1), obj_tntblock))
            {
                instance_destroy()
                if (other.vsp > -11)
                    other.vsp = -11
                jumpstop = 0
            }
            with (instance_place(x, (y - 1), obj_tntblock))
            {
                instance_destroy()
                if (other.vsp > -11)
                    other.vsp = -11
                jumpstop = 0
            }
        }
        num = instance_place_list(x, (y + (1 * flip)), obj_destructibleplatform, global.instancelist, 0)
        for (var k = 0; k < num; k++)
        {
            with (ds_list_find_value(global.instancelist, k))
            {
                if (!falling)
                    notification_push((33 << 0), [room])
                falling = 1
                if (falling == 1)
                    image_speed = 0.35
            }
        }
        ds_list_clear(global.instancelist)
        if (vsp <= 0.5 && (state == states.jump || state == states.ratmountjump || state == states.mach3 || state == states.mach2 || state == states.antigrav || state == states.pogo || (state == states.bombpepup && bombup_dir == -1) || state == states.punch || state == states.climbwall || state == states.fireass || state == states.Sjump || state == states.cheeseballclimbwall || state == states.mach3 || (state == states.punch && (sprite_index == spr_breakdanceuppercut || sprite_index == spr_breakdanceuppercutend))))
        {
            vy = -1
            if (state == states.punch && (sprite_index == spr_breakdanceuppercut || sprite_index == spr_breakdanceuppercutend))
                vy = vsp
            if place_meeting(x, (y + (vy * flip)), obj_destructibles)
            {
                with (instance_place(x, (y + (vy * flip)), obj_destructibles))
                {
                    GamepadSetVibration(0, 0.6, 0.6, 0.5)
                    particle_vsp(other)
                    instance_destroy()
                    with (other)
                    {
                        if (state != states.Sjump && state != states.punch && state != states.climbwall)
                            vsp = 0
                        if (state == states.Sjump)
                            vsp = -11
                    }
                }
            }
        }
        if (vsp >= 0 && (state == states.freefall || state == states.superslam || state == states.freefallland || state == states.ratmountgroundpound || (state == states.ratmountbounce && vsp >= 0) || (state == states.slipbanan && vsp >= 10) || state == (305 << 0)))
        {
            if place_meeting(x, (y + ((vsp + 2) * flip)), obj_destructibles)
            {
                num = instance_place_list(x, (y + ((vsp + 2) * flip)), obj_destructibles, global.instancelist, 0)
                for (j = 0; j < num; j++)
                {
                    with (ds_list_find_value(global.instancelist, j))
                    {
                        particle_vsp(other)
                        instance_destroy()
                    }
                }
                ds_list_clear(global.instancelist)
            }
        }
        if (state == states.freefall || state == states.superslam || state == states.freefallland || state == states.slipbanan || (state == states.ratmountbounce && vsp > 0))
        {
            vy = 1
            if (state == states.ratmountbounce)
                vy = (vsp + 4)
            if (place_meeting(x, (y + (vy * flip)), obj_metalblock) && (freefallsmash >= 10 || state == states.slipbanan || state == states.ratmountbounce))
            {
                with (instance_place(x, (y + (vy * flip)), obj_metalblock))
                {
                    particle_vsp(other)
                    instance_destroy()
                }
            }
        }
        if (state == states.crouchslide || state == states.machroll || state == states.mach2 || state == states.punch)
        {
            with (instance_place((x + hsp), y, obj_destructibles))
            {
                var _destroyed = 0
                particle_hsp(other)
                with (other)
                {
                    if (place_meeting((x + hsp), y, obj_bigdestructibles) && state != states.crouchslide && state != states.mach2 && state != states.machroll)
                    {
                        instance_destroy(other)
                        _destroyed = 1
                    }
                    else if (other.object_index != obj_bigdestructibles)
                    {
                        instance_destroy(other)
                        _destroyed = 1
                    }
                    if (_destroyed && state == states.lungeattack)
                        hit_connected = 1
                }
            }
        }
    }
}

