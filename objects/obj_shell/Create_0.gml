var _exception;
isOpen = 0
isAutocompleteOpen = 0
shellSurface = -4
scrollSurface = -4
shellOriginX = 0
shellOriginY = 0
visibleWidth = 0
visibleHeight = 0
cursorPos = 1
consoleString = ""
savedConsoleString = ""
scrollPosition = 0
maxScrollPosition = 0
targetScrollPosition = 0
commandSubmitted = 0
insertMode = 1
historyPos = 0
history = []
output = []
outputHeight = 0
filteredSuggestions = []
inputArray = []
suggestionIndex = 0
autocompleteMaxWidth = 0
autocompleteScrollPosition = 0
autocompleteOriginX = 0
autocompleteOriginY = 0
mousePreviousX = gml_Script_device_mouse_x_to_gui_hook(0)
mousePreviousY = device_mouse_y_to_gui(0)
shellPropertiesHash = ""
killedString = ""
metaDeleted = 0
metaMovedLeft = 0
metaMovedRight = 0
deferredQueue = ds_queue_create()
savedHistoryFilePath = (working_directory + "rt-shell-saved-history.data")
loadedSavedHistory = 0
loadedHistoryScrolled = 0
selection_left = -4
selection_right = -4
activeMouseArgType = undefined
activeMouseArgValue = ""
event_user(0)
if (instance_number(object_index) > 1)
    instance_destroy()
function open@gml_Object_obj_shell_Create_0() //gml_Script_open@gml_Object_obj_shell_Create_0
{
    isOpen = 1
    keyboard_string = ""
    if (!is_undefined(openFunction))
        self.openFunction()
}

function close@gml_Object_obj_shell_Create_0() //gml_Script_close@gml_Object_obj_shell_Create_0
{
    isOpen = 0
    if (!is_undefined(closeFunction))
        self.closeFunction()
    while (!ds_queue_empty(deferredQueue))
    {
        var args = ds_queue_dequeue(deferredQueue)
        args.args._execute_script(1, self)
    }
    if saveHistory
        self.self._save_history()
}

function _close_autocomplete@gml_Object_obj_shell_Create_0() //gml_Script__close_autocomplete@gml_Object_obj_shell_Create_0
{
    array_resize(filteredSuggestions, 0)
}

availableFunctions = []
allFunctions = []
functionData = {}
var globalVariables = variable_instance_get_names(@@Global@@())
for (var i = 0; i < array_length(globalVariables); i++)
{
    if (string_pos("meta_", string_lower(globalVariables[i])) == 1)
    {
        var name = string_delete(string_lower(globalVariables[i]), 1, 5)
        variable_struct_set(functionData, name, self.variable_instance_get(@@Global@@(), globalVariables[i])())
    }
}
for (i = 0; i < array_length(globalVariables); i++)
{
    if (string_pos("sh_", string_lower(globalVariables[i])) == 1)
    {
        name = string_delete(string_lower(globalVariables[i]), 1, 3)
        var hidden = 0
        var metadata = variable_struct_get(functionData, name)
        if (!is_undefined(metadata))
        {
            if variable_struct_exists(metadata, "hidden")
                hidden = metadata.hidden
        }
        if (!hidden)
            array_push(availableFunctions, name)
        array_push(allFunctions, name)
    }
    array_sort(availableFunctions, 1)
}
function _update_filtered_suggestions@gml_Object_obj_shell_Create_0() //gml_Script__update_filtered_suggestions@gml_Object_obj_shell_Create_0
{
    array_resize(filteredSuggestions, 0)
    autocompleteMaxWidth = 0
    suggestionIndex = 0
    activeMouseArgType = undefined
    var inputString = string(consoleString)
    inputArray = inputString.inputString._input_string_split(self)
    if (string_length(inputString) == 0 || array_length(inputArray) == 0)
        return;
    draw_set_font(consoleFont)
    var spaceCount = (array_length(inputArray) - 1)
    if (spaceCount == 0)
    {
        for (i = 0; i < array_length(availableFunctions); i++)
        {
            if (string_pos(inputString, availableFunctions[i]) == 1 && inputString != availableFunctions[i])
            {
                array_push(filteredSuggestions, availableFunctions[i])
                autocompleteMaxWidth = max(autocompleteMaxWidth, string_width(availableFunctions[i]))
            }
        }
    }
    else
    {
        var functionName = inputArray[0]
        var argumentIndex = (spaceCount - 1)
        var dataExists = variable_struct_exists(functionData, functionName)
        var noExtraSpace = string_char_at(inputString, (string_last_pos(" ", inputString) - 1)) != " "
        if (dataExists && noExtraSpace && spaceCount <= array_length(inputArray))
        {
            var suggestionData = variable_struct_get(variable_struct_get(functionData, array_get(inputArray, 0)), "suggestions")
            var argumentSuggestions = []
            if (argumentIndex < array_length(suggestionData))
            {
                if is_array(suggestionData[argumentIndex])
                    argumentSuggestions = suggestionData[argumentIndex]
                else if is_method(suggestionData[argumentIndex])
                    argumentSuggestions = self.suggestionData[argumentIndex]()
                else if is_int64(suggestionData[argumentIndex])
                    activeMouseArgType = suggestionData[argumentIndex]
                var currentArgument = inputArray[(array_length(inputArray) - 1)]
                for (i = 0; i < array_length(argumentSuggestions); i++)
                {
                    var prefixMatch = string_pos(currentArgument, argumentSuggestions[i]) == 1
                    if (string_last_pos(" ", inputString) == string_length(inputString) || prefixMatch)
                    {
                        array_push(filteredSuggestions, argumentSuggestions[i])
                        autocompleteMaxWidth = max(autocompleteMaxWidth, string_width(argumentSuggestions[i]))
                    }
                }
            }
        }
    }
    autocompleteScrollPosition = 0
    array_sort(filteredSuggestions, 1)
}

function _find_common_prefix@gml_Object_obj_shell_Create_0() //gml_Script__find_common_prefix@gml_Object_obj_shell_Create_0
{
    if (array_length(filteredSuggestions) == 0)
        return "";
    var first = string(filteredSuggestions[0])
    var last = string(filteredSuggestions[(array_length(filteredSuggestions) - 1)])
    var result = ""
    spaceCount = string_count(" ", consoleString)
    if (spaceCount > 0)
    {
        for (i = 0; i < spaceCount; i++)
            result += (inputArray[i] + " ")
    }
    i = 1
    while (i < (string_length(first) + 1))
    {
        if (string_char_at(first, i) == string_char_at(last, i))
        {
            result += string_char_at(first, i)
            i++
            continue
        }
        else
            break
    }
    return result;
}

function _key_combo_pressed@gml_Object_obj_shell_Create_0(argument0, argument1) //gml_Script__key_combo_pressed@gml_Object_obj_shell_Create_0
{
    for (i = 0; i < array_length(argument0); i++)
    {
        if (!keyboard_check(argument0[i]))
            return 0;
    }
    if keyboard_check_pressed(argument1)
    {
        if (array_length(argument0) == 0)
        {
            if (keyboard_check(vk_shift) || keyboard_check(vk_control) || keyboard_check(vk_alt))
                return 0;
        }
        return 1;
    }
}

delayFrame = 0
delayFrames = 1
function _keyboard_check_delay@gml_Object_obj_shell_Create_0(argument0) //gml_Script__keyboard_check_delay@gml_Object_obj_shell_Create_0
{
    if keyboard_check_released(argument0)
    {
        delayFrame = 0
        delayFrames = 1
        return 0;
    }
    else if (!keyboard_check(argument0))
        return 0;
    delayFrame = ((delayFrame + 1) % delayFrames)
    if (delayFrame == 0)
        delayFrames = keyRepeatDelay
    if keyboard_check_pressed(argument0)
    {
        delayFrame = 0
        delayFrames = keyRepeatInitialDelay
        return 1;
    }
    else if (keyboard_check(argument0) && delayFrame == 0)
        return 1;
    return 0;
}

function _shell_properties_hash@gml_Object_obj_shell_Create_0() //gml_Script__shell_properties_hash@gml_Object_obj_shell_Create_0
{
    return md5_string_unicode(((((((((((((((string(width) + "~") + string(height)) + "~") + string(anchorMargin)) + "~") + string(consolePaddingH)) + "~") + string(scrollbarWidth)) + "~") + string(consolePaddingV)) + "~") + string(screenAnchorPointH)) + "~") + string(screenAnchorPointV)));
}

function _recalculate_shell_properties@gml_Object_obj_shell_Create_0() //gml_Script__recalculate_shell_properties@gml_Object_obj_shell_Create_0
{
    var screenCenterX = (display_get_gui_width() / 2)
    var screenCenterY = (display_get_gui_height() / 2)
    draw_set_font(consoleFont)
    var emHeight = string_height("M")
    var maxWidth = (display_get_gui_width() - (anchorMargin * 2))
    var maxHeight = (display_get_gui_height() - (anchorMargin * 2))
    width = clamp(width, 50, maxWidth)
    height = clamp(height, emHeight, maxHeight)
    var halfWidth = (width / 2)
    var halfHeight = (height / 2)
    switch screenAnchorPointH
    {
        case "left":
            shellOriginX = (anchorMargin - 1)
            break
        case "center":
            shellOriginX = ((screenCenterX - halfWidth) - 1)
            break
        case "right":
            shellOriginX = (((display_get_gui_width() - width) - anchorMargin) - 1)
            break
    }

    switch screenAnchorPointV
    {
        case "top":
            shellOriginY = (anchorMargin - 1)
            break
        case "middle":
            shellOriginY = ((screenCenterY - halfHeight) - 1)
            break
        case "bottom":
            shellOriginY = (((display_get_gui_height() - height) - anchorMargin) - 1)
            break
    }

    visibleWidth = (((width - (2 * anchorMargin)) - scrollbarWidth) - (2 * consolePaddingH))
    visibleHeight = (height - (2 * consolePaddingV))
    shellPropertiesHash = self.self._shell_properties_hash()
}

function _calculate_scroll_from_suggestion_index@gml_Object_obj_shell_Create_0() //gml_Script__calculate_scroll_from_suggestion_index@gml_Object_obj_shell_Create_0
{
    if (suggestionIndex == 0)
        autocompleteScrollPosition = 0
    else if (suggestionIndex >= (autocompleteScrollPosition + autocompleteMaxLines))
        autocompleteScrollPosition = max(0, ((suggestionIndex - autocompleteMaxLines) + 1))
    else if (suggestionIndex < autocompleteScrollPosition)
        autocompleteScrollPosition -= suggestionIndex
}

function _confirm_current_suggestion@gml_Object_obj_shell_Create_0() //gml_Script__confirm_current_suggestion@gml_Object_obj_shell_Create_0
{
    spaceCount = string_count(" ", consoleString)
    consoleString = ""
    for (i = 0; i < spaceCount; i++)
        consoleString += (inputArray[i] + " ")
    consoleString += (filteredSuggestions[suggestionIndex] + " ")
    cursorPos = (string_length(consoleString) + 1)
}

function _confirm_current_mouse_argument_data@gml_Object_obj_shell_Create_0() //gml_Script__confirm_current_mouse_argument_data@gml_Object_obj_shell_Create_0
{
    if (activeMouseArgValue != "")
    {
        consoleString += (string(activeMouseArgValue) + " ")
        cursorPos = (string_length(consoleString) + 1)
    }
}

function _execute_script@gml_Object_obj_shell_Create_0(argument0, argument1) //gml_Script__execute_script@gml_Object_obj_shell_Create_0
{
    if (argument1 == undefined)
        argument1 = 0
    var script = variable_global_get(("sh_" + argument0[0]))
    if (!is_undefined(script))
    {
        @@try_hook@@(7000, 7172)
        var response = script_execute(asset_get_index(script_get_name(script)), argument0)
        @@try_unhook@@()
        if (!argument1)
        {
            array_push(history, consoleString)
            if (response != "")
                array_push(output, (">" + consoleString))
        }
        if is_string(response)
            array_push(output, response)
        self.self._update_positions()
    }
    else
    {
        array_push(output, (">" + consoleString))
        array_push(output, ("No such command: " + consoleString))
        array_push(history, consoleString)
        isOpen = 1
        self.self._update_positions()
    }
}

function _update_positions@gml_Object_obj_shell_Create_0() //gml_Script__update_positions@gml_Object_obj_shell_Create_0
{
    historyPos = array_length(history)
    consoleString = ""
    savedConsoleString = ""
    cursorPos = 1
}

function _save_history@gml_Object_obj_shell_Create_0() //gml_Script__save_history@gml_Object_obj_shell_Create_0
{
    var truncatedHistory = []
    var truncatedOutput = []
    array_copy(truncatedHistory, 0, history, max(0, (array_length(history) - savedHistoryMaxSize)), min(array_length(history), savedHistoryMaxSize))
    array_copy(truncatedOutput, 0, output, max(0, (array_length(output) - savedHistoryMaxSize)), min(array_length(output), savedHistoryMaxSize))
    var toSave = 
    {
        history: truncatedHistory,
        output: truncatedOutput
    }

    var openFile = file_text_open_write(savedHistoryFilePath)
    file_text_write_string(openFile, json_stringify(toSave))
    file_text_close(openFile)
}

function _load_history@gml_Object_obj_shell_Create_0() //gml_Script__load_history@gml_Object_obj_shell_Create_0
{
    var saveDataFile = file_find_first(savedHistoryFilePath, 16)
    if (saveDataFile != "")
    {
        openFile = file_text_open_read(savedHistoryFilePath)
        var tempData = json_parse(file_text_read_string(openFile))
        file_text_close(openFile)
        history = tempData.history
        output = tempData.output
        historyPos = array_length(history)
    }
    file_find_close()
}

function _input_string_split@gml_Object_obj_shell_Create_0(argument0) //gml_Script__input_string_split@gml_Object_obj_shell_Create_0
{
    var slot = 0
    var splits = []
    var str2 = ""
    var inQuotes = 0
    for (i = 1; i < (string_length(argument0) + 1); i++)
    {
        var currStr = string_char_at(argument0, i)
        if (!inQuotes)
        {
            if (currStr == "\"")
                inQuotes = 1
            else if (currStr == " ")
            {
                if (str2 != "")
                {
                    splits[slot] = str2
                    slot++
                }
                str2 = ""
            }
            else
            {
                str2 = (str2 + currStr)
                splits[slot] = str2
            }
        }
        else if (currStr == "\"")
        {
            inQuotes = 0
            splits[slot] = str2
        }
        else
            str2 = (str2 + currStr)
    }
    if (str2 == "" || inQuotes)
        splits[slot] = str2
    return splits;
}

function _array_contains@gml_Object_obj_shell_Create_0(argument0, argument1) //gml_Script__array_contains@gml_Object_obj_shell_Create_0
{
    for (i = 0; i < array_length(argument0); i++)
    {
        if (argument0[i] == argument1)
            return 1;
    }
    return 0;
}

function _remap@gml_Object_obj_shell_Create_0(argument0, argument1, argument2, argument3, argument4) //gml_Script__remap@gml_Object_obj_shell_Create_0
{
    var _t = ((argument0 - argument1) / (argument2 - argument1))
    return lerp(argument3, argument4, _t);
}

scr_wc_create()
function draw_console_text@gml_Object_obj_shell_Create_0(argument0, argument1, argument2, argument3, argument4) //gml_Script_draw_console_text@gml_Object_obj_shell_Create_0
{
    if (selection_left != -4 && selection_right != -4)
    {
        var prefix = string_get_substring(argument2, 1, selection_left)
        var selection = string_get_substring(argument2, selection_left, (selection_left - selection_right))
        var suffix = string_get_substring(argument2, selection_right)
        var prefix_width = string_width(prefix)
        var selection_width = string_width(selection)
        var suffix_width = string_width(suffix)
        var font_height = string_height(selection_width)
        draw_text(argument0, argument1, prefix)
        var beforeColor = draw_get_color()
        draw_set_color(make_color_rgb(5, 98, 209))
        draw_rectangle((argument0 + prefix_width), argument1, ((argument0 + prefix_width) + selection_width), (argument1 + font_height), false)
        draw_set_color(beforeColor)
        draw_text((argument0 + prefix_width), argument1, selection)
        draw_text(((argument0 + prefix_width) + selection_width), argument1, suffix)
    }
    else
        draw_text(argument0, argument1, argument2)
}

