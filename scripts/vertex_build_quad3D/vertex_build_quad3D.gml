function vertex_build_quad3D(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11) //gml_Script_vertex_build_quad3D
{
    vertex_build_point3D(argument0, argument1, argument2, argument3, argument6, argument7, argument8, argument9)
    vertex_build_point3D(argument0, (argument1 + argument4), argument2, argument3, argument6, argument7, (argument8 + argument10), argument9)
    vertex_build_point3D(argument0, argument1, (argument2 + argument5), argument3, argument6, argument7, argument8, (argument9 + argument11))
    vertex_build_point3D(argument0, (argument1 + argument4), argument2, argument3, argument6, argument7, (argument8 + argument10), argument9)
    vertex_build_point3D(argument0, (argument1 + argument4), (argument2 + argument5), argument3, argument6, argument7, (argument8 + argument10), (argument9 + argument11))
    vertex_build_point3D(argument0, argument1, (argument2 + argument5), argument3, argument6, argument7, argument8, (argument9 + argument11))
}

