var _buf = gml_Script_gameframe_prepare_buffer(8)
buffer_write(_buf, buffer_f64, argument0)
gameframe_syscommand_raw(buffer_get_address(_buf), 8)
