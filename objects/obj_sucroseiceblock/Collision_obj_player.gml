if (invtime <= 0 && state != states.grabbed)
{
    with (other)
    {
        if (state == states.mach3)
        {
            repeat (3)
                create_slapstar(other.x, other.y)
            gml_Script_instance_create(other.x, other.y, obj_bangeffect)
            gml_Script_instance_create(other.x, other.y, obj_parryeffect)
            machpunchAnim = 1
            other.state = states.thrown
            other.vsp = -11
            other.movespeed = (movespeed + 2)
            other.xscale = xscale
            other.flash = 1
            other.invtime = 10
            sound_play_3d("event:/sfx/pep/punch", x, y)
        }
    }
}
