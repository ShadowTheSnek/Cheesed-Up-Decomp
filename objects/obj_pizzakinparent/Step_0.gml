visible = ((room == rank_room || room == timesuproom) ? false : playerid.visible)
if (obj_player.state == states.pizzathrow)
    visible = false
playerid = (obj_player1.spotlight ? obj_player1 : obj_player2)
if (state != states.backbreaker)
{
    if (object_index != obj_pizzakinpineapple || (sprite_index != spr_monsterpineapple_smile && sprite_index != spr_monsterpineapple_pose1 && sprite_index != spr_monsterpineapple_pose2 && sprite_index != spr_monsterpineapple_pose3))
    {
        if (sprite_index == spr_intro && floor(image_index) == (image_number - 1))
            sprite_index = spr_idle
        if (sprite_index != spr_intro)
        {
            image_alpha = playerid.image_alpha
            sprite_index = (xprev != x ? spr_run : spr_idle)
            depth = -6
        }
        if ((global.panic || global.snickchallenge) && ((!instance_exists(obj_ghostcollectibles)) || global.leveltosave == "sucrose" || global.leveltosave == "secretworld"))
        {
            if (sprite_index == spr_idle && spr_panic != -4)
                sprite_index = spr_panic
            if (sprite_index == spr_run && spr_panicrun != -4)
                sprite_index = spr_panicrun
        }
    }
    else if (object_index == obj_pizzakinpineapple)
    {
        if (image_index > (image_number - 1))
        {
            image_index = 0
            sprite_index = spr_toppinpineapple
        }
    }
    if (obj_player1.state == states.backbreaker)
    {
        gml_Script_instance_create(x, y, obj_tinytaunt)
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
    if (spr_supertaunt == -4)
        spr_supertaunt = spr_intro
    if (sprite_index != spr_supertaunt)
    {
        var s = obj_player1.sprite_index
        if (s == obj_player1.spr_supertaunt1 || s == obj_player1.spr_supertaunt2 || s == obj_player1.spr_supertaunt3 || s == obj_player1.spr_supertaunt4 || s == obj_player1.spr_ratmount_supertaunt)
        {
            sprite_index = spr_supertaunt
            image_index = 0
        }
    }
    if (obj_player1.state != states.backbreaker || (sprite_index == spr_supertaunt && floor(image_index) == (image_number - 1)))
    {
        instance_destroy(obj_tinytaunt)
        interp = 0
        sprite_index = spr_idle
        lock = 0
        state = states.normal
    }
}
