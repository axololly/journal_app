import 'package:flutter/material.dart';
import 'app.dart';
import 'package:window_manager/window_manager.dart';
import 'loader.dart';

void main() async {
  // Setup
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  // Preparing the window manager
  await windowManager.waitUntilReadyToShow()
    .then((_) async {
      // Hide the title bar
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden);

      // This will appear in Task Manager instead of the title bar.
      await windowManager.setTitle("Melon Slice");

      // Finally, show the app window.
      await windowManager.show();
    }
  );

  // Load the journal entries
  Loader.init();

  print("${Loader.entries}");
  
  // Run the app
  runApp(const App());
}