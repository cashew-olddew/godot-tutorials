# Add Undo and Redo to Your Game

This project corresponds to [The EASIEST way to add Undo and Redo in Godot 4.2](https://www.youtube.com/watch?v=ZTDTRz-TV3U)

## Topics covered

- [UndoRedo](https://docs.godotengine.org/en/stable/classes/class_undoredo.html#class-undoredo-method-add-undo-method)
- [Line2D](https://docs.godotengine.org/en/stable/classes/class_line2d.html)
- [Input Events](https://docs.godotengine.org/en/stable/tutorials/best_practices/godot_notifications.html#process-vs-physics-process-vs-input)

## Notes

In this tutorial we are taking a look at what Godot 4.2 offers in term of functionalities for easy implementation of Do, Undo and Redo behavior. In order to showcase this, I have created a small canvas which makes use of Line2D nodes in order to make drawings on it.

add_do_reference also registers a reference for "do" that will be erased if the "do" history is lost.

At 14:44 I say 'when we undo the methods they happen in the reverse order'. What should I have said to make it more clear is 'when we undo the methods _we want them_ to happen in the reverse order'. This is because undo functions are called in the order they are added, thus, having the potential to break functionality if we are not careful with this.

## Credits

- [Buttons](https://uxwing.com/)