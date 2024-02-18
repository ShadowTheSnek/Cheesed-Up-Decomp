function scr_charactername(argument0) //gml_Script_scr_charactername
{
    var char = "Yourself"
    switch argument0
    {
        case "P":
            char = "Peppino"
            break
        case "N":
            char = "The Noise"
            break
        case "V":
            char = "Vigilante"
            break
        case "SP":
            char = "Pizzelle"
            break
        case "SN":
            char = "Pizzano"
            break
        case "BN":
            char = "Bo Noise"
            break
        case "S":
            char = "Snick"
            break
        case "G":
            char = "Gustavo"
            break
    }

    return char;
}

