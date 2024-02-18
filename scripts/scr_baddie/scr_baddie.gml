function scr_scareenemy() //gml_Script_scr_scareenemy
{
    var player = instance_nearest(x, y, obj_player)
    if (state != states.grabbed && state != states.stun && state != states.hit && state != (266 << 0) && sprite_index != scaredspr && state != states.idle && state != states.staggered)
    {
        if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 90) && y >= (player.y - 130) && ((player.xscale > 0 && x >= player.x) || (player.xscale < 0 && x <= player.x)))
        {
            if (player.state == states.chainsawbump || player.ratmount_movespeed == 12 || player.state == states.mach3 || (player.character == "S" && abs(player.hsp) >= 16) || player.state == states.rideweenie || player.state == states.rocket || player.state == states.tacklecharge || player.state == states.knightpepslopes || (player.state == states.grab && player.swingdingdash <= 0 && player.sprite_index == player.spr_swingding) || (player.state == (308 << 0) && player.movespeed >= 12))
            {
                if (collision_line(x, y, player.x, player.y, obj_solid, false, true) == -4)
                {
                    state = states.idle
                    sprite_index = scaredspr
                    if (x != player.x)
                        image_xscale = (-(sign((x - player.x))))
                    scaredbuffer = 100
                    if (irandom(100) <= 5)
                        sound_play_3d("event:/sfx/voice/enemyrarescream", x, y)
                    if (vsp < 0)
                        vsp = 0
                    if grounded
                        vsp = -3
                }
            }
        }
    }
}

function scr_enemybird() //gml_Script_scr_enemybird
{
    if (state == states.stun && stunned > 100 && (!birdcreated))
    {
        birdcreated = 1
        with (gml_Script_instance_create(x, y, obj_enemybird))
            ID = other.id
    }
}

function scr_boundbox(argument0) //gml_Script_scr_boundbox
{
    if (argument0 == undefined)
        argument0 = 0
    if ((!boundbox) && alarm[11] <= 0)
    {
        with (gml_Script_instance_create(x, y, obj_baddiecollisionbox))
        {
            sprite_index = other.sprite_index
            mask_index = (argument0 ? other.mask_index : other.sprite_index)
            baddieID = other.id
            other.boundbox = 1
        }
    }
}

function check_heat() //gml_Script_check_heat
{
    return (usepalette && (!((object_index == obj_cheeseslime && snotty))) && object_index != obj_ninja && (object_index != obj_kentukykenny || (!important)));
}

