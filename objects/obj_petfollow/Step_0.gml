var player = obj_player1
visible = ((room == rank_room || room == timesuproom || room == Mainmenu) ? false : player.visible)
if (player.state == states.pizzathrow)
    visible = false
if (state != states.backbreaker)
{
    image_alpha = player.image_alpha
    var idlespr = spr_idle
    var runspr = spr_run
    if global.panic
    {
        if (spr_panic != -1)
            idlespr = spr_panic
        if (spr_panicrun != -1)
            runspr = spr_panicrun
    }
    sprite_index = ((round(xprev) != round(x) || interp < 0.5) ? runspr : idlespr)
    depth = -6
    if (player.state == states.backbreaker && spr_taunt != -1)
    {
        gml_Script_instance_create(x, ((y + yoffset) - 25), obj_tinytaunt)
        sprite_index = spr_taunt
        image_index = irandom((sprite_get_number(spr_taunt) - 1))
        state = states.backbreaker
        lock = 1
    }
}
else
{
    hsp = 0
    vsp = 0
    if (spr_supertaunt != -1 && sprite_index != spr_supertaunt)
    {
        var s = player.sprite_index
        if (s == player.spr_supertaunt1 || s == player.spr_supertaunt2 || s == player.spr_supertaunt3 || s == player.spr_supertaunt4 || s == player.spr_ratmount_supertaunt)
        {
            sprite_index = spr_supertaunt
            image_index = 0
        }
    }
    else
        image_index = ((obj_player1.image_index / obj_player1.image_number) * image_number)
    if (player.state != states.backbreaker)
    {
        instance_destroy(obj_tinytaunt)
        interp = 0
        sprite_index = spr_idle
        lock = 0
        state = states.normal
    }
}
xprev = x
yprev = y
switch pet
{
    case (7 << 0):
        yoffset = Wave(5, 25, 4, 0)
        break
}

