function textures_offload(argument0) //gml_Script_textures_offload
{
    var b = gml_Script_instance_create(0, 0, obj_loadingscreen)
    with (b)
    {
        group_arr = argument0
        if (global.offload_tex != -4)
        {
            offload_arr = array_create(0)
            array_copy(offload_arr, 0, global.offload_tex, 0, array_length(global.offload_tex))
            global.offload_tex = -4
        }
    }
    return b;
}

function scr_playerreset(argument0, argument1) //gml_Script_scr_playerreset
{
    if (argument0 == undefined)
        argument0 = 0
    if (argument1 == undefined)
        argument1 = 0
    trace("playerreset")
    if ((!argument0) && (!argument1))
    {
        reset_modifier()
        global.snickchallenge = 0
        global.snickrematch = 0
    }
    if global.snickchallenge
    {
        global.snickchallenge = 0
        activate_snickchallenge()
    }
    with (obj_deathmode)
        active = 0
    global.modifier_failed = 0
    global.lap4time = 1
    if (is_struct(global.checkpoint_data) && global.checkpoint_data.loaded != 2)
        clear_checkpoint()
    global.lap = 0
    if (room != boss_pizzaface && room != boss_noise && room != boss_pepperman && room != boss_fakepep && room != boss_vigilante)
        global.bossintro = 0
    global.bossplayerhurt = 0
    global.playerhit = 0
    global.laps = 0
    global.secretfound = 0
    global.combo = 0
    global.highest_combo = 0
    global.player_damage = 0
    global.peppino_damage = 0
    global.gustavo_damage = 0
    global.comboscore = 0
    global.enemykilled = 0
    global.tauntcount = 0
    global.prank_enemykilled = 0
    global.prank_cankillenemy = 1
    global.level_minutes = 0
    global.level_seconds = 0
    global.pistol = 0
    obj_parallax.sucrose_state = 0
    with (obj_screensizer)
        camzoom = 1
    with (obj_camera)
    {
        lock = 0
        state = states.normal
        lag = -1
        lagpos = 0
    }
    with (obj_roomname)
        ds_list_clear(seen_rooms)
    with (obj_achievementtracker)
    {
        achievement_reset_variables(achievements_notify)
        achievement_reset_variables(achievements_update)
    }
    if (!argument0)
    {
        with (obj_music)
        {
            panicstart = 0
            secretend = 1
            secret = 0
        }
        stop_music()
    }
    fmod_set_parameter("musicmuffle", 0, 1)
    fmod_set_parameter("pillarfade", 0, 1)
    camera_set_view_size(view_camera[0], obj_screensizer.actual_width, obj_screensizer.actual_height)
    instance_destroy(obj_frontcanongoblin)
    instance_destroy(obj_pumpkineffect)
    instance_destroy(obj_pumpkincounter)
    instance_destroy(obj_transfotip)
    instance_destroy(obj_flushcount)
    if (!argument0)
        instance_destroy(obj_fadeout)
    instance_destroy(obj_comboend)
    instance_destroy(obj_combotitle)
    instance_destroy(obj_confettieffect)
    instance_destroy(obj_pizzaball_rank)
    instance_destroy(obj_pizzaball_golfhit)
    instance_destroy(obj_combotitle)
    instance_destroy(obj_comboend)
    instance_destroy(obj_sandparticle)
    instance_destroy(obj_lap2visual)
    instance_destroy(obj_keyfollow)
    instance_destroy(obj_hpeffect)
    instance_destroy(obj_crosspriest_cross)
    instance_destroy(obj_hardmode_ghost)
    instance_destroy(obj_gravecorpse, false)
    with (obj_camera)
    {
        alarm[4] = -1
        comboend = 0
        previousrank = 0
    }
    if (!global.levelreset)
    {
        instance_destroy(obj_randomsecret)
        instance_destroy(obj_deliverytimer)
        instance_destroy(obj_wartimer)
        with (obj_cutscene_handler)
            instance_destroy()
        with (obj_snowparticle)
            instance_destroy()
        with (obj_camera)
            alarm[4] = -1
        with (obj_tv)
        {
            event_perform(ev_alarm, 0)
            shownrankp = 0
            shownranks = 0
            shownranka = 0
            shownrankb = 0
            shownrankc = 0
            ds_list_clear(tvprompts_list)
            prompt = ""
            bubblespr = -4
            promptx = promptxstart
            tv_bg_index = 0
            expressionsprite = -4
            sprite_index = spr_tv_off
            tvsprite = spr_tv_idle
            targetspr_old = -1
            state = states.normal
            tv_set_idle()
        }
        with (obj_secretmanager)
        {
            ds_list_clear(secrettriggers)
            ds_list_clear(touchall)
            touchrequirement = -4
            init = 0
        }
        ds_list_clear(global.baddieroom)
        ds_list_clear(global.saveroom)
        ds_list_clear(global.escaperoom)
        global.combodropped = 0
        global.timeractive = 0
        global.wave = 0
        global.maxwave = 0
        global.secretfound = 0
        global.hurtcounter = 0
        global.timeattack = 0
        global.giantkey = 0
        global.pizzadelivery = 0
        global.failcutscene = 0
        global.pizzasdelivered = 0
        global.spaceblockswitch = 1
        global.fill = 500
        global.chunk = 5
        global.hasfarmer = array_create(3, 0)
        global.checkpoint_room = -4
        global.checkpoint_door = "A"
        global.noisejetpack = 0
        global.hp = 0
        global.kungfu = 0
        global.graffiticount = 0
        global.gerome = 0
        global.stylelock = 0
        global.ammorefill = 0
        global.ammoalt = 1
        global.mort = 0
        global.style = 0
        global.spaceblockswitch = 1
        global.stylethreshold = 0
        global.baddiespeed = 1
        global.bullet = 3
        global.fuel = 3
        global.horse = 0
        global.golfhit = 0
        global.railspeed = global.maxrailspeed
        global.temperature = 0
        if (room != freezer_1)
            global.use_temperature = 0
        global.heatmeter_count = 0
        global.monsterspeed = 0
        global.timedgate = 0
        global.timedgatetimer = 0
        global.timedgateid = -4
        global.timedgatetime = 0
        global.taseconds = 0
        global.taminutes = 0
        global.key_inv = 0
        global.pepanimatronic = 0
        global.shroomfollow = 0
        global.cheesefollow = 0
        global.tomatofollow = 0
        global.sausagefollow = 0
        global.pineapplefollow = 0
        global.keyget = 0
        global.collect = 0
        global.collectN = 0
        global.hats = 0
        global.extrahats = 0
        global.ammo = 0
        global.treasure = 0
        global.combo = 0
        global.combotime = 0
        global.heattime = 0
        global.pizzacoin = 0
        global.toppintotal = 1
        global.hit = 0
        global.playerhealth = 100
        global.panic = 0
        with (obj_stylebar)
            sprite = spr_mild
        with (obj_music)
            arena = 0
        if instance_exists(obj_endlevelfade)
            instance_destroy(obj_endlevelfade)
        if instance_exists(obj_monstertrackingrooms)
            instance_destroy(obj_monstertrackingrooms)
        instance_destroy(obj_trapghost)
        instance_destroy(obj_comboend)
        instance_destroy(obj_farmer1follow)
        instance_destroy(obj_farmer2follow)
        instance_destroy(obj_farmer3follow)
        if instance_exists(obj_snickexe)
            instance_destroy(obj_snickexe)
        if instance_exists(obj_snickexf)
            instance_destroy(obj_snickexf)
        if instance_exists(obj_snickexg)
            instance_destroy(obj_snickexg)
        if instance_exists(obj_snickexh)
            instance_destroy(obj_snickexh)
        with (obj_pizzaface)
            destroy_sounds([snd])
        instance_destroy(obj_pizzaface, false)
        instance_destroy(obj_pizzashield)
        instance_destroy(obj_pepanimatronicfollow)
        if instance_exists(obj_coopflag)
            instance_destroy(obj_coopflag)
        if instance_exists(obj_cooppointer)
            instance_destroy(obj_cooppointer)
        instance_destroy(obj_coopplayerfollow)
        if instance_exists(obj_toppinwarrior)
            instance_destroy(obj_toppinwarrior)
        if instance_exists(obj_timesup)
            instance_destroy(obj_timesup)
    }
    with (obj_player)
    {
        transformationsnd = 0
        self.player_destroy_sounds()
        self.player_init_sounds()
        image_alpha = 1
        hallway = 0
        verticalhallway = 0
        tauntstoredstate = states.normal
        ratpowerup = -4
        scale_xs = 1
        scale_ys = 1
        holycross = 0
        ghostdash = 0
        ghostpepper = 0
        ghosteffect = 0
        ghostbump = 1
        ghostbumpbuffer = -1
        obj_camera.targetgolf = -4
        if variable_global_exists("baddietomb")
            ds_list_clear(global.baddietomb)
        obj_player.supercharge = 0
        obj_player.supercharged = 0
        pistol = 0
        if instance_exists(obj_gnome_checklist)
        {
            var destroy = 1
            with (obj_player)
            {
                if (state == states.gameover || state == states.timesup)
                    destroy = 0
            }
            if destroy
                instance_destroy(obj_gnome_checklist)
        }
        obj_timeattack.stop = 0
        spotlight = 1
        global.SAGEshotgunsnicknumber = 0
        obj_music.fadeoff = 0
        audio_stop_all()
        global.seconds = 59
        global.minutes = 1
        prevstate = states.comingoutdoor
        state = states.comingoutdoor
        visible = true
        ds_list_clear(global.saveroom)
        ds_list_clear(global.escaperoom)
        ds_list_clear(global.baddieroom)
        flash = 0
        pistolcharge = 0
        pistolchargedelay = 5
        pistolchargeshooting = 0
        pistolchargeshot = 8
        ds_list_clear(hitlist)
        pistolanim = -4
        image_blend = make_colour_hsv(0, 0, 255)
        boxxed = 0
        boxxeddash = 0
        supercharged = 0
        pizzapepper = 0
        pizzashield = 0
        c = 0
        heavy = 0
        image_index = 0
        sprite_index = spr_walkfront
        alarm[0] = -1
        alarm[1] = -1
        alarm[3] = -1
        alarm[4] = -1
        alarm[5] = -1
        alarm[6] = -1
        alarm[7] = -1
        alarm[8] = -1
        alarm[9] = -1
        alarm[10] = -1
        grav = 0.5
        hsp = 0
        vsp = 0
        xscale = 1
        yscale = 1
        parry = 0
        parry_inst = -4
        parry_count = 0
        is_firing = 0
        pogospeed = 6
        pogochargeactive = 0
        pogocharge = 100
        x = backtohubstartx
        y = backtohubstarty
        roomstartx = x
        roomstarty = y
        backupweapon = 0
        shotgunAnim = 0
        box = 0
        steppy = 0
        movespeedmax = 5
        jumpstop = 0
        start_running = 1
        obj_camera.ded = 0
        visible = true
        turn = 0
        jumpAnim = 1
        dashAnim = 1
        landAnim = 0
        machslideAnim = 0
        moveAnim = 1
        stopAnim = 1
        crouchslideAnim = 1
        crouchAnim = 1
        machhitAnim = 0
        stompAnim = 0
        inv_frames = 0
        turning = 0
        hurtbounce = 0
        hurted = 0
        autodash = 0
        mach2 = 0
        input_buffer_jump = 0
        input_buffer_secondjump = 8
        input_buffer_highjump = 8
        flash = 0
        in_water = 0
        key_particles = 0
        barrel = 0
        bounce = 0
        a = 0
        idle = 0
        attacking = 0
        slamming = 0
        superslam = 0
        machpunchAnim = 0
        punch = 0
        machfreefall = 0
        shoot = 0
        instakillmove = 0
        windingAnim = 0
        facestompAnim = 0
        ladderbuffer = 0
        chainsaw = 50
        toomuchalarm1 = 0
        toomuchalarm2 = 0
        dashdust = 0
        throwforce = 0
        hurtsound = 0
        idleanim = 0
        momemtum = 0
        cutscene = 0
        grabbing = 0
        dir = xscale
        goingdownslope = 0
        goingupslope = 0
        fallinganimation = 0
        bombpeptimer = 100
        slapbuffer = 0
        slaphand = 1
        suplexmove = 0
        suplexhavetomash = 0
        timeuntilhpback = 300
        anger = 0
        angry = 0
        skateboarding = 0
        if (character != "G")
        {
            brick = 0
            isgustavo = 0
        }
        else
        {
            brick = 1
            isgustavo = 1
        }
        self.player_destroy_sounds()
        self.player_init_sounds()
        tauntstoredisgustavo = 0
        controllableSjump = 0
        noisebossscream = 0
        scale_xs = 1
        scale_ys = 1
        secretportalID = -4
        smoothx = 0
        oldHallway = 0
        keydoor = 0
        pistol = 0
        jetpackcancel = 0
        suplexmove2 = 0
        breakout = 0
        shaketime = 0
        superjumped = 0
        image_blend_func = -4
        substate = states.normal
        gravityjump = 0
        flip = 1
        ceilingrun = 0
    }
    with (obj_followcharacter)
    {
        if persistent
            instance_destroy()
    }
    instance_destroy(obj_shotgunback)
}

