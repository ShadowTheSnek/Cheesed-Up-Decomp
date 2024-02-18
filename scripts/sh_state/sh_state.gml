function sh_state(argument0) //gml_Script_sh_state
{
    if (!WC_debug)
        return "You do not have permission to use this command";
    if (!instance_exists(obj_player1))
        return (safe_get(obj_pause, "pause") ? "Can't do this while paused" : "The player is not in the room");
    if (array_length(argument0) < 2)
    {
        var statename = ""
        var keys_array = variable_struct_get_names(global.states)
        var i = (array_length(keys_array) - 1)
        while (i >= 0)
        {
            if (variable_struct_get(global.states, keys_array[i]) == obj_player1.state)
            {
                statename = keys_array[i]
                break
            }
            else
            {
                i -= 1
                continue
            }
        }
        return string("The current player state is {0} ({1})", statename, obj_player1.state);
    }
    var _state = argument0[1]
    if string_is_number(_state)
    {
        with (obj_player1)
            state = real(_state)
        return string("Set the player's state to {0}", _state);
    }
    else
    {
        if string_starts_with(_state, "states.")
            _state = string_replace(_state, "states.", "")
        if (variable_global_exists("states") && is_struct(global.states) && variable_struct_exists(global.states, _state))
        {
            with (obj_player1)
                state = variable_struct_get(global.states, _state)
            return string("Set the player's state to {0} ({1})", argument0[1], obj_player1.state);
        }
        else
            return string("The state {0} doesn't exist", argument0[1]);
    }
}

function meta_state() //gml_Script_meta_state
{
    return 
    {
        description: "change the player's state",
        var arguments: ["state"],
        suggestions: [function() //gml_Script_anon@1396@___struct___262_meta_state_sh_state
        {
            var state_array = variable_struct_get_names(global.states)
            array_sort(state_array, 1)
            return state_array;
        }]
    };
}

