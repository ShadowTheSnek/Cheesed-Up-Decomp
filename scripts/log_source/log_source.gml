function log_source(argument0) //gml_Script_log_source
{
    if (argument0 == undefined)
        argument0 = ""
    trace(string("[Stacktrace] {0}", debug_get_callstack()))
}

