with (other)
{
    if (other.state == states.normal && state != (292 << 0) && key_up && grounded && ((state == states.ratmount && brick) || state == states.normal || state == states.mach1 || state == states.mach3 || state == states.pogo || state == states.mach3 || state == states.Sjumpprep))
    {
        create_particle(x, y, (9 << 0))
        other.state = states.hit
        other.hitLag = 80
        other.hitX = other.x
        other.hitY = other.y
        instance_destroy(other.arrowID)
        fmod_event_instance_play(global.snd_spaceship)
        with (obj_player)
        {
            if check_player_coop()
            {
                hsp = 0
                movespeed = 0
                vsp = 0
                state = (292 << 0)
                visible = false
                sprite_index = spr_idle
            }
        }
    }
}
