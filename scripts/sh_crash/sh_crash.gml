var _temp_local_var_4;
function sh_crash() //gml_Script_sh_crash
{
    if (!WC_debug)
        return "You do not have permission to use this command";
    var _temp_local_var_4 = @@throw@@("Crash text")
}

function meta_crash() //gml_Script_meta_crash
{
    return 
    {
        description: "crash the game"
    };
}

