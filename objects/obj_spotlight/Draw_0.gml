var vertical_stretch = (room_height - y)
var prev_color = draw_get_color()
var prev_bm = gpu_get_blendmode()
gpu_set_blendmode(bm_normal)
draw_set_color(beam_color)
var half_width = ((beam_base_width + beam_divergence) / 2)
var half_track = (track_size / 2)
var TL_x = (((x - half_width) + offset) - half_track)
var TL_y = vertical_stretch
var TR_x = (((x + half_width) + offset) - half_track)
var TR_y = vertical_stretch
var BL_x = (x - (beam_base_width / 2))
var BL_y = y
var BR_x = (x + (beam_base_width / 2))
var BR_y = y
draw_triangle(TL_x, TL_y, TR_x, TR_y, BL_x, BL_y, 0)
draw_triangle(TR_x, TR_y, BR_x, BR_y, BL_x, BL_y, 0)
gpu_set_blendmode(prev_bm)
draw_set_color(prev_color)
