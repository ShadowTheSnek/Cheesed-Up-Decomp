function sh_bossinv() //gml_Script_sh_bossinv
{
    global.boss_invincible = (!global.boss_invincible)
    return string("Boss invincibility {0}", (global.boss_invincible ? "ON" : "OFF"));
}

function meta_bossinv() //gml_Script_meta_bossinv
{
    return 
    {
        description: ""
    };
}

