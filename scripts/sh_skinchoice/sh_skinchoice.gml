function sh_skin() //gml_Script_sh_skin
{
    if (!WC_debug)
        return "You do not have permission to use this command";
    isOpen = 0
    gml_Script_instance_create(0, 0, obj_skinchoice)
}

function meta_skin() //gml_Script_meta_skin
{
    return 
    {
        description: "opens palette menu"
    };
}

