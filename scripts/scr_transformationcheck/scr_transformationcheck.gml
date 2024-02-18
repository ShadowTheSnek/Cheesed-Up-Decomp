function scr_transformationcheck() //gml_Script_scr_transformationcheck
{
    return ((!(array_contains(transformation, state))) || state == states.actor || state == states.tube);
}

