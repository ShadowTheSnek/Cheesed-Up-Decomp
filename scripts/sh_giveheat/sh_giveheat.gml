function sh_giveheat(argument0) //gml_Script_sh_giveheat
{
    var style = 100
    if (array_length(argument0) > 1)
    {
        if string_is_number(argument0[1])
            style = real(argument0[1])
    }
    global.style += style
}

function meta_giveheat() //gml_Script_meta_giveheat
{
    return 
    {
        description: "gives heat",
        var arguments: ["<heat>"]
    };
}

