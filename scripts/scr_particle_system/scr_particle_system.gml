global.part_scale = array_create((16 << 0), [1, 1])
function declare_particle(argument0, argument1, argument2, argument3) //gml_Script_declare_particle
{
    ds_map_set(global.part_map, argument0, part_type_create())
    ds_map_set(global.part_depth, argument0, argument3)
    var p = ds_map_find_value(global.part_map, argument0)
    part_type_sprite(p, argument1, 1, 1, 0)
    var t = sprite_get_number(argument1)
    var s = argument2
    var spd = (t / s)
    part_type_life(p, spd, spd)
    return p;
}

function particle_set_scale(argument0, argument1, argument2) //gml_Script_particle_set_scale
{
    @@Global@@().part_scale[argument0] = [argument1, argument2]
}

function create_debris(argument0, argument1, argument2, argument3) //gml_Script_create_debris
{
    if (argument3 == undefined)
        argument3 = 0
    var q = 
    {
        x: argument0,
        y: argument1,
        sprite_index: argument2,
        image_number: sprite_get_number(argument2),
        image_index: irandom((image_number - 1)),
        image_angle: random_range(1, 270),
        image_speed: 0.35,
        sprw: sprite_get_width(argument2),
        sprh: sprite_get_height(argument2),
        hsp: random_range(-4, 4),
        vsp: random_range(-5, -2),
        alpha: 1,
        grav: 0.4,
        type: (0 << 0),
        animated: argument3,
        destroyonanimation: 0,
        momentum: [0, 0]
    }

    if is_struct(safe_get(id, "momentum"))
        q.momentum = [momentum.x, momentum.y]
    ds_list_add(global.debris_list, q)
    return q;
}

function create_heatpuff(argument0, argument1) //gml_Script_create_heatpuff
{
    q = create_debris(argument0, argument1, spr_heatpuff, 1)
    q.grav = 0
    q.hsp = 0
    q.vsp = irandom_range(-4, -1)
    q.destroyonanimation = 1
    return q;
}

function create_collect(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_create_collect
{
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = -4
    if (argument5 == undefined)
        argument5 = 0
    argument0 -= camera_get_view_x(view_camera[0])
    argument1 -= camera_get_view_y(view_camera[0])
    if (object_index == obj_comboend && global.MOD.Mirror)
        argument0 = (obj_screensizer.actual_width - argument0)
    q = 
    {
        x: argument0,
        y: argument1,
        sprite_index: argument2,
        image_index: 0,
        image_number: sprite_get_number(argument2),
        hsp: 0,
        vsp: 0,
        value: argument3,
        spr_palette: argument4,
        paletteselect: argument5
    }

    ds_list_add(global.collect_list, q)
    return q;
}

function create_particle(argument0, argument1, argument2, argument3) //gml_Script_create_particle
{
    if (argument3 == undefined)
        argument3 = 0
    var part = ds_map_find_value(global.part_map, argument2)
    if (argument3 == undefined)
        argument3 = 0
    var fuck = @@Global@@().part_scale[argument2][1]
    if object_is_ancestor(object_index, obj_player)
    {
        if (flip < 0)
        {
            @@Global@@().part_scale[argument2][1] = yscale
            argument1 = (y - (argument1 - y))
        }
    }
    part_type_scale(part, @@Global@@().part_scale[argument2][0], @@Global@@().part_scale[argument2][1])
    var _depth = ds_map_find_value(global.part_depth, argument2)
    if is_undefined(_depth)
        _depth = object_get_depth(object_index)
    part_system_depth(global.particle_system, _depth)
    part_emitter_region(global.particle_system, global.part_emitter, (argument0 - argument3), (argument0 + argument3), (argument1 - argument3), (argument1 + argument3), 0, 0)
    part_emitter_burst(global.particle_system, global.part_emitter, part, 1)
    @@Global@@().part_scale[argument2][1] = fuck
}

