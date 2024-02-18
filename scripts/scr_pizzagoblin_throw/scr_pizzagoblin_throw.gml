function scr_pizzagoblin_throw() //gml_Script_scr_pizzagoblin_throw
{
    hsp = 0
    if place_meeting(x, (y + 1), obj_railh)
        hsp = -5
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = 5
    if (floor(image_index) >= (image_number - 1))
    {
        state = states.walk
        sprite_index = walkspr
    }
    if (object_index >= array_length(global.throw_data) || @@Global@@().throw_data[object_index] == 0)
        @@Global@@().throw_data[object_index] = @@Global@@().throw_data[obj_pizzard]
    if (bombreset <= 0 && floor(image_index) == @@Global@@().throw_data[object_index].frame)
    {
        bombreset = @@Global@@().throw_data[object_index].time
        sprite_index = @@Global@@().throw_data[object_index].sprite
        switch object_index
        {
            case obj_rancher:
                sound_play_3d("event:/sfx/enemies/rancherpistol", x, y)
                break
            default:
                sound_play_3d("event:/sfx/enemies/projectile", x, y)
                break
        }

        switch object_index
        {
            case obj_pizzagoblin:
                with (gml_Script_instance_create(x, y, obj_pizzagoblinbomb))
                {
                    baddie = 1
                    trace("pizzagoblinbomb create: ", baddie)
                    defused = 1
                    movespeed = 5
                    image_xscale = other.image_xscale
                    vsp = -10
                    countdown = 80
                }
                break
            case obj_canongoblin:
                repeat (5)
                {
                    with (gml_Script_instance_create((x + (image_xscale * 35)), y, obj_firemouthflame))
                    {
                        image_speed = 0.35
                        sprite_index = spr_cloudeffect
                        depth = (other.depth - 1)
                    }
                }
                with (gml_Script_instance_create(x, y, obj_canongoblinbomb))
                    image_xscale = other.image_xscale
                break
            case obj_noisegoblin:
                with (gml_Script_instance_create(x, y, obj_noisegoblin_arrow))
                {
                }
                break
            case obj_cheeserobot:
                with (gml_Script_instance_create(x, y, obj_cheeseblob))
                {
                    sprite_index = spr_cheeserobot_goop
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 8)
                    vsp = 0
                    grav = 0
                }
                break
            case obj_spitcheese:
                if (spitcheesespr == spr_spitcheese_spit)
                {
                    with (gml_Script_instance_create((x + (image_xscale * 6)), (y - 6), obj_spitcheesespike))
                    {
                        image_xscale = other.image_xscale
                        hsp = (other.image_xscale * 5)
                        vsp = -6
                    }
                }
                else
                {
                    with (gml_Script_instance_create((x + (image_xscale * 6)), (y - 6), obj_cheeseball))
                    {
                        image_xscale = other.image_xscale
                        hsp = (other.image_xscale * 5)
                        vsp = -6
                    }
                }
                break
            case obj_trashOLD:
            case obj_invtrash:
                with (gml_Script_instance_create((x + (image_xscale * 6)), (y - 6), obj_cheeseball))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                    vsp = -4
                }
                break
            case obj_robot:
                with (gml_Script_instance_create((x + (image_xscale * 4)), y, obj_robotknife))
                {
                    grav = 0
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break
            case obj_kentukykenny:
                if ((elite || global.stylethreshold >= 3) && (!important))
                {
                    with (gml_Script_instance_create((x + (other.image_xscale * 8)), y, obj_kentukylenny_projectile))
                    {
                        repeat (3)
                            gml_Script_instance_create(x, y, obj_firemouthflame)
                        image_xscale = other.image_xscale
                    }
                }
                else
                {
                    with (gml_Script_instance_create(x, y, obj_kentukykenny_projectile))
                        image_xscale = other.image_xscale
                }
                break
            case obj_kentukylenny:
                with (gml_Script_instance_create((x + (other.image_xscale * 8)), y, obj_kentukylenny_projectile))
                {
                    repeat (3)
                        gml_Script_instance_create(x, y, obj_firemouthflame)
                    image_xscale = other.image_xscale
                }
                break
            case obj_pizzard:
                with (gml_Script_instance_create(x, y, obj_pizzard_bolt))
                {
                    sound_play_3d("event:/sfx/enemies/pizzardelectricity", x, y)
                    image_xscale = other.image_xscale
                }
                break
            case obj_swedishmonkey:
                if (elite || global.stylethreshold >= 3)
                {
                    with (gml_Script_instance_create(x, y, obj_evilbanana))
                    {
                        baddieID = other.id
                        image_xscale = other.image_xscale
                        hsp = ((-other.image_xscale) * 4)
                        vsp = -5
                    }
                }
                else
                {
                    with (gml_Script_instance_create(x, y, obj_slipnslide))
                    {
                        baddieID = other.id
                        image_xscale = other.image_xscale
                        hsp = ((-other.image_xscale) * 4)
                        vsp = -5
                    }
                }
                with (obj_slipnslide)
                {
                    if (baddieID == other.id)
                        banana += 1
                }
                with (obj_evilbanana)
                {
                    if (baddieID == other.id)
                        banana += 1
                }
                break
            case obj_pepgoblin:
                with (gml_Script_instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                }
                break
            case obj_pepbat:
                with (gml_Script_instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                }
                break
            case obj_pickle:
                attacking = 0
                with (gml_Script_instance_create(x, y, obj_forkhitbox))
                {
                    ID = other.id
                    image_xscale = other.image_xscale
                    sprite_index = other.sprite_index
                }
                break
            case obj_tank:
                with (gml_Script_instance_create((x + (image_xscale * 6)), (y - 6), obj_canongoblinbomb))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break
            case obj_thug_blue:
            case obj_thug_red:
                with (gml_Script_instance_create((x + (8 * image_xscale)), y, obj_robotknife))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break
            case obj_rancher:
                with (gml_Script_instance_create((x + (image_xscale * 6)), (y + 26), obj_rancher_bullet))
                    image_xscale = other.image_xscale
                break
            case obj_smokingpizzaslice:
                substate = choose((134 << 0), (126 << 0), (126 << 0))
                substate_buffer = substate_max
                sound_play_3d("event:/sfx/enemies/coughing", x, y)
                with (gml_Script_instance_create((x + (50 * image_xscale)), (y + 20), obj_smokingprojectile))
                    image_xscale = other.image_xscale
                break
            case obj_thug_green:
                with (gml_Script_instance_create((x + (8 * image_xscale)), y, obj_junkenemy))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 7)
                    vsp = -8
                }
                break
            case obj_miniufo:
                gml_Script_instance_create(x, y, obj_warplaser)
                break
            case obj_miniufo_grounded:
                with (gml_Script_instance_create((x + (8 * image_xscale)), y, obj_ufobullet))
                {
                    sound_play_3d("event:/sfx/enemies/ufolivelaser", x, y)
                    image_xscale = other.image_xscale
                }
                break
            case obj_kentukybomber:
                gml_Script_instance_create(x, (y + 70), obj_kentukybomb)
                break
            case obj_bazookabaddie:
                var xx = (x + (72 * image_xscale))
                with (gml_Script_instance_create(xx, y, obj_bazooka))
                {
                    other.bazookaID = id
                    baddieID = other.id
                }
                create_particle(xx, y, (6 << 0))
                break
            case obj_farmerbaddie2:
                var s = 2
                with (gml_Script_instance_create(x, (y + 64), obj_farmerbaddie2_projectile))
                    hsp = 0
                with (gml_Script_instance_create(x, (y + 64), obj_farmerbaddie2_projectile))
                    hsp = (-s)
                with (gml_Script_instance_create(x, (y + 64), obj_farmerbaddie2_projectile))
                    hsp = s
                break
            case obj_farmerbaddie3:
                with (gml_Script_instance_create(x, (y - 64), obj_farmerbaddie3_projectile))
                {
                    hsp = 0
                    vsp = -16
                }
                break
            case obj_crackerkicker:
                with (gml_Script_instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                }
                break
            case obj_eskimo:
                with (gml_Script_instance_create(x, y, obj_eskimoprojectile))
                    image_xscale = other.image_xscale
                break
            case obj_mintsplosion:
                with (gml_Script_instance_create(x, (y + 10), obj_mintsplosion_bomb))
                {
                    image_xscale = other.image_xscale
                    movespeed = 8
                }
                break
            case obj_cottonwitch:
                with (gml_Script_instance_create(x, y, obj_cottonwitchprojectile))
                    image_xscale = other.image_xscale
                break
        }

    }
    if ((!grounded) && hsp < 0)
        hsp += 0.1
    else if ((!grounded) && hsp > 0)
        hsp -= 0.1
}

