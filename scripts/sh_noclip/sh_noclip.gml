function sh_noclip(argument0) //gml_Script_sh_noclip
{
    if (!WC_debug)
        return "You do not have permission to use this command";
    if (!instance_exists(obj_player1))
        return (safe_get(obj_pause, "pause") ? "Can't do this while paused" : "The player is not in the room");
    var collide = 0
    if (array_length(argument0) > 1)
    {
        if (argument0[1] == "1" || argument0[1] == "true")
            collide = 1
    }
    with (obj_player1)
    {
        var targetstate = (collide ? states.debugstate : states.debugstate)
        if (state == targetstate)
            state = states.normal
        else
            state = targetstate
    }
}

function meta_noclip() //gml_Script_meta_noclip
{
    return 
    {
        description: "puts the player in the debug state",
        var arguments: ["<collision>"]
    };
}

