if (state == states.freefall || (state == states.mach2 && attackspeed >= 18) || state == states.Sjump || (state == states.throwing && attackspeed > 0))
{
    if other.flash
        flash = 0
    scr_hurtplayer(other)
}
