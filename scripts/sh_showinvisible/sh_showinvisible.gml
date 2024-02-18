function sh_showinvisible(argument0) //gml_Script_sh_showinvisible
{
    if (array_length(argument0) > 1)
    {
        var mode = argument0[1]
        if (mode == "none" || mode == "0")
            mode = 0
        else if (mode == "sprites_only" || mode == "1")
            mode = 1
        else if (mode == "all" || mode == "2")
            mode = 2
        else
            return "Invalid mode";
        WC_showinvisible = mode
    }
    else
    {
        WC_showinvisible = (!(min(WC_showinvisible, 1)))
        WC_showcollisions = 0
        toggle_collisions(0)
        return string("Showing invisible objects {0}", (WC_showinvisible ? "ON" : "OFF"));
    }
}

function meta_showinvisible() //gml_Script_meta_showinvisible
{
    return 
    {
        description: "if active, redraws every instance in the room, revealing invisible ones",
        var arguments: ["<mode>"],
        suggestions: [["none", "sprites_only", "all"]]
    };
}

