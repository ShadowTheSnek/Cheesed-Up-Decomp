function sh_show_debug_overlay() //gml_Script_sh_show_debug_overlay
{
    WC_debugoverlay = (!WC_debugoverlay)
    show_debug_overlay(WC_debugoverlay)
    return string("Debug overlay {0}", (WC_debugoverlay ? "ON" : "OFF"));
}

function meta_show_debug_overlay() //gml_Script_meta_show_debug_overlay
{
    return 
    {
        description: "toggles debug overlay"
    };
}

