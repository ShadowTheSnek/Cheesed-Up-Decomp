if (!in_baddieroom())
{
    with (gml_Script_instance_create(x, y, obj_sausageman_dead))
        sprite_index = other.deadspr
    create_slapstar(x, y)
    create_slapstar(x, y)
    create_slapstar(x, y)
    create_baddiegibs(x, y)
    create_baddiegibs(x, y)
    create_baddiegibs(x, y)
    gml_Script_instance_create(x, y, obj_bangeffect)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
}
