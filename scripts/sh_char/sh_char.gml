function sh_char(argument0) //gml_Script_sh_char
{
    if ((!WC_debug) && (!(string_starts_with(room_get_name(room), "tower"))))
        return "You cannot use this command inside of a level";
    if (!instance_exists(obj_player1))
        return (safe_get(obj_pause, "pause") ? "Can't do this while paused" : "The player is not in the room");
    if (array_length(argument0) < 2)
        return "Missing argument: character";
    with (obj_player1)
    {
        character = argument0[1]
        if (isgustavo && character != "G")
            state = states.normal
        isgustavo = character == "G"
        brick = character == "G"
        scr_characterspr()
    }
    if (argument0[1] == "M")
        return "Yeah, good luck with that.";
}

function meta_char() //gml_Script_meta_char
{
    return 
    {
        description: "change characters",
        var arguments: ["character"],
        suggestions: [["P", "N", "V", "S", "G", "SP", "SN", "BN"]]
    };
}

