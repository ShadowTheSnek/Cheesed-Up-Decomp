var _exception;
function sh_tp(argument0) //gml_Script_sh_tp
{
    if (!WC_debug)
        return "You do not have permission to use this command";
    if (!instance_exists(obj_player1))
        return (safe_get(obj_pause, "pause") ? "Can't do this while paused" : "The player is not in the room");
    if (array_length(argument0) != 3)
        return "Invalid amount of arguments; proper syntax is: tp <x> <y>";
    with (obj_player1)
    {
        var xx = 0
        var yy = 0
        @@try_hook@@(292, 372)
        xx = real(argument0[1])
        @@try_unhook@@()
        @@try_hook@@(456, 536)
        yy = real(argument0[2])
        @@try_unhook@@()
        x = xx
        y = yy
    }
}

function meta_tp() //gml_Script_meta_tp
{
    return 
    {
        description: "Teleports the player to a given position",
        var arguments: ["x", "y"]
    };
}

