function scr_keyfromname(argument0) //gml_Script_scr_keyfromname
{
    argument0 = string_replace_all(argument0, " ", "")
    argument0 = string_upper(argument0)
    switch argument0
    {
        case "SPACE":
            return 32;
        case "UP":
            return 38;
        case "DOWN":
            return 40;
        case "LEFT":
            return 37;
        case "RIGHT":
            return 39;
        case "TAB":
            return 9;
        case "ENTER":
        case "RETURN":
            return 13;
        case "ADD":
            return 107;
        case "ALT":
            return 18;
        case "ANY":
            return 1;
        case "BACKSPACE":
            return 8;
        case "CONTROL":
        case "CTRL":
            return 17;
        case "DECIMAL":
            return 110;
        case "ESCAPE":
            return 27;
        case "SHIFT":
            return 16;
        case "HOME":
            return 36;
        case "END":
            return 35;
        case "DELETE":
        case "DEL":
            return 46;
        case "INSERT":
        case "INS":
            return 45;
        case "PAGEUP":
            return 33;
        case "PAGEDOWN":
            return 34;
        case "PAUSE":
            return 19;
        case "PRINTSCREEN":
        case "IMPPNT":
        case "PRTSC":
        case "PRTSCR":
        case "PRINT":
            return 44;
        case "F1":
            return 112;
        case "F2":
            return 113;
        case "F3":
            return 114;
        case "F4":
            return 115;
        case "F5":
            return 116;
        case "F6":
            return 117;
        case "F7":
            return 118;
        case "F8":
            return 119;
        case "F9":
            return 120;
        case "F10":
            return 121;
        case "F11":
            return 122;
        case "F12":
            return 123;
        case "NUMPAD0":
            return 96;
        case "NUMPAD1":
            return 97;
        case "NUMPAD2":
            return 98;
        case "NUMPAD3":
            return 99;
        case "NUMPAD4":
            return 100;
        case "NUMPAD5":
            return 101;
        case "NUMPAD6":
            return 102;
        case "NUMPAD7":
            return 103;
        case "NUMPAD8":
            return 104;
        case "NUMPAD9":
            return 105;
        case "MULTIPLY":
            return 106;
        case "DIVIDE":
            return 111;
        case "SUBTRACT":
        case "SUBSTRACT":
            return 109;
        case "LEFTSHIFT":
        case "LSHIFT":
            return 160;
        case "LEFTCONTROL":
        case "LCONTROL":
        case "LEFTCTRL":
        case "LCTRL":
            return 162;
        case "LEFTALT":
        case "LALT":
            return 164;
        case "RIGHTSHIFT":
        case "RSHIFT":
            return 161;
        case "RIGHTCONTROL":
        case "RCONTROL":
        case "RIGHTCTRL":
        case "RCTRL":
            return 163;
        case "RIGHTALT":
        case "RALT":

        default:
            return ord(argument0);
    }

    return 165;
}
