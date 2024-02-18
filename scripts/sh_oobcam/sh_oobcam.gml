function sh_oobcam() //gml_Script_sh_oobcam
{
    if (!WC_debug)
        return "You do not have permission to use this command";
    WC_oobcam = (!WC_oobcam)
    if (!isOpen)
        create_transformation_tip(concat("{s}Limitless camera ", (WC_oobcam ? "ON" : "OFF"), "/"))
    else
        return string("Limitless camera {0}", (WC_oobcam ? "ON" : "OFF"));
}

function meta_oobcam() //gml_Script_meta_oobcam
{
    return 
    {
        description: "toggles the limitless camera"
    };
}

