# stacked_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

official Stacked doc: https://stacked.filledstacks.com/docs/tooling/stacked-cli

How to get_started with this srikanthkoti

- clone this to a folder & open this in vs code
- do a global search for srikanthkoti & replace all with your_app_name

To Activate stacked cli

- dart pub global activate stacked_cli
- export PATH="$PATH":"$HOME/.pub-cache/bin"

to create a new app

- stacked create app my_app

to create a new view

- stacked create view login

To generate Code with flutter:

- flutter pub run build_runner build --delete-conflicting-outputs
  or you can run
- stacked generate

If you are opening only the "frontend" folder in VSCode, it might not be automatically recognizing the Git repository located at the root of the "profsy" folder, which is one level up. To make sure VSCode recognizes the Git changes, you can try the following steps:

1. Open VSCode and navigate to the "frontend" folder.
2. Open the Command Palette by pressing `Ctrl+Shift+P` (Windows/Linux) or `Cmd+Shift+P` (Mac).
3. Type "Git: Open Repository" in the Command Palette and select it.

Alternatively, you can try opening VSCode from the root "profsy" folder to ensure the entire repository is recognized:

1. Close VSCode if it's already open.
2. Use your file explorer (e.g., File Explorer on Windows, Finder on Mac) to navigate to the "profsy" folder.
3. Right-click on the "frontend" folder and select "Open with Code" or "Open with Visual Studio Code" (this option might vary slightly depending on your operating system).

By opening VSCode from the root "profsy" folder, it should automatically recognize the Git changes, and you'll be able to see the Git status and version control features in the VSCode interface.

If for some reason, it's still not working, you can check the following:

1. Ensure that the "frontend" folder is indeed a subfolder of the Git repository, i.e., the ".git" folder is present in the "profsy" folder.

2. Make sure that you have the Git extension installed in VSCode. You can search for "Git" in the Extensions sidebar and install the official Git extension provided by "vscode.git."

3. Confirm that you have the latest version of VSCode and Git installed on your machine.

4. If the issue persists, you can try running the "Git: Initialize Repository" command in VSCode (press `Ctrl+Shift+P` and type "Git: Initialize Repository") while inside the "frontend" folder. This will explicitly create a new Git repository within the "frontend" folder, which should ensure the Git integration works correctly.

Remember, it's essential to have the ".git" folder at the root of the repository, and opening VSCode from the root of the repository usually ensures proper recognition of Git changes.
