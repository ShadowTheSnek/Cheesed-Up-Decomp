fmod_set_parameter("REMIX", global.gameplay, 1)
if global.MOD.Mirror
    fmod_set_listener_attributes(0, (room_width - (camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2))), (camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2)))
else
    fmod_set_listener_attributes(0, (camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2)), (camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2)))
fmod_update()
