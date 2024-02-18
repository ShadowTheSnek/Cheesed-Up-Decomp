if (other.state == states.knightpep && state == (238 << 0) && vsp > 0)
{
    hp--
    other.state = states.normal
    other.jumpstop = 1
    other.vsp = -11
    state = states.normal
}
