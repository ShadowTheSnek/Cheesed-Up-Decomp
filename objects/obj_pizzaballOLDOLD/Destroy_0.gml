if ((!in_baddieroom()) && important == 0)
{
    if (global.golfhit < 10)
    {
        repeat (10)
        {
            with (gml_Script_instance_create(x, y, obj_pizzaslice))
                vsp = random_range(-1, -10)
        }
        global.golfhit = 0
    }
    else if (global.golfhit < 20)
    {
        repeat (5)
        {
            with (gml_Script_instance_create(x, y, obj_pizzaslice))
                vsp = random_range(-1, -10)
        }
        global.golfhit = 0
    }
    else if (global.golfhit < 30)
    {
        repeat (1)
        {
            with (gml_Script_instance_create(x, y, obj_pizzaslice))
                vsp = random_range(-1, -10)
        }
        global.golfhit = 0
    }
    else
        global.golfhit = 0
    add_baddieroom()
    obj_tv.image_index = random_range(0, 4)
    create_slapstar(x, y)
    create_slapstar(x, y)
    create_slapstar(x, y)
    create_baddiegibs(x, y)
    create_baddiegibs(x, y)
    create_baddiegibs(x, y)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    gml_Script_instance_create(x, (y + 30), obj_bangeffect)
    with (obj_camera)
    {
        shake_mag = 5
        shake_mag_acc = (20 / room_speed)
    }
    hsp = 0
    vsp = 0
}
