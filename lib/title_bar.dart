import 'package:flutter/material.dart';
import 'package:journal_app/pallete.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Entire title bar
    return SizedBox(
      height: 45,

      child: Row(
        children: [
          // Expanded stretches the invisible container across the screen.
          Expanded(
            child: GestureDetector(
              // Content of the bar itself
              child: Container(
                color: Pallete.watermelonRed,
                height: 45,
                
                // Row of widgets representing the content on the title bar.
                // The Spacer pushes the invisible Text widget to the very end of the container.
                child: Row(
                  children: [
                    // Logo button
                    const LogoButton(),

                    const Spacer(),
                    
                    // Logo text
                    Text(
                      "Melon Slice",
                      style: GoogleFonts.lexend(
                        color: Pallete.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),

                    // Stretches the titlebar out
                    const Spacer(),
                    const Text("")
                  ]
                )
              ),
              
              // Dragging behaviour, like in regular windows
              onTapDown: (details) async => await WindowManager.instance.startDragging(),
            ),
          ),

          // Minimise button
          WindowButton(
            iconPath: "minimise.svg",
            onPressed: () async => await WindowManager.instance.minimize()
          ),

          // Maximise button
          WindowButton(
            iconPath: "maximise.svg",
            onPressed: () async => await WindowManager.instance.maximize()
          ),

          // Close button
          WindowButton(
            iconPath: "close.svg",
            onPressed: () async => await WindowManager.instance.destroy()
          ),
        ]
      ),
    );
  }
}

class LogoButton extends StatefulWidget {
  const LogoButton({super.key});

  @override
  State<StatefulWidget> createState() => _LogoButtonState();
}

class _LogoButtonState extends State<StatefulWidget> {
  late bool mouseHoveringOver = false;
  
  _LogoButtonState();
  
  @override
  Widget build(BuildContext context) {
    var icon = Image.asset('assets/logo.png');
    
    return SizedBox(
      width: 77,
      height: 45,

      child: ElevatedButton(
        onPressed: () {
          // The code in here will run when the logo is clicked.
          // Useful for including a context menu.
        },

        style: ElevatedButton.styleFrom(
          backgroundColor: Pallete.watermelonRed,
          foregroundColor: Pallete.white,
          shadowColor: Pallete.invisible,
          overlayColor: Pallete.invisible,
          
          shape: const RoundedRectangleBorder(),

          padding: const EdgeInsets.all(14)
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith<Color>(
            (states) => states.contains(WidgetState.hovered) ? Pallete.watermelonPink : Pallete.invisible
          ),
        ),

        child: icon
      ),
    );
  }
}

class WindowButton extends StatefulWidget {
  final String iconPath;
  final VoidCallback onPressed;
  
  const WindowButton({
    required this.iconPath,
    required this.onPressed,
    super.key
  });

  @override
  // ignore: no_logic_in_create_state
  State<WindowButton> createState() => _WindowButtonState(
    iconPath: iconPath,
    onPressed: onPressed
  );
}

class _WindowButtonState extends State<WindowButton> {
  final String iconPath;
  final VoidCallback onPressed;

  bool mouseHoveringOver = false;

  _WindowButtonState({
    required this.iconPath,
    required this.onPressed
  });
  
  @override
  Widget build(BuildContext context) {
    Widget icon = SvgPicture.asset('assets/$iconPath');

    return SizedBox(
      width: 48,
      height: 45,

      child: ElevatedButton(
        onPressed: onPressed,
        onHover: (mouseOver) => setState(() => mouseHoveringOver = mouseOver),

        style: ElevatedButton.styleFrom(
          backgroundColor: mouseHoveringOver
                         ? Pallete.watermelonPink
                         : Pallete.watermelonRed,
          
          shadowColor:     Pallete.invisible,
          
          // Border is by default 0, creating a square
          shape: const RoundedRectangleBorder(),

          // Makes the icons disappear if this isn't there
          // and I still don't know why.
          padding: const EdgeInsets.all(0.0)
        ),
        child: icon,
      ),
    );
  }
}