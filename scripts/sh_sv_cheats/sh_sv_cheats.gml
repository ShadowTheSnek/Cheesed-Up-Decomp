function sh_sv_cheats(argument0) //gml_Script_sh_sv_cheats
{
    if (argument0[1] == "1")
    {
        isOpen = 1
        return "thats not funny";
    }
    else if (argument0[1] == "0")
        instance_destroy()
    else
    {
        isOpen = 1
        return (argument0[1] + " is not a valid boolean");
    }
}

function meta_sv_cheats() //gml_Script_meta_sv_cheats
{
    return 
    {
        description: "This boolean ConVar enables/disables cheats on the server. It also gives you access to commmands that would normally be abused or misused by players. When building maps, you may want this as a startup command.",
        var arguments: ["boolean"],
        suggestions: [["0", "1"]],
        hidden: 1
    };
}

