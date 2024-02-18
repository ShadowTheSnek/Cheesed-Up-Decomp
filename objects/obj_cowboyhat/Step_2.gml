if ((!instance_exists(playerid)) || playerid.hat < 0)
{
    instance_destroy()
    return;
}
var yo = 0
var xscale = playerid.xscale
switch playerid.hat
{
    case (0 << 0):
        sprite_index = spr_cowboyhat
        break
    case (1 << 0):
        sprite_index = spr_duncehat
        xscale = 1
        break
    case (2 << 0):
        sprite_index = spr_dragonhat
        yo = 25
        break
    case (3 << 0):
        sprite_index = spr_towerhat
        break
    case (4 << 0):
        sprite_index = spr_crownhat
        break
    case (5 << 0):
        sprite_index = spr_catearshat
        yo = 25
        break
    case (6 << 0):
        sprite_index = spr_spookyhat
        yo = -50
        break
}

if (prev != sprite_index)
{
    with (gml_Script_instance_create(x, ((y - 50) + yo), obj_genericpoofeffect))
        depth = (other.depth - 1)
    prev = sprite_index
}
var drawspr = player_sprite(playerid)
var btop = sprite_get_bbox_top(drawspr)
var height = sprite_get_height(drawspr)
var yplus = lengthdir_y(((-sprite_get_bbox_top(drawspr)) + 40), (playerid.angle + 90))
if (btop == 0)
    btop = (height - sprite_get_yoffset(drawspr))
xoffset = 0
yoffset = lerp(yoffset, ((yo + yplus) + (40 - sprite_get_yoffset(drawspr))), (drawspr == playerid.spr_taunt ? 1 : 0.75))
if (smooth_buffer > 0)
    smooth_buffer--
x = lerp(x, ((playerid.x + xoffset) + playerid.smoothx), (smooth_buffer > 0 ? 1 : Wave(0.4, 0.8, 2, 0)))
y = lerp(y, (playerid.y + (yoffset / 2)), (smooth_buffer > 0 ? 1 : 0.25))
image_xscale = (xscale * playerid.scale_xs)
image_yscale = (playerid.yscale * playerid.scale_ys)
if (instance_exists(obj_rank) || instance_exists(obj_timesup) || room == Mainmenu || (instance_exists(obj_lapportal) && obj_lapportal.sprite_index == obj_lapportal.spr_enter) || (instance_exists(obj_lapportal) && obj_lapportal.sprite_index == obj_lapportal.spr_enter) || (instance_exists(obj_lapportalentrance) && obj_lapportalentrance.sprite_index == obj_lapportalentrance.spr_spit))
    visible = false
else
    visible = playerid.visible
