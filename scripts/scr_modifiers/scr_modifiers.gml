global.modifier_failed = 0
function reset_modifier() //gml_Script_reset_modifier
{
    global.hardmode = 0
    with (obj_deathmode)
        active = 0
    global.MOD = 
    {
        Encore: 0,
        Pacifist: 0,
        NoToppings: 0,
        HardMode: 0,
        Mirror: 0,
        DeathMode: 0,
        JohnGhost: 0,
        Spotlight: 0,
        EscapeInvert: 0,
        FromTheTop: 0,
        GravityJump: 0,
        DoubleTrouble: 0,
        NoiseGutter: 0,
        CTOPLaps: 0,
        OldLevels: 0,
        EasyMode: 0,
        Ordered: 0,
        SecretInclude: 0
    }

    with (obj_player)
        gravityjump = 0
}

reset_modifier()
function fail_modifier(argument0, argument1) //gml_Script_fail_modifier
{
    if (argument1 == undefined)
        argument1 = 1
    if (argument0 == argument1)
    {
        global.modifier_failed = 1
        instance_create_unique(obj_player1.x, obj_player1.y, obj_pizzaface)
    }
}

