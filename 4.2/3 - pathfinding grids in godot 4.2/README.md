# Pathfinding grids with AStarGrid2D

This project corresponds to [Easy Pathfinding Grids in Godot 4.2](https://youtu.be/OMrDS0zlr-k)

## Topics covered

- [AStarGrid2D](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html), [Custom Data Layers](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html)

## Notes

- The `AStarGrid2D` node is a very useful node for pathfinding in 2D. It is a wrapper around the `AStar` node, which is a generic pathfinding node. The `AStarGrid2D` node is a grid-based pathfinding node, which means that it is very efficient for pathfinding in a grid. It is also very easy to use, as it only requires a grid map and a tileset to work.
- While this is similar to my other video: https://www.youtube.com/watch?v=ztX4OV6Syn8, it manages the pathfinding in a totally different way. Instead of using a navigation agent, it uses the AStarGrid2D for more precise pathfinding and exact tile movement.

## Credits

- Tileset: Trixie's [Desert Ruins](https://trixelized.itch.io/desert-ruins)
- This very good [reference project](https://github.com/godotengine/godot-demo-projects/tree/4.0/2d/navigation_astar) from the Godot Engine contributors