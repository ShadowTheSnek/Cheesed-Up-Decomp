scr_wc_step()
if saveHistory
{
    if (!loadedSavedHistory)
    {
        self.self._load_history()
        loadedSavedHistory = 1
    }
    else if ((!loadedHistoryScrolled) && isOpen)
    {
        targetScrollPosition = maxScrollPosition
        scrollPosition = maxScrollPosition
        loadedHistoryScrolled = 1
    }
}
if (!isOpen)
{
    if openModifiers.openModifiers._key_combo_pressed(openKey, self)
        self.self.open()
}
else
{
    var prevConsoleString = consoleString
    if (metaDeleted && keyboard_check_released(vk_backspace))
        metaDeleted = 0
    if (metaMovedLeft && keyboard_check_released(vk_left))
        metaMovedLeft = 0
    if (metaMovedRight && keyboard_check_released(vk_right))
        metaMovedRight = 0
    if keyboard_check_pressed(vk_escape)
    {
        if isAutocompleteOpen
            self.self._close_autocomplete()
        else
            self.self.close()
    }
    else if ([metaKey].[metaKey]._key_combo_pressed(65, self) || keyboard_check_pressed(vk_home))
    {
        cursorPos = 1
        targetScrollPosition = maxScrollPosition
    }
    else if ([metaKey].[metaKey]._key_combo_pressed(69, self) || keyboard_check_pressed(vk_end))
    {
        cursorPos = (string_length(consoleString) + 1)
        targetScrollPosition = maxScrollPosition
    }
    else if [metaKey].[metaKey]._key_combo_pressed(75, self)
    {
        var leftSide = string_copy(consoleString, 0, (cursorPos - 1))
        var rightSide = string_copy(consoleString, cursorPos, ((string_length(consoleString) - cursorPos) + 1))
        killedString = rightSide
        consoleString = leftSide
        cursorPos = (string_length(consoleString) + 1)
        targetScrollPosition = maxScrollPosition
    }
    else if [metaKey].[metaKey]._key_combo_pressed(89, self)
    {
        consoleString += killedString
        killedString = ""
        cursorPos = (string_length(consoleString) + 1)
        targetScrollPosition = maxScrollPosition
    }
    else if [metaKey].[metaKey]._key_combo_pressed(67, self)
    {
        array_push(output, ((">" + consoleString) + "^C"))
        consoleString = ""
        cursorPos = 1
        targetScrollPosition = maxScrollPosition
    }
    else if ([metaKey].[metaKey]._key_combo_pressed(8, self) || (metaKey == 17 && ord(keyboard_string) == 127))
    {
        var precedingSpaceIndex = 1
        var i = (cursorPos - 2)
        while (i > 1)
        {
            if (string_char_at(consoleString, i) == " ")
            {
                precedingSpaceIndex = i
                break
            }
            else
            {
                i--
                continue
            }
        }
        consoleString = string_delete(consoleString, precedingSpaceIndex, (cursorPos - precedingSpaceIndex))
        cursorPos = precedingSpaceIndex
        targetScrollPosition = maxScrollPosition
        keyboard_string = ""
        metaDeleted = 1
    }
    else if [metaKey].[metaKey]._key_combo_pressed(37, self)
    {
        precedingSpaceIndex = 1
        i = (cursorPos - 2)
        while (i > 1)
        {
            if (string_char_at(consoleString, i) == " ")
            {
                precedingSpaceIndex = i
                break
            }
            else
            {
                i--
                continue
            }
        }
        cursorPos = precedingSpaceIndex
        targetScrollPosition = maxScrollPosition
        metaMovedLeft = 1
    }
    else if [metaKey].[metaKey]._key_combo_pressed(39, self)
    {
        var nextSpaceIndex = (string_length(consoleString) + 1)
        i = (cursorPos + 2)
        while (i <= (string_length(consoleString) + 1))
        {
            if (string_char_at(consoleString, i) == " ")
            {
                nextSpaceIndex = i
                break
            }
            else
            {
                i++
                continue
            }
        }
        cursorPos = nextSpaceIndex
        targetScrollPosition = maxScrollPosition
        metaMovedRight = 1
    }
    else if 8.(8)._keyboard_check_delay(self)
    {
        if (!metaDeleted)
        {
            consoleString = string_delete(consoleString, (cursorPos - 1), 1)
            cursorPos = max(1, (cursorPos - 1))
            targetScrollPosition = maxScrollPosition
        }
    }
    else if 46.(46)._keyboard_check_delay(self)
    {
        consoleString = string_delete(consoleString, cursorPos, 1)
        targetScrollPosition = maxScrollPosition
    }
    else if 37.(37)._keyboard_check_delay(self)
    {
        if (!metaMovedLeft)
        {
            cursorPos = max(1, (cursorPos - 1))
            targetScrollPosition = maxScrollPosition
        }
    }
    else if 39.(39)._keyboard_check_delay(self)
    {
        if (!metaMovedRight)
        {
            if (cursorPos == (string_length(consoleString) + 1) && array_length(filteredSuggestions) != 0)
            {
                var suggestion = filteredSuggestions[suggestionIndex]
                var consoleWords = consoleString.consoleString._input_string_split(self)
                var currentWordLength = string_length(consoleWords[(array_length(consoleWords) - 1)])
                consoleString += string_copy(suggestion, (currentWordLength + 1), (string_length(suggestion) - currentWordLength))
                cursorPos = (string_length(consoleString) + 1)
            }
            else
                cursorPos = min((string_length(consoleString) + 1), (cursorPos + 1))
            targetScrollPosition = maxScrollPosition
        }
    }
    else if historyUpModifiers.historyUpModifiers._key_combo_pressed(historyUpKey, self)
    {
        if (historyPos == array_length(history))
            savedConsoleString = consoleString
        historyPos = max(0, (historyPos - 1))
        if (array_length(history) != 0)
        {
            consoleString = array_get(history, historyPos)
            cursorPos = (string_length(consoleString) + 1)
        }
        targetScrollPosition = maxScrollPosition
    }
    else if historyDownModifiers.historyDownModifiers._key_combo_pressed(historyDownKey, self)
    {
        if (historyPos < array_length(history))
        {
            historyPos = min(array_length(history), (historyPos + 1))
            if (historyPos == array_length(history))
                consoleString = savedConsoleString
            else
                consoleString = array_get(history, historyPos)
            cursorPos = (string_length(consoleString) + 1)
        }
        targetScrollPosition = maxScrollPosition
    }
    else if keyboard_check_pressed(vk_return)
    {
        if (string_trim(consoleString) != "")
        {
            var args = string_trim(consoleString).string_trim(consoleString)._input_string_split(self)
            if (array_length(args) > 0)
            {
                var metadata = variable_struct_get(functionData, array_get(args, 0))
                if (!is_undefined(metadata))
                {
                    var deferred = 0
                    if variable_struct_exists(metadata, "deferred")
                        deferred = metadata.deferred
                    if deferred
                    {
                        ds_queue_enqueue(deferredQueue, args)
                        array_push(history, consoleString)
                        array_push(output, (">" + consoleString))
                        array_push(output, "Execution deferred until shell is closed.")
                        self.self._update_positions()
                    }
                    else
                        self._execute_script(args)
                }
                else
                    self._execute_script(args)
            }
            else
            {
                array_push(output, ">")
                consoleString = ""
                savedConsoleString = ""
                cursorPos = 1
            }
        }
        else
        {
            array_push(output, ">")
            consoleString = ""
            savedConsoleString = ""
            cursorPos = 1
        }
        selection_left = -4
        selection_right = -4
        commandSubmitted = 1
    }
    else if cycleSuggestionsModifiers.cycleSuggestionsModifiers._key_combo_pressed(cycleSuggestionsKey, self)
    {
        if (array_length(filteredSuggestions) != 0)
        {
            var uncompleted = consoleString
            consoleString = self.self._find_common_prefix()
            cursorPos = (string_length(consoleString) + 1)
            if (uncompleted == consoleString)
            {
                suggestionIndex = ((suggestionIndex + 1) % array_length(filteredSuggestions))
                if isAutocompleteOpen
                    self.self._calculate_scroll_from_suggestion_index()
            }
        }
    }
    else if cycleSuggestionsReverseModifiers.cycleSuggestionsReverseModifiers._key_combo_pressed(cycleSuggestionsReverseKey, self)
    {
        if (array_length(filteredSuggestions) != 0)
        {
            suggestionIndex = (((suggestionIndex + array_length(filteredSuggestions)) - 1) % array_length(filteredSuggestions))
            if isAutocompleteOpen
                self.self._calculate_scroll_from_suggestion_index()
        }
    }
    else if keyboard_check_pressed(vk_insert)
        insertMode = (!insertMode)
    else if (keyboard_string != "")
    {
        var t = keyboard_string
        if (!insertMode)
            consoleString = string_delete(consoleString, cursorPos, string_length(t))
        consoleString = string_insert(t, consoleString, cursorPos)
        cursorPos += string_length(t)
        keyboard_string = ""
        targetScrollPosition = maxScrollPosition
    }
    if isAutocompleteOpen
    {
        var x1 = autocompleteOriginX
        var y1 = autocompleteOriginY
        var x2 = ((((x1 + autocompleteMaxWidth) + font_get_size(consoleFont)) + (autocompletePadding * 2)) - scrollbarWidth)
        var y2 = ((y1 + (string_height(prompt) * min(array_length(filteredSuggestions), autocompleteMaxLines))) + autocompletePadding)
        if point_in_rectangle(gml_Script_device_mouse_x_to_gui_hook(0), device_mouse_y_to_gui(0), x1, y1, x2, y2)
        {
            if mouse_wheel_down()
            {
                autocompleteScrollPosition++
                autocompleteScrollPosition = clamp((array_length(filteredSuggestions) - autocompleteMaxLines), 0, autocompleteScrollPosition)
            }
            if mouse_wheel_up()
            {
                autocompleteScrollPosition--
                autocompleteScrollPosition = max(autocompleteScrollPosition, 0)
            }
        }
        else if point_in_rectangle(gml_Script_device_mouse_x_to_gui_hook(0), device_mouse_y_to_gui(0), shellOriginX, shellOriginY, (shellOriginX + width), (shellOriginY + height))
        {
            if mouse_wheel_down()
                targetScrollPosition += scrollSpeed
            if mouse_wheel_up()
                targetScrollPosition -= scrollSpeed
        }
    }
    else if point_in_rectangle(gml_Script_device_mouse_x_to_gui_hook(0), device_mouse_y_to_gui(0), shellOriginX, shellOriginY, (shellOriginX + width), (shellOriginY + height))
    {
        if mouse_wheel_down()
            targetScrollPosition += scrollSpeed
        if mouse_wheel_up()
            targetScrollPosition -= scrollSpeed
    }
    var lerpValue = (scrollSmoothness == 0 ? 1 : scrollSmoothness.scrollSmoothness._remap(1, 0, 0.08, 0.4, self))
    scrollPosition = lerp(scrollPosition, targetScrollPosition, lerpValue)
    scrollPosition = clamp(scrollPosition, 0, maxScrollPosition)
    if (scrollPosition == 0 || scrollPosition == maxScrollPosition)
        targetScrollPosition = clamp(targetScrollPosition, 0, maxScrollPosition)
    if (consoleString != prevConsoleString)
    {
        self.self._update_filtered_suggestions()
        autocompleteScrollPosition = 0
    }
    if (self.self._shell_properties_hash() != shellPropertiesHash)
        self.self._recalculate_shell_properties()
}
if (!is_undefined(activeMouseArgType))
{
    if (activeMouseArgType == (0 << 0))
        activeMouseArgValue = gml_Script_mouse_x_hook()
    else if (activeMouseArgType == (1 << 0))
        activeMouseArgValue = gml_Script_mouse_y_hook()
    else if (activeMouseArgType == (2 << 0))
        activeMouseArgValue = gml_Script_device_mouse_x_to_gui_hook(0)
    else if (activeMouseArgType == (3 << 0))
        activeMouseArgValue = device_mouse_y_to_gui(0)
    else if (activeMouseArgType == (4 << 0))
    {
        var instAtCursor = instance_position(gml_Script_mouse_x_hook(), gml_Script_mouse_y_hook(), all)
        if (instAtCursor != noone)
            activeMouseArgValue = instAtCursor
        else
            activeMouseArgValue = ""
    }
    else if (activeMouseArgType == (5 << 0))
    {
        instAtCursor = instance_position(gml_Script_mouse_x_hook(), gml_Script_mouse_y_hook(), all)
        if (instAtCursor != noone)
            activeMouseArgValue = instAtCursor.object_index
        else
            activeMouseArgValue = ""
    }
}
