# Localization

This project corresponds to [NEVER Struggle with Bugs Again in 5 Steps! Godot Guide!](https://www.youtube.com/watch?v=E1wJp2PWV6k)

## Topics covered

- [Godot Debugging Tools](https://docs.godotengine.org/en/stable/tutorials/scripting/debug/overview_of_debugging_tools.html)
- [Visual Debugging](https://www.youtube.com/watch?v=yUa1WxSXprI)
- [More Visual Debugging](https://docs.godotengine.org/en/stable/tutorials/2d/custom_drawing_in_2d.html)
- [Godot Documentation](https://docs.godotengine.org/en/stable/index.html)
- [Godot Issues and Bug Report](https://github.com/godotengine/godot)
- [Godot Proposals](https://github.com/godotengine/godot-proposals)

## Notes

- Making video games is a very enjoyable and fulfilling experience. However, bugs can stall your progress, making the whole process frustrating. Knowing how to fix those issues will many times be the key difference between a finished game and an abandoned project.

## Transcript

Have you ever encountered a nasty bug that didn't let you work on your dream game? It's easy to get demotivated when your progress is being stalled by such blockers, and that is why knowing how to fix bugs quickly is such an important skill in your game developer journey. 

These are 5 things you can do to make sure you squash any bug.

1. Identify the bug directly in Godot
	This is one of the easiest approach and usually is enough to find most bugs. It is important to know the debug capabilities of Godot. You can use:
	- The console. This shows errors, helps you identify in which function a problem occurred and can be used in combination with print messages to easily get the actual values of your variables causing problems.
	- The Godot debugger. It is super powerful, allowing you to set breakpoints in your code to analyze bad functionality.  It allows you to move step by step or from breakpoint to breakpoint through the execution. Additionally, it shows the stack, which basically shows you the functions you called, and finally, and maybe most important, it shows you the actual values of the variables in your execution.
	- The remote viewer. This is especially helpful when you instance nodes on the fly. You can check it to see if the nodes are actually there at the moments you expect them to be.
	- Debug visually. Use functions like `draw_line`, `draw_circle` and [others](https://docs.godotengine.org/en/stable/tutorials/2d/custom_drawing_in_2d.html) to visualize more complex things like steering forces. If you're interested in this, I have a full video which explains visual debugging in detail.
2. Look for similar problems in tutorials, blog posts and forums
	If you are unable to find the bug yourself, you can look online to find people which had similar issues and what they did to fix them.
	If you don't fancy the video format, there are blog posts, repositories and discussions about certain bugs.
3. Check the Godot documentation
   If you don't manage to get a quick solution with the second step, there's no better place to get information than the official Godot documentation.
   In the documentation you'll be able to get precise, up to date and a deeper understanding of the concept you're working with. Additionally, if you use another version of Godot, you can always access the equivalent documentation for that specific version.
   Depending on your preference, you can find the documentation both online and directly in the Godot editor.
4. Isolate your problem in a new project
   Many times, a project can become like a giant entangled web of functionalities. Many of those depend on and influence each other. Having lots of components unrelated to the actual bug can slow down the debugging process a lot.
   For such cases try creating a new project or a new node in which you only add the piece of code that is causing problems. At first it might sound like you're doing more work by creating a new project, but it can save you hundreds of hours.
5. Submit an issue in the Godot Engine repository
   If everything fails, then your answers lie with the community. Submit an issue! Like, seriously, maybe the problem is not even your fault, maybe there's a bug in the engine or the feature you're looking for is not available.
   
   The [Godot](https://github.com/godotengine/godot) and [Godot-proposal](https://github.com/godotengine/godot-proposals) repositories issue submission is one of the best I've seen. 
   
   Remember step 4, isolating your problem? When submitting, after briefly describing the issue, one requirement is to add a minimal reproduction project.
   This is actually crucial, as most of the times, you don't even get to finish your submission. You write it down, you make your isolated project and you figure out that in that example, things behave differently. There have been many times in which I stopped mid-submission because I had found the issue in the new project.
   
   What happens, however, if you don't find your bug and submit an issue? The response time from the community collaborators has always been quite fast. What I noticed from my experience of submitting is that you always seem to land in one of this cases:
   1. You are actually wrong. The issue is not a bug, but a mistake on your end. In this case, people will point you in the right direction and there's a high chance you'll get a new plan for solving it.
   2. What you're trying to do is not possible, or it's simply not specific enough a problem for Godot to solve. Many times, however, there are going to be alternatives to your approach.
   3. You're actually right. There is an issue, and you should be proud with yourself for finding it and making Godot a better engine for everyone. The issue will get fixed in following patches and in the meantime, people will suggest temporary workarounds for until it gets fixed.

## Credits


- [Godot](https://godotengine.org/)