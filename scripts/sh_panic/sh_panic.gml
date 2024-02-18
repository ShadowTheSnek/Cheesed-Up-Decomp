function sh_panic(argument0) //gml_Script_sh_panic
{
    if (!WC_debug)
        return "You do not have permission to use this command";
    var togglepanic = (!global.panic)
    if (array_length(argument0) > 1)
    {
        if (argument0[1] == "true" || argument0[1] == "1")
            togglepanic = 1
        else if (argument0[1] == "false" || argument0[1] == "0")
            togglepanic = 0
        else
            return string("Invalid argument: {0}", argument0[1]);
    }
    var minutes = undefined
    var seconds = undefined
    if (array_length(argument0) > 2)
    {
        if string_is_number(argument0[2])
            minutes = real(argument0[2])
        else
            return "Minutes parameter should be a valid number";
    }
    if (array_length(argument0) > 3)
    {
        if string_is_number(argument0[3])
            seconds = real(argument0[3])
        else
            return "Seconds parameter should be a valid number";
    }
    if togglepanic
    {
        activate_panic()
        if (minutes != undefined)
        {
            if (seconds == undefined)
                global.fill = minutes
            else
            {
                global.minutes = minutes
                global.seconds = seconds
                global.fill = ((((minutes * 60) + seconds) * 60) * 0.2)
            }
        }
        with (obj_tv)
            chunkmax = global.fill
        global.wave = 0
        global.maxwave = max(global.fill, 1)
    }
    else
    {
        with (obj_camera)
        {
            alarm[1] = -1
            alarm[2] = -1
        }
        global.panic = 0
    }
}

function meta_panic() //gml_Script_meta_panic
{
    return 
    {
        description: "toggle it's pizza time on or off",
        var arguments: ["<active>", "<minutes/fill>", "<seconds>"],
        suggestions: [["true", "false"], [], []],
        argumentDescriptions: ["whether to toggle escape on or off. true means on, false means off", "(optional) set fill for the escape or minutes if seconds are provided", "(optional) set seconds for the escape"]
    };
}

