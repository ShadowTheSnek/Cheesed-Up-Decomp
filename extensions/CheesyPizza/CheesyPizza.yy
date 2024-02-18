{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "CheesyPizza",
  "androidactivityinject": "",
  "androidclassname": "",
  "androidcodeinjection": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidPermissions": [],
  "androidProps": false,
  "androidsourcedir": "",
  "author": "",
  "classname": "",
  "copyToTargets": -1,
  "date": "2024-02-17T23:02:06.4547952+01:00",
  "description": "",
  "exportToGame": true,
  "extensionVersion": "",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[],"copyToTargets":-1,"filename":"","final":"fmod_destroy","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"launch_external","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"launchExternal","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"test_dll_linkage","argCount":0,"args":[],"documentation":"","externalName":"testLinkage","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_init","argCount":0,"args":[],"documentation":"","externalName":"FMOD_Init","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_update","argCount":0,"args":[],"documentation":"","externalName":"FMOD_Update","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_destroy","argCount":0,"args":[],"documentation":"","externalName":"FMOD_Destroy","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_set_parameter","argCount":3,"args":[
            1,
            2,
            2,
          ],"documentation":"","externalName":"FMOD_SetParameter","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_get_parameter","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_GetParameter","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_bank_load","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_Bank_Load","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_bank_load_sample_data","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_Bank_LoadSampleData","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_create_instance","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_EventDescription_CreateInstance","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_release","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventDescription_ReleaseInstance","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_get_instance_count","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_EventDescription_GetInstanceCount","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_one_shot","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_EventInstance_Play_OneShot","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_stop","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_Stop","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_play","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_Start","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_timeline_pos","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_SetTimelinePosition","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_get_timeline_pos","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_GetTimelinePosition","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_paused","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_SetPaused","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_get_paused","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_GetPaused","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_pitch","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_SetPitch","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_get_pitch","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_GetPitch","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_get_playback_state","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_GetPlaybackState","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_one_shot_3d","argCount":3,"args":[
            1,
            2,
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_Play_OneShot_3D","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_3d_attributes","argCount":3,"args":[
            2,
            2,
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_Set3DAttributes","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_parameter","argCount":4,"args":[
            2,
            1,
            2,
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_SetParameterByName","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_get_parameter","argCount":2,"args":[
            2,
            1,
          ],"documentation":"","externalName":"FMOD_EventInstance_GetParameterByName","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_get_length","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_EventDescription_GetLength","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_set_num_listeners","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_SetNumListeners","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_get_num_listeners","argCount":0,"args":[],"documentation":"","externalName":"FMOD_GetNumListeners","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_paused_all","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_SetPausedAll","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_set_listener_attributes","argCount":3,"args":[
            2,
            2,
            2,
          ],"documentation":"","externalName":"FMOD_SetListenerAttributes","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_paused_all_exclude","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_SetPausedAllExclude","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_get_path","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_Get_Path","help":"","hidden":false,"kind":1,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_get_user_property","argCount":2,"args":[
            2,
            1,
          ],"documentation":"","externalName":"FMOD_EventInstance_Get_UserProperty","help":"","hidden":false,"kind":1,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_bank_get_event_count","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_Bank_GetEventCount","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_bank_get_event_at_index","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"FMOD_Bank_GetEventAtIndex","help":"","hidden":false,"kind":1,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_get_user_property","argCount":2,"args":[
            1,
            1,
          ],"documentation":"","externalName":"FMOD_EventDescription_GetUserProperty","help":"","hidden":false,"kind":1,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_get_index","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_EventInstance_Get_Index","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"RegisterCallbacks","argCount":4,"args":[
            1,
            1,
            1,
            1,
          ],"documentation":"","externalName":"RegisterCallbacks","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_soundtest_get_events","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_Soundtest_GetEvents","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_soundtest_get_song_name","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_Soundtest_SongName","help":"","hidden":false,"kind":1,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_soundtest_get_song_category","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_Soundtest_SongCategory","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_soundtest_get_song_event","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_Soundtest_SongEvent","help":"","hidden":false,"kind":1,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_soundtest_get_song_index","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_Soundtest_SongIndex","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"folder_destroy","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"folderDestroy","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"folder_move","argCount":2,"args":[
            1,
            1,
          ],"documentation":"","externalName":"folderMove","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"image_get_width","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"imageWidth","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"image_get_height","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"imageHeight","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_show","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"bringWindowToFront","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"image_get_frame_count","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"gifFrameCount","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_soundtest_get_song_alt","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_Soundtest_SongAlt","help":"","hidden":false,"kind":1,"returnType":2,},
      ],"init":"fmod_init","kind":1,"order":[],"origname":"","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject": "",
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "HTML5CodeInjection": "",
  "html5Props": false,
  "IncludedResources": [],
  "installdir": "",
  "iosCocoaPodDependencies": "",
  "iosCocoaPods": "",
  "ioscodeinjection": "",
  "iosdelegatename": "",
  "iosplistinject": "",
  "iosProps": false,
  "iosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "license": "",
  "maccompilerflags": "",
  "maclinkerflags": "",
  "macsourcedir": "",
  "options": [],
  "optionsFile": "options.json",
  "packageId": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
  "productId": "",
  "sourcedir": "",
  "supportedTargets": -1,
  "tvosclassname": null,
  "tvosCocoaPodDependencies": "",
  "tvosCocoaPods": "",
  "tvoscodeinjection": "",
  "tvosdelegatename": null,
  "tvosmaccompilerflags": "",
  "tvosmaclinkerflags": "",
  "tvosplistinject": "",
  "tvosProps": false,
  "tvosSystemFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
}