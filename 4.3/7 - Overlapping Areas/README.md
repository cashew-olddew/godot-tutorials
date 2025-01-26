# Why Overlaps Break Click Detection in Godot (and How You Can Fix It)

This project corresponds to [Why Overlaps Break Click Detection in Godot (and How You Can Fix It)](https://youtu.be/pk3tkcHZi2g)

## Topics covered

- [Mouse filter property](https://docs.godotengine.org/en/stable/classes/class_control.html#class-control-property-mouse-filter)
- [The intersect point function](https://docs.godotengine.org/en/stable/classes/class_physicsdirectspacestate2d.html#class-physicsdirectspacestate2d-method-intersect-point)

## Notes

In this video we are taking a look at how to have a click event no propagate through multiple overlapping areas. While, at first, this might seem like a simple task, you'd quickly notice a nasty issue: clicking on an area emits the input event of all areas underneath that area. We explore how to fix this issue with control nodes and with intersecting points.
