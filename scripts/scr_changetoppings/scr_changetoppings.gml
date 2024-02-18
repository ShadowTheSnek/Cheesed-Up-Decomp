function scr_changetoppings() //gml_Script_scr_changetoppings
{
    with (obj_collect)
    {
        var spr = scr_collectspr(undefined, undefined, 0)
        if (spr != sprite_index)
        {
            sprite_index = spr
            create_particle((x + (sprite_width / 2)), (y + (sprite_height / 2)), (1 << 0))
        }
    }
}

