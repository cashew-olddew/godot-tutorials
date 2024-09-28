# The Ultimate Godot 4.3 Export, Demo and DLC Guide

This project corresponds to [The Ultimate Godot 4.3 Export, Demo and DLC Guide](https://www.youtube.com/watch?v=vv8Wyean9Ng)

## License Warning

Some of the assets here are modified assets from the Adobe Stock website that follow the Extended License. With the Extended license, one may:

- Reproduce copies of the asset in product packaging, printed marketing materials, digital documents, or software
- Include the asset in email marketing, mobile advertising, or a broadcast program.
- ~~Post the asset to a website. If the asset is posted unmodified to a social media site, attribution is required (© Author Name - stock.adobe.com).~~ (Not the case, as the assets are modified)
- Create merchandise or products for resale or distribution where the main value of the product is associated with the asset itself, such as a coffee mug or t-shirt.

Anything else falls under CC0 and you can use it however you want - mentions are appreciated, but not required.

## Cashew Clicker

[Play it on itch.io](https://olddews.itch.io/cashew-clicker)

## Topics covered

- [Rcedit](https://github.com/electron/rcedit/releases)
- [Wine](https://www.winehq.org/) (Use this for running Rcedit on a Mac/Linux device)
- Running Rcedit with Wine example - `wine rcedit.exe "your-game.exe" --set-icon "your-icon-file.ico"`
- [More Rcedit options](https://github.com/electron/rcedit?tab=readme-ov-file#docs)
- [Python](https://www.python.org/downloads/) (In the video I'm using 3.12.6, but you can use the most recent version)
- [OpenJDK](https://adoptium.net/temurin/releases/?variant=openjdk17)
- [JDK](https://www.oracle.com/java/technologies/downloads/) (In the video I'm using JDK 23)
- Environment Variables Run command - `sysdm.cpl`
- [Godot Exporting for Android docs](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_android.html)
- [Android SDK Command Line Tools](https://developer.android.com/studio#:~:text=Command%20line%20tools%20only)
- SDK Manager command - `sdkmanager --sdk_root=your_sdk_path "platform-tools" "build-tools;34.0.0" "platforms;android-34" "cmdline-tools;latest" "cmake;3.10.2.4988404" "ndk;23.2.8568313"`
- [Godot docs for customizing HTML Shell](https://docs.godotengine.org/en/stable/tutorials/platform/web/customizing_html5_shell.html)
- Java Keytool command for Android keystore - `keytool -v -genkey -keystore mygame.keystore -alias mygame -keyalg RSA -validity 10000`

## Notes

In this video I am trying to solve all questions that one might have when trying to export a game in Godot 4.3. As a start, I am covering the most basic way of exporting on Windows, Linux, Android, Web and Mac and afterwards I take a look over setting up a Demo and a DLC for your game. Finally, we take an in depth look at all the options for each environment.

You might wonder: Why the weird order? I wanted to include the most basic and interesting things first, and then, go over the options in depth for whoever is interested.
Please let me know if you have any question or issues, as I'm trying my best to answer all comments.

## Credits

Thanks [godotsimon](https://www.youtube.com/@godotsimon-nw3zk) for the cool approach to automatically load DLCs. Here's his take on the implementation for this: https://github.com/simonschreibt-code/godot_dlc_test