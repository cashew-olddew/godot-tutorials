# Pathfinding on a tilemap

This project corresponds to [Tilemap PATHFINDING in Godot 4.2](https://www.youtube.com/watch?v=ztX4OV6Syn8)

## Topics covered

- [Tilemaps](https://docs.godotengine.org/en/stable/tutorials/2d/using_tilemaps.html), [Tilesets](https://docs.godotengine.org/en/stable/tutorials/2d/using_tilesets.html), [Autotiling](https://docs.godotengine.org/en/stable/tutorials/2d/using_tilesets.html#creating-terrain-sets-autotiling)
- [NavigationRegion2D](https://docs.godotengine.org/en/stable/classes/class_navigationregion2d.html) area baking depending on tilemap collisions
- [NavigationAgent2D](https://docs.godotengine.org/en/stable/classes/class_navigationagent2d.html)

## Notes

- At the moment of creating this, the navigation area calculation based on the active collisions works only if those collisions are on the layer 0 of the tilemap. More information on this can be found in [this discussion](https://github.com/godotengine/godot/pull/80796)
    - Eventually, according to [this issue comment](https://github.com/godotengine/godot/pull/80796#issuecomment-1689234510), this will be changed.

## Credits

- The quick NavigationAgent2D script was inspired from Abra's [video](https://www.youtube.com/watch?v=AGHtw8__oqw)
- Soldier asset: Kenney [tower defense top down](https://www.kenney.nl/assets/tower-defense-top-down) pack
- Tileset: Schwarnhild's [basic tileset and asset pack](https://schwarnhild.itch.io/basic-tileset-and-asset-pack-32x32-pixels)

