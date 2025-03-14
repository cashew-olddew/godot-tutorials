# Add Smooth Progress Bars for Godot Scene Transitions

This project corresponds to [Add Smooth Progress Bars for Godot Scene Transitions](https://www.youtube.com/watch?v=-yXkZNx8avk) and [Add Smooth Progress Bars for Godot Scene Transitions (AUDIO FIX REUPLOAD)](https://www.youtube.com/watch?v=Uz_yxiP13oI)

## Topics covered

- [ResourceLoader](https://docs.godotengine.org/en/stable/classes/class_resourceloader.html)
- [ProgressBar](https://docs.godotengine.org/en/stable/classes/class_progressbar.html)
- [Control Nodes](https://docs.godotengine.org/en/stable/classes/class_control.html#class-control)

## Notes

While transitioning from one scene to another is pretty simple, doing it smoothly in the background is a bit more complex. 

In this video, we look at some quirks the ResourceLoader has. Instead of directly loading and swapping the scene, we tell the ResourceLoader to make a load request, and then we keep asking the ResourceLoader if the process has finished or not. The wonderful side effect of this is that we actually get the loading progress, and we can use that to give some feedback to the user while he waits for the next scene.

## Credits
- [Kenny's UI Pack](https://kenney.nl/assets/ui-pack-pixel-adventure)
