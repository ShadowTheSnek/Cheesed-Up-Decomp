if (instance_exists(other.baddieID) && (!other.baddieID.invincible) && other.baddieID.destroyable && playerid.state != states.chainsaw && other.baddieID.state != states.hit && (!other.baddieID.thrown))
{
    with (other)
    {
        sound_play_3d("event:/sfx/pep/punch", x, y)
        sound_play_3d("event:/sfx/mort/mortslap", x, y)
        var lag = 5
        baddieID.hitLag = lag
        baddieID.hitX = baddieID.x
        baddieID.hitY = baddieID.y
        baddieID.mach3destroy = 1
        baddieID.hp -= 1
        gml_Script_instance_create(baddieID.x, baddieID.y, obj_parryeffect)
        baddieID.alarm[3] = 3
        baddieID.state = states.hit
        baddieID.image_xscale = (-other.image_xscale)
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
        baddieID.hitvsp = -4
        baddieID.hithsp = (other.image_xscale * 10)
    }
    Mort_DownMovement()
}
