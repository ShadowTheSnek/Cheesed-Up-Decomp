if ((!other.cutscene) && sprite_index != spr_bounce && other.state != states.gotoplayer)
{
    other.jumpstop = 1
    with (other)
    {
        suplexmove = 0
        grounded = 0
        if (state == states.machslide)
            state = states.jump
        if (state == states.normal || state == states.freefall)
            state = states.jump
        if (state == states.climbwall)
            state = states.mach2
    }
    if (sprite_index != spr_bounce || image_index > 5)
        sound_play_3d("event:/sfx/misc/mushroombounce", x, y)
    sprite_index = spr_bounce
    if (other.state == states.jump || other.state == states.normal)
    {
        other.sprite_index = other.spr_machfreefall
        other.image_index = 0
    }
    image_index = 0
    other.vsp = (sugary ? -21 : -14)
    other.jumpstop = 1
    if (other.isgustavo && other.state != states.ratmountskid)
    {
        if (other.ratmount_movespeed < 12)
        {
            other.sprite_index = other.spr_ratmount_mushroombounce
            if (!other.brick)
                other.sprite_index = other.spr_lonegustavojumpstart
        }
        else
        {
            other.sprite_index = other.spr_ratmount_dashjump
            if (!other.brick)
                other.sprite_index = other.spr_lonegustavodashjump
        }
        other.jumpAnim = 1
        other.state = states.ratmountjump
        other.image_index = 0
        if (other.state == states.tumble)
            other.movespeed *= other.xscale
    }
}
