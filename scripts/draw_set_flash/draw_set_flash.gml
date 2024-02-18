global.__FLASH_BLENDMODE = [5, 6]
global.__FLASH_SHADER = -1
function draw_set_flash(argument0) //gml_Script_draw_set_flash
{
    if (argument0 == undefined)
        argument0 = (global.gameplay ? c_white : merge_colour(c_red, c_white, 0.9))
    global.__FLASH_BLENDMODE = gpu_get_blendmode_ext()
    global.__FLASH_SHADER = shader_current()
    if (@@Global@@().__FLASH_BLENDMODE[0] == 2)
        gpu_set_blendmode(bm_normal)
    shader_reset()
    gpu_set_fog(true, argument0, 0, 1)
}

function draw_reset_flash() //gml_Script_draw_reset_flash
{
    if array_get(gpu_get_fog(), 0)
    {
        gpu_set_blendmode_ext(@@Global@@().__FLASH_BLENDMODE[0], @@Global@@().__FLASH_BLENDMODE[1])
        shader_set_fix(global.__FLASH_SHADER)
        gpu_set_fog(false, c_black, 0, 0)
    }
}

