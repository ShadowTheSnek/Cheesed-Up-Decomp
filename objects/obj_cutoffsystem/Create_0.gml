cutoffs = []
function add_cutoff@gml_Object_obj_cutoffsystem_Create_0(argument0, argument1, argument2, argument3) //gml_Script_add_cutoff@gml_Object_obj_cutoffsystem_Create_0
{
    array_push(cutoffs, 
    {
        x: argument0,
        y: argument1,
        big: argument2,
        angle: argument3,
        img: choose(0, 1),
        buffer: 2
    }
)
}

depth = 50
global.auto_cutoffs = 1
