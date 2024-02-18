function sh_localmessage(argument0) //gml_Script_sh_localmessage
{
    if (array_length(argument0) < 2)
        return "Argument missing: author";
    if (array_length(argument0) < 3)
        return "Argument missing: message";
    var author = argument0[1]
    var message = self.WCscr_allargs(argument0, 2)
    if (author == "noone")
        author = -4
    global_message(message, author)
}

function meta_localmessage() //gml_Script_meta_localmessage
{
    return 
    {
        description: "triggers an online global message, but only you can see it",
        var arguments: ["author", "message"]
    };
}

