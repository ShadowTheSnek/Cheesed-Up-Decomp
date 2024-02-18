function sh_showcollisions(argument0) //gml_Script_sh_showcollisions
{
    var togglepanic = (!WC_showcollisions)
    if (array_length(argument0) > 1)
    {
        if (argument0[1] == "true" || argument0[1] == "1")
            togglepanic = 1
        else if (argument0[1] == "false" || argument0[1] == "0")
            togglepanic = 0
        else
            return string("Invalid argument: {0}", argument0[1]);
    }
    WC_showinvisible = 0
    WC_showcollisions = togglepanic
    global.showcollisions = togglepanic
    toggle_collisions(togglepanic)
}

function meta_showcollisions() //gml_Script_meta_showcollisions
{
    return 
    {
        description: "toggles viewable collisions",
        var arguments: ["<enable>"],
        suggestions: [["true", "false"]]
    };
}

function toggle_collisions(argument0) //gml_Script_toggle_collisions
{
    var i_love_cock = [obj_solid, obj_slope, obj_platform, obj_secretblock, obj_secretbigblock, obj_secretmetalblock, obj_grindrail, obj_grindrailslope, obj_slope_platform, obj_hallway, obj_verticalhallway, obj_ladder]
    with (all)
    {
        if array_contains(i_love_cock, object_index)
        {
            if (!(variable_instance_exists(id, "visible_previous")))
                visible_previous = visible
            visible = (argument0 || visible_previous)
            depth = 5
        }
    }
}

