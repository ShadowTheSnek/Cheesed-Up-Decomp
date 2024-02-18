function sh_grid(argument0) //gml_Script_sh_grid
{
    if (array_length(argument0) > 1)
    {
        var xx = argument0[1]
        var yy = xx
        if (array_length(argument0) > 2)
            yy = argument0[2]
        if string_is_number(xx)
            xx = real(xx)
        else
            return "X parameter must be a number";
        if string_is_number(yy)
            yy = real(yy)
        else
            return "Y parameter must be a number";
        WC_drag_grid = [xx, yy]
        return string("Set dragging grid to {0}x{1}", xx, yy);
    }
    else
    {
        WC_drag_grid = [1, 1]
        return "Set dragging grid to 1x1";
    }
}

function meta_grid() //gml_Script_meta_grid
{
    return 
    {
        description: "set the object dragging and creating grid. leave arguments empty to disable grid",
        var arguments: ["<x>", "<y>"],
        suggestions: [function() //gml_Script_anon@692@___struct___205_meta_grid_sh_grid
        {
            if (other.WC_drag_grid[0] != 32)
                return [other.WC_drag_grid[0], 32];
            return [32];
        }, function() //gml_Script_anon@816@___struct___205_meta_grid_sh_grid
        {
            if (other.WC_drag_grid[1] != 32)
                return [other.WC_drag_grid[1], 32];
            return [32];
        }],
        argumentDescriptions: ["the grid's horizontal snap", "the grid's vertical snap"]
    };
}

