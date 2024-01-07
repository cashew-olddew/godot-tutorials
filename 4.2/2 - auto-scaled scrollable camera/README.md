# Auto-scaled scrollable camera

This project corresponds to [Automatically zoom camera to a Tilemap in Godot 4.2](https://youtu.be/sSojoDM-0Ps)

## Topics covered

- [Camera2D](https://docs.godotengine.org/en/stable/classes/class_camera2d.html), [Camera Limits](https://docs.godotengine.org/en/stable/classes/class_camera2d.html#class-camera2d-method-set-limit), [Camera Zoom](https://docs.godotengine.org/en/stable/classes/class_camera2d.html#class-camera2d-property-zoom),[Tilemaps](https://docs.godotengine.org/en/stable/classes/class_tilemap.html)

## Notes

- While a lerp function following an inverse exponential could be beneficial, it only adds to the complexity of the tutorial. If, however, you want to learn more about it, check [this great blogpost](https://www.gamedeveloper.com/programming/improved-lerp-smoothing-) by Scott Lembcke
- There is a simpler way of applying a specific zoom level instead of clamping to a zoom value like shown in the video. For example, one could simply export a Vector2i which would take the desired size in tiles on both axes. Then, in the `get_camera_zoom_to_tilemap()` function, one could choose to use the tilemap size or the specified size like this:
```gdscript
@export var initial_size_in_tiles = Vector2i.ZERO
...
func get_camera_zoom_to_tilemap():
...
var level_size = Vector2i.ZERO
var tilemap_info = get_tilemap_info()
if initial_size_in_tiles != Vector2i.ZERO:
  level_size = initial_size_in_tiles * tilemap_info.tile_size
else:
  level_size = Vector2i(tilemap_info.size *tilemap_info.tile_size)
```

## Credits

- Tileset: Schwarnhild's [basic tileset and asset pack](https://schwarnhild.itch.io/basic-tileset-and-asset-pack-32x32-pixels)
