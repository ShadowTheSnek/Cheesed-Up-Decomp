var _temp_local_var_9;
open_menu()
con = 0
fade = 0
surf = -1
output = ""
input_mode = 0
input = ""
blink = 0
scroll = 0
echo = 1
bordersurf = -1
instructions = []
instructionT = 0
instructionF = -1
draw_set_font(fnt_dos)
lineh = string_height("A")
keyboard_string = ""
function DOS_instruct@gml_Object_obj_msdos_Create_0(argument0, argument1) //gml_Script_DOS_instruct@gml_Object_obj_msdos_Create_0
{
    array_push(instructions, [argument0, argument1])
}

function DOS_initstate2@gml_Object_obj_msdos_Create_0() //gml_Script_DOS_initstate2@gml_Object_obj_msdos_Create_0
{
    output += "\n"
    if echo
    {
        output += currentdir.ROOTNAME
        output += ">"
    }
    input_mode = 1
}

function DOS_initstate@gml_Object_obj_msdos_Create_0() //gml_Script_DOS_initstate@gml_Object_obj_msdos_Create_0
{
    output += "\n"
    self.DOS_instruct(3, DOS_initstate2)
}

function DOS_allargs@gml_Object_obj_msdos_Create_0(argument0, argument1, argument2, argument3) //gml_Script_DOS_allargs@gml_Object_obj_msdos_Create_0
{
    if (argument1 == undefined)
        argument1 = ""
    if (argument2 == undefined)
        argument2 = 1
    if (argument3 == undefined)
        argument3 = " "
    var ret = ""
    if (argument1 == "")
    {
        for (var i = argument2; i < array_length(argument0); i++)
        {
            ret += argument0[i]
            if (i != (array_length(argument0) - 1))
                ret += argument3
        }
        return ret;
    }
    else
    {
        for (i = 0; i < argument2; i++)
        {
            ret += argument0[i]
            if (i != (array_length(argument0) - 1))
                ret += argument3
        }
        return string_replace_all(argument1, ret, "");
    }
}

function DOS_command@gml_Object_obj_msdos_Create_0(argument0) //gml_Script_DOS_command@gml_Object_obj_msdos_Create_0
{
    if (argument0 == undefined)
        argument0 = input
    input_mode = 0
    if (string_replace_all(argument0, " ", "") == "")
        self.DOS_initstate2()
    else
    {
        output += "\n"
        var args_raw = string_split_ext(argument0, [" ", "\\", "/"], 1, infinity)
        var args = []
        for (i = 0; i < array_length(args_raw); i++)
        {
            if (string_pos(".", args_raw[i]) != 0)
            {
                var fuck = string_split(args_raw[i], ".", 0, infinity)
                for (var j = 0; j < array_length(fuck); j++)
                {
                    if (fuck[j] != "")
                        array_push(args, fuck[j])
                    if (j != (array_length(fuck) - 1))
                        array_push(args, ".")
                }
            }
            else
                array_push(args, args_raw[i])
        }
        switch string_lower(args[0])
        {
            case "cls":
                output = ""
                self.DOS_instruct(3, DOS_initstate2)
                break
            case "cd":
            case "chdir":
                var revert = currentdir
                if (array_length(args) == 1)
                    output += (revert.ROOTNAME + "\n")
                else
                {
                    i = 1
                    while (i < array_length(args))
                    {
                        var cur = args[i]
                        var last = i == (array_length(args) - 1)
                        if (cur == "." && (!last) && args[(i + 1)] == ".")
                        {
                            if (currentdir.DIR == self)
                            {
                                output += gml_Script_lang_get_value_newline("msdos_invalid")
                                output += "\n"
                                currentdir = revert
                                break
                            }
                            else
                            {
                                currentdir = currentdir.DIR
                                i++
                                i++
                                continue
                            }
                        }
                        else if (cur == ".")
                        {
                            i++
                            continue
                        }
                        else
                        {
                            var emptyhanded = 1
                            for (j = 0; j < array_length(currentdir.CONTENT); j++)
                            {
                                var file = currentdir.CONTENT[j]
                                if (file.TYPE == 1 && string_upper(file.NAME) == string_upper(args[i]))
                                {
                                    currentdir = file
                                    emptyhanded = 0
                                }
                            }
                            if emptyhanded
                            {
                                output += gml_Script_lang_get_value_newline("msdos_invalid")
                                output += "\n"
                                currentdir = revert
                                break
                            }
                            else
                            {
                                i++
                                continue
                            }
                        }
                    }
                }
                self.DOS_instruct(3, DOS_initstate2)
                break
            case "help":
                switch progression
                {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                    case 7:
                    case 8:
                    case 9:
                    case 10:
                        output += gml_Script_lang_get_value_newline(concat("msdos_help", progression))
                        progression++
                        break
                    case 6:
                    case 6.1:
                        if (currentdir.NAME == "1985")
                        {
                            output += gml_Script_lang_get_value_newline("msdos_help6")
                            progression = 7
                        }
                        else if (currentdir.NAME != root.NAME)
                        {
                            output += gml_Script_lang_get_value_newline("msdos_help90")
                            progression = 6.1
                        }
                        else
                        {
                            output += (progression == 6 ? gml_Script_lang_get_value_newline("msdos_help91") : choose(gml_Script_lang_get_value_newline("msdos_help92"), gml_Script_lang_get_value_newline("msdos_help93"), gml_Script_lang_get_value_newline("msdos_help94")))
                            progression = 6.1
                        }
                        break
                    case 11:
                        output += "marior"
                        progression++
                        break
                    case 12:
                        output += gml_Script_lang_get_value_newline(embed_value_string("msdos_help12", ["marior"]))
                        break
                    default:
                        output += gml_Script_lang_get_value_newline("msdos_help")
                        break
                }

                output += "\n"
                self.DOS_instruct(3, DOS_initstate2)
                break
            case "echo":
                if (array_length(args) == 2 && args[1] == "on")
                    echo = 1
                else if (array_length(args) == 2 && args[1] == "off")
                    echo = 0
                else if (array_length(args) > 1)
                {
                    for (i = 1; i < array_length(args); i++)
                        output += (args[i] + " ")
                    output += "\n"
                }
                else
                    output += string("ECHO is {0}\n", (echo ? "on" : "off"))
                self.DOS_instruct(3, DOS_initstate2)
                break
            case "call":
                self.DOS_command(self.DOS_allargs(args, argument0))
                break
            case "exit":
                output += "\n"
                self.DOS_instruct(50, function() //gml_Script_anon@5699@DOS_command_gml_Object_obj_msdos_Create_0
                {
                    obj_player1.state = states.normal
                    instance_destroy()
                }
)
                break
            case "mkdir":
            case "md":
                if (array_length(args) == 1)
                {
                    output += gml_Script_lang_get_value_newline("msdos_short")
                    output += "\n"
                }
                else
                {
                    emptyhanded = 1
                    j = 0
                    while (j < array_length(currentdir.CONTENT))
                    {
                        var allargs = string_upper(self.DOS_allargs(args, argument0))
                        file = currentdir.CONTENT[j]
                        if (file.TYPE == 1 && (file.NAME == allargs || file.ROOTNAME == allargs))
                        {
                            emptyhanded = 0
                            break
                        }
                        else
                        {
                            j++
                            continue
                        }
                    }
                    if emptyhanded
                        self.DOS_adddir(self.DOS_directory(string_upper(self.DOS_allargs(args, argument0))), currentdir)
                    else
                    {
                        output += gml_Script_lang_get_value_newline("msdos_exists")
                        output += "\n"
                    }
                }
                self.DOS_instruct(3, DOS_initstate2)
                break
            case "rmdir":
                if (array_length(args) == 1)
                {
                    output += gml_Script_lang_get_value_newline("msdos_short")
                    output += "\n"
                }
                else
                {
                    revert = currentdir
                    emptyhanded = 1
                    for (j = 0; j < array_length(currentdir.CONTENT); j++)
                    {
                        allargs = string_upper(self.DOS_allargs(args, argument0))
                        file = currentdir.CONTENT[j]
                        if (file.TYPE == 1 && (file.NAME == allargs || file.ROOTNAME == allargs))
                        {
                            currentdir = file
                            emptyhanded = 0
                        }
                    }
                    if ((!emptyhanded) && array_length(currentdir.CONTENT) == 0)
                        currentdir.TYPE = -1
                    else
                    {
                        output += gml_Script_lang_get_value_newline("msdos_invalid2")
                        output += "\n"
                    }
                    currentdir = revert
                }
                self.DOS_instruct(3, DOS_initstate2)
                break
            case "dir":
            case "move":
            case "del":
            case "ren":
                output += gml_Script_lang_get_value_newline("msdos_ominous")
                output += "\n"
                self.DOS_instruct(3, DOS_initstate2)
                break
            default:
                emptyhanded = 1
                for (j = 0; j < array_length(currentdir.CONTENT); j++)
                {
                    file = currentdir.CONTENT[j]
                    var filename = string_lower(file.NAME)
                    var pos = string_pos(".", filename)
                    if (pos != 0)
                        filename = string_copy(filename, 1, (string_pos(".", filename) - 1))
                    if (file.TYPE == 0 && filename == string_lower(args[0]))
                    {
                        if is_method(file.FUNC)
                        {
                            input_mode = 0
                            file.file.FUNC()
                        }
                        emptyhanded = 0
                    }
                }
                if emptyhanded
                {
                    output += gml_Script_lang_get_value_newline("msdos_bad")
                    output += "\n"
                    self.DOS_instruct(3, DOS_initstate2)
                }
                break
        }

    }
}

function DOS_directory@gml_Object_obj_msdos_Create_0(argument0) //gml_Script_DOS_directory@gml_Object_obj_msdos_Create_0
{
    return 
    {
        TYPE: 1,
        NAME: argument0,
        CONTENT: [],
        DIR: -1,
        ROOTNAME: argument0
    };
}

function DOS_adddir@gml_Object_obj_msdos_Create_0(argument0, argument1) //gml_Script_DOS_adddir@gml_Object_obj_msdos_Create_0
{
    if string_ends_with(argument1.ROOTNAME, "\\")
        argument0.ROOTNAME = concat(argument1.ROOTNAME, argument0.ROOTNAME)
    else
        argument0.ROOTNAME = concat(argument1.ROOTNAME, "\\", argument0.ROOTNAME)
    argument0.DIR = argument1
    array_push(argument1.CONTENT, argument0)
}

function DOS_file@gml_Object_obj_msdos_Create_0(argument0, argument1, argument2) //gml_Script_DOS_file@gml_Object_obj_msdos_Create_0
{
    file = 
    {
        TYPE: 0,
        NAME: argument1,
        FUNC: argument2,
        DATE: 0,
        SIZE: 0
    }

    array_push(argument0.CONTENT, file)
    return file;
}

DOS_instruct(50, function() //gml_Script_anon@8305@gml_Object_obj_msdos_Create_0
{
    output = gml_Script_lang_get_value_newline("msdos_start1")
}
)
DOS_instruct(100, function() //gml_Script_anon@8369@gml_Object_obj_msdos_Create_0
{
    output += "\n"
    output += gml_Script_lang_get_value_newline("msdos_start2")
}
)
DOS_instruct(10, gml_Script_DOS_initstate@gml_Object_obj_msdos_Create_0)
root = DOS_directory("C:\\")
var folder = DOS_directory("1985")
DOS_adddir(folder, root)
var mario = DOS_file(folder, "marior", function() //gml_Script_anon@8634@gml_Object_obj_msdos_Create_0
{
    output = ""
    var lag = 3
    self.DOS_instruct(lag, function() //gml_Script_anon@8701@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@@&&&@@@@@@@@@@@@@@%%%%#&%%%%##(((#%%%%%&%%%%%@@@@@@@@@@@@@@@&@@&@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@8832@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@@&&&@@@@@@@@@@@@@@%%%&((###############((%%%%@@@@@@@@@@@@@@@&@@&@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@8963@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@@&&&@@@@@@@@@@@@@@#(#######..	, *%######(%@@@@@@@@@@@@@@@&@@&@@@&@@@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@9093@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@@&&&@@@@@@@@@@@@/(#######. ,(#(/(#(...%%%%%####@@@@@@@@@@@@@&@@&@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@9224@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@@&&@&&&&&&&&&&/(########/./##  % .##*.%%%%%%%%##%@@@@@@@@@@@&@@&@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@9355@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@@&&&&&&&&&&&&(######%%%%%/.%.....,,%.%%%%%%%%%%%#(&&&&&&&&&&&@@&@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@9486@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@@&&&&&&&&&&&(#####%%%%%##((#############%%%%%%%%%#(&&&&&&&&&&&@&@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@9617@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@%%%%%%%%%%%(####%%#%%%%%%%%%%%%%%%%%%%%%%%%%#&%%%%#(%%%%%%%%%%&&@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@9748@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@%%%%%%%%%%#(##%#%%%%&@@@@@%/////////@@@@@@%%%%%#%%##%%%%%%%%%%%@@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@9879@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@%%%%%%%%%%(###%%%((/@*|***#@*******@|**//(@/((&%%%%#%%%%%%%%%%%@@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@10010@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@&&&&&&&&&&&(#%%#,,***/,..#%#,,,,,**%%#,*/|****%&&%%(%%%%%%%%%%&@@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@10141@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@@@@@@@@@@@ ..,##,...,  %/# %*..,,,#% %//,*****&&%|**(&&&&&&&&&&@@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@10272@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@###########.***,##%....  #(%&*.......(%&|*,*,,*,&&#**///##########@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@10403@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@&##########,,,**#% ....... ............,,,,,,*,,/&%(**/#%%%%%%%%%%@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@10534@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@&&&&&&&&&&&..,.&../%%&@#,..........,,,,,*%&&&&**/#/|**&&&&&&&&&&&@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@10665@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@@@@@@@@@@@@,.....*&&&%%%*,,,,,,,,,,,**&@@&&&@**.***#@@@@@@@@@@@@@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@10796@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@@@@@@@@@@@@@%#* .,,**&&&&&(*********&@@@@&*****.*%&@@@@@@@@@@@@@@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@10927@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@@@@@@@@@@@@@%#&&.,,,,,,*/,%&@@@@@@@@(/(*******,&&&&@@@@@@@@@@@@@@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@11058@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@@@@@@@@@@@@@@@@@@@**,,,,..,,,,,*************/&@@@@@@@@@@@@@@@@@@@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@11189@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@@@@@@@@@@@@@&%%%%#%(&&|**,,,...,********(&%#%%%%%%&@@@@@@@@@@@@@@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@11320@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@@@@@@@@@@@@@&%(########%@&&(***////#&&&&&%%%%%%%%%&@@@@@@@@@@@@@@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@11451@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@@@@@@@@@@@@&############&#####%%&&&&&&&%%%%%%%%%%%#@@@@@@@@@@@@@@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@11582@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@@@@@@@@@@%#######%######&############%%%%&%%%%%%%%%%%@@@@@@@@@@@@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@11713@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@@@@@@@@########%%#.....(%##############....,(%&&&%%%%%%@@@@@@@@@@@@&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@11844@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@&&&&&&&&&&%######%%%%(#....*#%##############%.,,,*%#&&&&%%%%%#&&&&&&&&&&&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@11975@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@@@@@%######%%%%%(#####%&(################&##%%%%%&&&&%%##%%#@@@@@@@@@@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@12106@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@@@@#%&#######%%%&@#(###############################%%&&&%%###%%%(@#%@@@@@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@12237@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "&&&&&&&@	  ##%%%&&@########################%%%%#%#####%&@&%%%##*	. @&&&&&&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@12365@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@@@%,	  ...,&&&&&##############################%%%%%%%@&%%(		  (&@&@@@@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@12491@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@&		 ..,*/(@&&#######################%%%%%%%%%%%%%#&&@...		  .*#@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@12611@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "&&		 .....,(%&&&#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&@/.			..,&@@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@12731@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "%		 .......*%&%%%#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#%%&&,			 .../@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@12850@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "*	   ...*//,..,(&&%%(##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#%%##.  .*/,.	....,,@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@12977@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@ .........*/.,..,/%%&%#######%%%%%&%%%%%%%%%&%%%%%%%%%%%%&&#%...,	  ..**,***@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@13107@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "@@@,,..,...,,//.**@@%%(#########%%%%&&&%%&&&&%%%%######%%%#&&@@,,*/. ...*|***(@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@13238@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "&&&&&%(,**(%%%(###@%%%###########%%%&&%&&&&&%##########%%%%&&%@%###%%%|***(%&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@13369@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "&&&&&%%%%%%%%%(##%%%%(###########%%%&&%&%%%%############%%%%%%%&###%%%%#%%%%&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@13500@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "&&&&&%%%%%%%%%(%%%%%%(##########%%%%&%%%%%%%############%%%#&&&&&&#%%%%#%%%%&@@@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@13631@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "&@&&&%%%%%%%%%%%%%%%############%%%%&%&&%%%##############%%%%%%%%%%%%%%#%%%%&@&@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@13762@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "&@&@@#%%%%&&&&&&&&&&(##########%%%%%%&&&&&&%#############%%%#&&&&&&&&&%#%%%%@@%@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@13893@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "&@&@@@@@@&&&&&&&&&&############%%%%%%&&&%%%%##############%%#&&&&&&&&&&%@@@@@@%@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@14024@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "&@&@@@@@%%%%%%%%%%&(##########%%%%%%&&&&%%%%###############%%#&&&&&&&&&&&@@@@@%@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@14155@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "&@&@@@@@@@@@@@&@@@############%%%%%%&&&&&&&&&###############%%&@@@&@@@@@@@@@@@%@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@14286@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "&@&@@@@@@@@@@@&%(*//((###%%###%%%%%%&&&&&&&&&#########%###(((/|*%%&@@@@@@@@@@@%@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@14417@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "&@&@@@@@@@@@@(////////(((####%%%%%%%%%%%&&&&#####%#((((((///////(/(&@@@@@@@@@@%@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@14548@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "&@&&&&&&&&&&////|****/((((###%%%%%%#%%%%%%%%%((((((((((|***////(((((%&&&&&&&&&&@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@14679@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "&&&&&&&&&&&&/(((((///(((((####%####(&&&&&&&&&((((((((((((//(((((((##(%%%%%%%%%%&\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@14810@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "&@&&&&&&&&&&#((((((((#######%#####/////////////####((((((((((#######&&&&&&&&&&&@\n"
    }
)
    self.DOS_instruct(lag, function() //gml_Script_anon@14941@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += "&@@#((((((((((/#%%%%%%%%%%%#(((&%%&&&&&&@@@@@@%%%#,*/#%%%%%%%%%%%#/((((((((((%@@\n"
    }
)
    var _temp_local_var_9 = 10
    if (10 <= 0)
    {
    }
    else
    {
        while (true)
        {
            self.DOS_instruct(lag, function() //gml_Script_anon@15085@anon@8634_gml_Object_obj_msdos_Create_0
            {
                output += "\n"
            }
)
            var _temp_local_var_9 = (10 - 1)
            if (10 - 1)
            {
                continue
                break
            }
        }
    }
    self.DOS_instruct(lag, function() //gml_Script_anon@15136@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output = ""
    }
)
    self.DOS_instruct(100, function() //gml_Script_anon@15184@anon@8634_gml_Object_obj_msdos_Create_0
    {
        ini_open_from_string(obj_savesystem.ini_str_options)
        if (!(ini_read_real("Palettes", "mario", 0)))
        {
            with (gml_Script_instance_create(0, 0, obj_cheftask))
            {
                achievement_spr = -4
                sprite_index = spr_newclothes
                paletteselect = 12
                texture = spr_pattern_mario
            }
            ini_write_real("Palettes", "mario", 1)
            gamesave_async_save_options()
        }
        obj_savesystem.ini_str_options = ini_close()
        output = gml_Script_lang_get_value_newline("msdos_congratulation")
        output += "\n"
    }
)
    self.DOS_instruct(100, function() //gml_Script_anon@15715@anon@8634_gml_Object_obj_msdos_Create_0
    {
        output += gml_Script_lang_get_value_newline("msdos_pause")
        output += "\n"
        input_mode = 2
    }
)
}
)
mario.SIZE = 64
mario.DATE = date_create_datetime(1985, 8, 13, 0, 0, 0)
trace(root)
currentdir = root
progression = 0
with (obj_shell)
    WC_bindsenabled = 0
