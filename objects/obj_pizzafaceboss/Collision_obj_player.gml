if (state == states.ram && substate == states.ram)
{
    if other.flash
        other.flash = 0
    scr_hurtplayer(other)
}
else if ((other.instakillmove || other.state == states.handstandjump) && state == states.stun && savedthrown == thrown && (!savedthrown) && elitehit == 1)
    scr_boss_do_hurt_phase2(other.id)
