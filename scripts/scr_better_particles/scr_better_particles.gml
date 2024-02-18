function create_baddiegibs(argument0, argument1) //gml_Script_create_baddiegibs
{
    if (object_index == obj_junkNEW)
        return;
    var sprite = (global.SUGARY ? spr_baddiegibs_ss : spr_baddiegibs)
    var q = 
    {
        x: argument0,
        y: argument1,
        sprite_index: sprite,
        image_number: sprite_get_number(sprite),
        image_index: irandom(image_number),
        image_angle: random_range(1, 270),
        image_speed: 0,
        sprw: sprite_get_width(sprite),
        sprh: sprite_get_height(sprite),
        hsp: random_range(-10, 10),
        vsp: random_range(-10, 10),
        alpha: 1,
        grav: 0.4,
        type: (0 << 0),
        animated: 0,
        destroyonanimation: 0
    }

    ds_list_add(global.debris_list, q)
    return q;
}

function create_slapstar(argument0, argument1) //gml_Script_create_slapstar
{
    q = 
    {
        x: argument0,
        y: argument1,
        sprite_index: spr_slapstar,
        image_number: sprite_get_number(spr_slapstar),
        image_index: irandom(image_number),
        image_angle: random_range(0, 360),
        image_speed: 0,
        sprw: sprite_get_width(spr_slapstar),
        sprh: sprite_get_height(spr_slapstar),
        hsp: random_range(-5, 5),
        vsp: random_range(-2, -10),
        alpha: 1,
        grav: 0.5,
        type: (0 << 0),
        animated: 0,
        destroyonanimation: 0
    }

    ds_list_add(global.debris_list, q)
    return q;
}

