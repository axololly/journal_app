import 'package:flutter/material.dart';
import 'app.dart';
import 'package:window_manager/window_manager.dart';

/*
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(const App());

  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(600, 450);

    win.minSize = initialSize;
    win.size = initialSize;
    
    win.alignment = Alignment.center;
    
    win.show();
  });
}
*/

void main() async {
  // Setup
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  await windowManager
    .waitUntilReadyToShow()
    .then((_) async {
      // Hide the title bar
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden);

      // This will appear in Task Manager instead of the title bar.
      await windowManager.setTitle("Melon Slice");

      // Finally, show the app window.
      await windowManager.show();
    }
  );
  
  runApp(const App());
}