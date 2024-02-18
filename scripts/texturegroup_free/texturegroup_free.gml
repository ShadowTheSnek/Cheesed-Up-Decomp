function texturegroup_free(argument0) //gml_Script_texturegroup_free
{
    trace(string("Freeing Texturegroup: \"{0}\"", argument0))
    var textures = texturegroup_get_textures(argument0)
    var i = 0
    var n = array_length(textures)
    while (i < n)
    {
        texture_flush(textures[i])
        i++
    }
    trace(string("Finished freeing Texturegroup: \"{0}\"", argument0))
}

