if (other.state == states.knightpep && other.sprite_index != other.spr_knightpepstart && other.sprite_index != other.spr_knightpepthunder)
{
    sound_play_3d("event:/sfx/pep/punch", x, y)
    state = states.stun
    stunned = 1000
    lastattack = (0 << 0)
    throwsword = 0
    other.state = states.normal
    other.jumpstop = 1
    other.vsp = -11
    instance_destroy(obj_swordstone)
}
