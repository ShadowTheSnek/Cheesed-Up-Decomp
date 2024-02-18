function particle_momentum(argument0) //gml_Script_particle_momentum
{
    if (argument0 == undefined)
        argument0 = obj_player1
    if (!global.gameplay)
        return;
    particle_hsp(argument0)
    particle_vsp(argument0)
}

function particle_hsp(argument0) //gml_Script_particle_hsp
{
    if (argument0 == undefined)
        argument0 = obj_player1
    if (!global.gameplay)
        return;
    momentum.x = (argument0.hsp / 2)
}

function particle_vsp(argument0) //gml_Script_particle_vsp
{
    if (argument0 == undefined)
        argument0 = obj_player1
    if (!global.gameplay)
        return;
    if (argument0.vsp < 0)
        momentum.y = (argument0.vsp / 2)
}

