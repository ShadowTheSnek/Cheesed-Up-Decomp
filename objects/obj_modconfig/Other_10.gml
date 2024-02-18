var p = simuplayer
p.x += p.hsp
p.y += p.vsp
if (p.vsp < 20)
    p.vsp += 0.5
var groundlevel = 144
if (p.y >= groundlevel)
{
    p.y = groundlevel
    p.vsp = 0
}
var width = 384
p.x = wrap(p.x, 0, width)
with (p)
{
    switch state
    {
        case states.titlescreen:
            image += 0.35
            break
        case (0 << 0):
            image += lerp(0.35, 0.6, (abs(hsp) / 6))
            if (move != 0)
            {
                if (xscale != move)
                    hsp = move
                xscale = move
                hsp = Approach(hsp, (6 * move), 0.5)
            }
            else
                hsp = 0
            if (sprite != spr_player_pistolidle)
            {
                if (y < groundlevel)
                    sprite = spr_player_fall
                else if (hsp == 0)
                    sprite = spr_player_idle
                else
                    sprite = spr_player_move
            }
            break
        case (176 << 0):
            image += 0.35
            if (y >= groundlevel)
                state = states.normal
            break
        case (80 << 0):
            image += 0.35
            if (sprite == spr_player_breakdancestart)
                hsp = Approach(hsp, 0, 0.15)
            else
                hsp = Approach(hsp, (xscale * 12), 0.2)
            if (image > (sprite_get_number(sprite) - 1))
            {
                state = states.normal
                sprite = spr_player_idle
                move = 0
            }
            break
        case (42 << 0):
            image += 0.35
            hsp = Approach(hsp, (xscale * 10.4), 0.5)
            if (image > (sprite_get_number(sprite) - 1))
            {
                state = states.normal
                sprite = spr_player_idle
                move = 0
            }
            break
        case (72 << 0):
            image += 0.35
            if (image > (sprite_get_number(sprite) - 1))
            {
                state = states.normal
                sprite = spr_player_pistolidle
            }
            break
        case (124 << 0):
            image += 0.5
            if (image > (sprite_get_number(sprite) - 1))
            {
                state = states.normal
                sprite = spr_player_idle
                move = 0
            }
            break
        case (41 << 0):
            image += 0.4
            if (image > (sprite_get_number(sprite) - 1))
            {
                state = states.normal
                sprite = spr_player_idle
                move = 0
                hsp = 0
                if (other.bullets == 0)
                    changed = 1
            }
            break
        case (146 << 0):
            break
    }

}
