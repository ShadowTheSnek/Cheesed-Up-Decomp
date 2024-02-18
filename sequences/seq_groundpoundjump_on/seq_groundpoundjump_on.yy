{
  "resourceType": "GMSequence",
  "resourceVersion": "1.4",
  "name": "seq_groundpoundjump_on",
  "autoRecord": true,
  "backdropHeight": 768,
  "backdropImageOpacity": 0.5,
  "backdropImagePath": "",
  "backdropWidth": 1366,
  "backdropXOffset": 0.0,
  "backdropYOffset": 0.0,
  "events": {
    "resourceType": "KeyframeStore<MessageEventKeyframe>",
    "resourceVersion": "1.0",
    "Keyframes": [],
  },
  "eventStubScript": {
    "name": "scr_sequence_events",
    "path": "scripts/scr_sequence_events/scr_sequence_events.yy",
  },
  "eventToFunction": {
    "0": "",
    "1": "",
    "2": "seq_stop_freefall_sound",
    "3": "",
    "4": "",
    "5": "",
    "6": "",
  },
  "length": 236.0,
  "lockOrigin": false,
  "moments": {
    "resourceType": "KeyframeStore<MomentsEventKeyframe>",
    "resourceVersion": "1.0",
    "Keyframes": [
      {"resourceType":"Keyframe<MomentsEventKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"MomentsEventKeyframe","resourceVersion":"1.0","Events":[
              "seq_jump_sound",
            ],},},"Disabled":false,"id":"58e814fc-a40a-4377-b0cf-7967e74e2ec2","IsCreationKey":false,"Key":32.0,"Length":1.0,"Stretch":false,},
      {"resourceType":"Keyframe<MomentsEventKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"MomentsEventKeyframe","resourceVersion":"1.0","Events":[
              "seq_freefall_sound",
            ],},},"Disabled":false,"id":"47832309-ef38-4ef5-9891-58995a47f633","IsCreationKey":false,"Key":57.0,"Length":1.0,"Stretch":false,},
      {"resourceType":"Keyframe<MomentsEventKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"MomentsEventKeyframe","resourceVersion":"1.0","Events":[
              "seq_groundpound_sound",
            ],},},"Disabled":false,"id":"be2896d6-3c7a-4b19-8913-2dc679acadda","IsCreationKey":false,"Key":94.0,"Length":1.0,"Stretch":false,},
      {"resourceType":"Keyframe<MomentsEventKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"MomentsEventKeyframe","resourceVersion":"1.0","Events":[
              "seq_jump_sound",
            ],},},"Disabled":false,"id":"2b17d6ed-a724-4afe-92fd-eebdc589e1b7","IsCreationKey":false,"Key":105.0,"Length":1.0,"Stretch":false,},
      {"resourceType":"Keyframe<MomentsEventKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"MomentsEventKeyframe","resourceVersion":"1.0","Events":[
              "seq_step_sound",
            ],},},"Disabled":false,"id":"f4e06dea-8e26-4bed-8cd3-293fba3b6ee7","IsCreationKey":false,"Key":161.0,"Length":1.0,"Stretch":false,},
    ],
  },
  "parent": {
    "name": "Sequences",
    "path": "folders/Sequences.yy",
  },
  "playback": 1,
  "playbackSpeed": 60.0,
  "playbackSpeedType": 0,
  "showBackdrop": true,
  "showBackdropImage": false,
  "spriteId": null,
  "timeUnits": 1,
  "tracks": [],
  "visibleRange": null,
  "volume": 1.0,
  "xorigin": -192,
  "yorigin": -108,
}