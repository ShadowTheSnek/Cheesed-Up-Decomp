if (room == editor_room)
    return;
var player = (obj_player1.spotlight == 1 ? obj_player1 : obj_player2)
if (!instance_exists(obj_pizzaball))
    targetgolf = -4
if (collect_shake > 0)
    collect_shake *= 0.5
if (healthshaketime > 0)
{
    healthshaketime--
    healthshake = random_range(-2, 2)
}
else
    healthshake = 0
var hp = (obj_player1.character == "V" ? global.playerhealth : global.hp)
if (healthold != hp)
{
    playerhealthup = healthold < hp
    healthshaketime = 30
    healthold = hp
}
if global.coop
{
    var p1 = player
    var p2 = (obj_player1.spotlight == 1 ? obj_player2 : obj_player1)
    p2pdistance = point_distance(p1.x, 0, p2.x, 0)
    p2pdistancex = ((p1.x >= p2.x ? (-p2pdistance) : p2pdistance) / 5)
}
else
    p2pdistancex = 0
visible = true
if (room == strongcold_endscreen || room == Longintro || room == Mainmenu || room == rm_levelselect || room == rank_room || room == timesuproom || room == Realtitlescreen || room == characterselect || room == tower_extra || room == rm_baby || room == tower_baby || room == hub_loadingscreen || (string_copy(room_get_name(room), 1, 5) == "tower" && (!global.panic)) || string_starts_with(room_get_name(room), "PP_room") || room == editor_entrance || room == room_cancelled)
    visible = false
if (!global.option_hud)
    visible = false
if instance_exists(obj_endlevelfade)
    visible = false
if (global.combo > 0)
{
    comboend = 1
    var ct = global.combotime
    if (ct <= 40)
    {
        if (alarm[5] == -1)
        {
            if (ct >= 20)
                alarm[5] = 12
            else
                alarm[5] = 5
        }
    }
    else
        combobubblevisible = 1
}
else if comboend
{
    comboend = 0
    event_perform(ev_alarm, 4)
}
if (floor(image_index) == 10)
    shoving = 0
if (shoving && image_index >= 3 && (!bang))
{
    with (gml_Script_instance_create(x, y, obj_fallingHUDface))
    {
        if ((obj_player1.spotlight == 0 && obj_player1.character == "P") || (obj_player1.spotlight == 1 && obj_player2.character == "P"))
        {
            sprite = spr_pepinoHUDscream
            hsp = random_range(-1, -5)
        }
        else
        {
            sprite = spr_noiseHUD_panic
            hsp = random_range(1, 5)
        }
    }
    bang = 1
}
if (!shoving)
    bang = 0
if (global.seconds <= 0 && global.minutes <= 0 && (!ded))
{
    if (global.miniboss || instance_exists(obj_toppinwarrior))
        alarm[2] = 1
    else
        alarm[3] = 1
    ded = 1
}
if (global.seconds > 59)
{
    global.minutes += 1
    global.seconds -= 59
}
if (((!global.panic) && (!global.snickchallenge)) || global.leveltosave == "grinch")
    alarm[1] = 60
if global.timedgatetimer
{
    if (global.timedgatetime > 0)
        global.timedgatetime--
    else
    {
        global.timedgatetime = 0
        global.timedgatetimer = 0
    }
}
if ((!instance_exists(obj_ghostcollectibles)) && (!global.gameplay))
{
    if ((global.panic == 1 && global.minutes < 1) || player.sprite_index == player.spr_Timesup)
    {
        shake_mag = 2
        shake_mag_acc = (3 / room_speed)
    }
    else if (global.panic == 1 && basement == 0)
    {
        shake_mag = 2
        shake_mag_acc = (3 / room_speed)
    }
}
if (shake_mag > 0)
{
    shake_mag -= shake_mag_acc
    if (shake_mag < 0)
        shake_mag = 0
}
detachedby = -1
detach = 0
follow_golf = 0
var target = followtarget
if (!instance_exists(target))
    target = player
if (instance_exists(target) && (!lock) && player.state != states.timesup && player.state != states.gameover)
{
    var tx = target.x
    var ty = target.y
    if (target.object_index == obj_player1 && (!global.MOD.Spotlight))
    {
        if global.gameplay
            tx += target.smoothx
        if (target.state == states.backtohub)
            ty = target.backtohubstarty
        if (target.state != states.backbreaker && (target.state != states.chainsaw || (!global.gameplay)))
        {
            if (target.cutscene || (target.collision_flags & (1 << 0)) > 0)
            {
                if (player.state == states.actor && room == tower_pizzafacehall)
                    chargecamera = Approach(chargecamera, 150, 8)
                else
                    chargecamera = Approach(chargecamera, 0, 10)
            }
            else if (target.state == states.mach2 || target.state == states.mach3)
            {
                var _targetcharge = (target.xscale * ((target.movespeed / 4) * 50))
                var _tspeed = 0.3
                if (target.xscale != sign(chargecamera) && global.gameplay)
                    _tspeed = 4
                chargecamera = Approach(chargecamera, _targetcharge, _tspeed)
            }
            else if (target.ratmount_movespeed > 2 && target.key_attack && (target.state == states.ratmount || target.state == states.ratmountjump))
            {
                _targetcharge = (target.xscale * ((abs(target.hsp) / 4) * 70))
                _tspeed = 0.3
                if (target.xscale != sign(chargecamera) && global.gameplay)
                    _tspeed = 4
                chargecamera = Approach(chargecamera, _targetcharge, _tspeed)
            }
            else if ((abs(target.hsp) >= 16 || (target.state == states.chainsaw && target.tauntstoredmovespeed >= 16)) && player.state != states.climbwall && player.state != states.Sjump)
            {
                _targetcharge = (target.xscale * ((abs(target.hsp) / 4) * 50))
                _tspeed = 2
                if ((_targetcharge > 0 && chargecamera < 0) || (_targetcharge < 0 && chargecamera > 0))
                    _tspeed = 8
                chargecamera = Approach(chargecamera, _targetcharge, _tspeed)
            }
            else if (target.state == states.machslide)
                chargecamera = Approach(chargecamera, 0, 10)
            else
                chargecamera = Approach(chargecamera, 0, 6)
        }
        if global.gameplay
        {
            chargecamera = clamp(chargecamera, -320, 320)
            if ((player.state == states.crouch || (player.character == "S" && player.state == states.normal)) && player.hsp == 0 && (!crouchcamera_goingback) && player.key_down)
            {
                if (crouchcamera < 1)
                    crouchcamera += 0.02
                else
                    crouchcamera = min((crouchcamera + 3), 150)
            }
            else
            {
                crouchcamera_goingback = 1
                crouchcamera = max((crouchcamera - 5), 0)
                if (crouchcamera <= 0)
                    crouchcamera_goingback = 0
            }
        }
        if global.MOD.GravityJump
            yoffset = Approach(yoffset, ((!target.gravityjump) ? -50 : 0), 2)
        else
            yoffset = Approach(yoffset, (-50 * (target.gravityjump ? -1 : 1)), 3)
    }
    else
    {
        yoffset = -50
        chargecamera = 0
        crouchcamera = 0
    }
    with (obj_screensizer)
        camera_set_view_size(view_camera[0], ((obj_screensizer.actual_width * camzoom) * other.camzoom), ((obj_screensizer.actual_height * camzoom) * other.camzoom))
    var cam_width = camera_get_view_width(view_camera[0])
    var cam_height = camera_get_view_height(view_camera[0])
    if ((!global.coop) || room == characterselect || room == rm_levelselect || room == Realtitlescreen)
    {
        camx_real = (((tx - (cam_width / 2)) + chargecamera) + p2pdistancex)
        camy_real = (((ty - (cam_height / 2)) + (yoffset * camzoom)) + floor(crouchcamera))
        camx = lerp(camx_real, camx, (smooth_buffer * global.smoothcam))
        camy = lerp(camy_real, camy, (smooth_buffer * global.smoothcam))
        if (!(safe_get(obj_shell, "WC_oobcam")))
        {
            camx = clamp(camx, limitcam[0], (limitcam[2] - cam_width))
            camy = clamp(camy, limitcam[1], (limitcam[3] - cam_height))
        }
        camera_zoom(1, 0.035)
    }
    var cam_x = camx
    var cam_y = camy
    if (shake_mag != 0 && global.option_screenshake)
    {
        cam_x += irandom_range((-shake_mag), shake_mag)
        repeat (2)
            cam_y += irandom_range((-shake_mag), shake_mag)
    }
    if (global.gameplay && (global.panic || global.snickchallenge) && ((!instance_exists(obj_ghostcollectibles)) || global.leveltosave == "sucrose" || global.leveltosave == "secretworld") && global.option_screenshake)
    {
        cam_x += random_range(-1, 1)
        repeat (2)
            cam_y += random_range(-1, 1)
    }
    if (!(safe_get(obj_shell, "WC_oobcam")))
    {
        if (cam_width > limitcam[2])
            cam_x += ((cam_width - limitcam[2]) / 2)
        if (cam_height > limitcam[3])
            cam_y += ((cam_height - limitcam[3]) / 2)
    }
    var camx_final = cam_x
    if (lag == 0)
    {
        if (lagpos == undefined)
            lagpos = (camera_get_view_x(view_camera[0]) - cam_x)
        else
        {
            lagpos = Approach(lagpos, 0, 25)
            if (lagpos == 0)
                lag = -1
        }
        camx_final += lagpos
    }
    else if (lag > 0)
    {
        lagpos = undefined
        lag--
        camx_final = camera_get_view_x(view_camera[0])
    }
    lockx = cam_x
    locky = cam_y
    camera_set_view_pos(view_camera[0], round(camx_final), round(cam_y))
}
else if (global.gameplay && room != rank_room && room != timesuproom && room != rm_baby && (!instance_exists(obj_bosscontroller)))
{
    cam_x = lockx
    cam_y = locky
    if (shake_mag != 0 && global.option_screenshake)
    {
        cam_x += irandom_range((-shake_mag), shake_mag)
        repeat (2)
            cam_y += irandom_range((-shake_mag), shake_mag)
    }
    if ((global.panic || global.snickchallenge) && ((!instance_exists(obj_ghostcollectibles)) || global.leveltosave == "sucrose" || global.leveltosave == "secretworld") && global.option_screenshake)
    {
        cam_x += random_range(-1, 1)
        repeat (2)
            cam_y += random_range(-1, 1)
    }
    camera_set_view_pos(view_camera[0], round(cam_x), round(cam_y))
}
smooth_buffer = 1
if (global.panic || global.snickchallenge)
{
    global.wave = (global.maxwave - global.fill)
    if check_sugary()
    {
        if (!lock)
        {
            if (global.leveltosave != "sucrose" && (!instance_exists(obj_ghostcollectibles)))
                panicangle = scr_sin((3.5 * clamp((global.wave / global.maxwave), 0, 1)), (65 - (5 * clamp((global.wave / global.maxwave), 0, 1))))
            else
                panicangle = 0
        }
        if (instance_exists(obj_pizzaface) && (!global.MOD.DeathMode))
            greyscale = Approach(greyscale, 0.45, 0.005)
        else
            greyscale = Approach(greyscale, 0, 0.01)
    }
    else
    {
        panicangle = 0
        greyscale = 0
    }
}
else if (!instance_exists(obj_endlevelfade))
{
    panicangle = 0
    greyscale = 0
}
else
{
    panicangle = Approach(panicangle, 0, 15)
    greyscale = Approach(greyscale, 0, 0.01)
}
camera_set_view_angle(view_camera[0], (angle + panicangle))
