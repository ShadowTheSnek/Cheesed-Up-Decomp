if (other.state == states.actor || cooldown || player != -4)
    return;
player = other.id
player_collide_speed = abs(other.hsp)
player_collide_y = other.y
with (other)
{
    state = states.actor
    x = (other.x + (sprite_get_xoffset(other.player_spr) / 2))
    sprite_index = other.player_spr
    hsp = 0
    hsp_carry = 0
    vsp = 0
    vsp_carry = 0
    image_speed = (0.35 + ((other.player_collide_speed / 12) * 0.125))
}
input_cooldown = (other.key_jump || other.key_jump2)
cooldown = 1
