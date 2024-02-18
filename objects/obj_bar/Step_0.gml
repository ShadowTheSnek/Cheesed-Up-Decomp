if (!player)
{
    if (!(collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, player, 0, 0)))
        cooldown = 0
    return;
}
with (player)
{
    y = other.player_collide_y
    x = (other.x + (sprite_get_xoffset(other.player_spr) / 2))
    hsp = 0
    hsp_carry = 0
    vsp = 0
    vsp_carry = 0
    image_speed = (0.35 + (other.player_collide_speed / 12))
}
if input_cooldown
{
    if (player.key_jump || player.key_jump2)
        return;
    input_cooldown = 0
}
if (!((player.key_jump || player.key_jump2)))
    return;
var player_dir = (player.key_left + player.key_right)
if (player_dir == 0)
    return;
cooldown = 1
with (player)
{
    machhitAnim = 0
    state = states.mach3
    sprite_index = spr_mach
    movespeed = (other.player_collide_speed * (1.25 * abs(player_dir)))
    vsp = -5
    xscale = player_dir
    dir = xscale
    hsp = (xscale * movespeed)
}
trace(string("Player released with: {0}, caught with {1}", player.hsp, player_collide_speed))
player = -4
