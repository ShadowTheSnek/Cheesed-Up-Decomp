function scr_initenemy() //gml_Script_scr_initenemy
{
    init_collision()
    ID = id
    chargesnd = fmod_event_create_instance("event:/sfx/enemies/charge")
    pizzaheadKO = -4
    pizzaheadKO_ID = -4
    pizzaheadKO_buffer = 0
    pizzahead_maxsubhp = 3
    pizzahead_subhp = pizzahead_maxsubhp
    camzoom = 1
    mach2 = 0
    steppy = 0
    santaID = -4
    rattime = 0
    usepalette = 0
    blur_effect = 0
    xscale = 1
    yscale = 1
    stunned = 0
    roaming = 1
    flying = 0
    straightthrow = 0
    stomped = 0
    escapespawnID = -4
    reset = 0
    bombreset = 0
    hp = 1
    maxhp = 1
    grounded = 1
    hit_connected = 0
    flash = 0
    birdcreated = 0
    boundbox = 0
    hitboxcreate = 0
    depth = 0
    stuntouchbuffer = 0
    scaredbuffer = 0
    movespeed = 1
    ragebuffer = 0
    ragehitbox = 0
    ragedash = 0
    ragecooldown = 0
    img_angle = image_angle
    steppy = 20
    invtime = 0
    invincible = 0
    bumpable = 1
    stompable = 1
    killbyenemy = 1
    groundpound = 1
    instantkillable = 1
    stunnable = 1
    parryable = 1
    destroyable = 1
    hittable = 1
    shakestun = 1
    supertauntable = 1
    pepperman_grab = 0
    stagger_buffer = -1
    stagger_max = 45
    stagger_jumpspeed = 4
    stagger_movespeed = 1
    stagger_dir = 1
    hitLag = 25
    hitX = x
    hitY = y
    hitvsp = 0
    hithsp = 0
    dodgebuffer = 0
    arcprojectiletimer = 0
    if (!(variable_instance_exists(id, "escape")))
        escape = 0
    escapestun = 1
    oggrav = 0.5
    arena = 0
    wave = 0
    rage = 0
    instakilled = 0
    killprotection = 0
    mach3destroy = 0
    provoked = 0
    stuntouch_yoffset = 0
    turnmax = 200
    turntimer = 0
    turnstart = 0
    timedgate = 0
    chargeID = -4
    angle = image_angle
    is_controllable = 0
    possess_movespeed = 0
    state = states.walk
    stunned = 0
    alarm[0] = 150
    roaming = 1
    collectdrop = 5
    flying = 0
    straightthrow = 0
    cigar = 0
    cigarcreate = 0
    stomped = 0
    shot = 0
    reset = 0
    flash = 0
    thrown = 0
    hp = 1
    slapped = 0
    grounded = 1
    birdcreated = 0
    boundbox = 0
    spr_dead = spr_slimedead
    important = 0
    heavy = 0
    paletteselect = 0
    spr_palette = palette_cheeseslime
    grabbedby = 0
    stuntouchbuffer = 0
    scaredbuffer = 0
    railmovespeed = 0
    use_collision = 1
    turner = 0
    if (!(variable_instance_exists(id, "elite")))
        elite = 0
    elitehit = 0
    elitegrab = 0
    elitehurt = 1
    ventilator_vsp = -5
    linethrown = 0
    dashcloudid = obj_null
    player_instakillmove = 0
    stompbuffer = 0
    killbyenemybuffer = 0
    shoulderbashed = 0
    stored_id = id
    elitepal = 1
    basepal = 0
    use_elite = 1
    aggrimg = 0
}

