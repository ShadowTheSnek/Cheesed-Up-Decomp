function vertex_build_quad(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) //gml_Script_vertex_build_quad
{
    vertex_build_point(argument0, argument1, argument2, argument5, argument6, argument7, argument8)
    vertex_build_point(argument0, (argument1 + argument3), argument2, argument5, argument6, (argument7 + argument9), argument8)
    vertex_build_point(argument0, argument1, (argument2 + argument4), argument5, argument6, argument7, (argument8 + argument10))
    vertex_build_point(argument0, (argument1 + argument3), argument2, argument5, argument6, (argument7 + argument9), argument8)
    vertex_build_point(argument0, (argument1 + argument3), (argument2 + argument4), argument5, argument6, (argument7 + argument9), (argument8 + argument10))
    vertex_build_point(argument0, argument1, (argument2 + argument4), argument5, argument6, argument7, (argument8 + argument10))
}

