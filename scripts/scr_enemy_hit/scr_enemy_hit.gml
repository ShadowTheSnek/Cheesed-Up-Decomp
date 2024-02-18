function scr_enemy_hit() //gml_Script_scr_enemy_hit
{
    x = (hitX + random_range(-6, 6))
    y = (hitY + random_range(-6, 6))
    hitLag--
    sprite_index = stunfallspr
    if (object_index == obj_pepperman || object_index == obj_vigilanteboss || object_index == obj_noiseboss || object_index == obj_pf_fakepep || object_index == obj_fakepepboss || object_index == obj_pizzafaceboss || object_index == obj_pizzafaceboss_p3)
    {
        if (player_instakillmove && pizzahead && object_index != obj_gustavograbbable)
        {
            obj_player1.baddiegrabbedID = id
            scr_boss_grabbed()
            return;
        }
    }
    if (hitLag <= 0)
    {
        x = hitX
        y = hitY
        var _player = obj_player1.id
        var _state = _player.state
        if (_state == (61 << 0))
            _state = _player.tauntstoredstate
        if (_state == (104 << 0) || _state == (5 << 0) || (_state == (105 << 0) && _player.sprite_index != _player.spr_mach3boost && _player.sprite_index != _player.spr_machslideboost3fall) || sprite_index == _player.spr_ratmount_attack || sprite_index == _player.spr_lonegustavodash || hit_connected)
            thrown = 0
        else if (object_index != obj_bigcherry && object_index != obj_twoliterdog)
            thrown = 1
        vsp = hitvsp
        hsp = hithsp
        if (vsp < 0)
            grounded = 0
        global.hit += 1
        if (other.object_index == obj_pizzaball)
            global.golfhit += 1
        if thrown
            global.combotime = 60
        global.heattime = 60
        alarm[1] = 5
        var _hp = 0
        if ((global.attackstyle == 3 || global.attackstyle == 0) && (!global.kungfu))
            _hp = -1
        if shoulderbashed
        {
            _hp = -7
            mach3destroy = 0
        }
        if ((((!elite) && (hp <= _hp || mach3destroy)) || (elite && (elitehit <= 0 || mach3destroy))) && object_get_parent(object_index) != par_boss && object_index != obj_pizzafaceboss && destroyable && (!mach2))
        {
            instance_destroy()
            create_particle(x, y, (9 << 0))
        }
        stunned = 200
        state = states.stun
        if (object_index == obj_pepperman || object_index == obj_vigilanteboss || object_index == obj_noiseboss || object_index == obj_pf_fakepep || object_index == obj_fakepepboss || object_index == obj_pizzafaceboss || object_index == obj_pizzafaceboss_p3)
        {
            if (_player.tauntstoredstate != states.punch && _player.tauntstoredstate != states.freefall && _player.tauntstoredstate != states.superslam)
            {
                linethrown = 1
                var f = 15
                if (_player.tauntstoredstate == states.mach3)
                    f = 25
                if (abs(hithsp) > abs(hitvsp))
                {
                    if (abs(hithsp) < f)
                        hithsp = (sign(hithsp) * f)
                }
                else if (abs(hitvsp) < f)
                    hitvsp = (sign(hitvsp) * f)
            }
            else if (!pizzahead)
            {
                hithsp = (22 * (-image_xscale))
                hitvsp = -7
                hsp = hithsp
                vsp = hitvsp
                flash = 0
                state = states.stun
                thrown = 1
                linethrown = 0
            }
            if (_state == (104 << 0) || _state == (5 << 0))
                stunned *= 5
        }
        if mach2
            thrown = 0
        mach2 = 0
    }
}

