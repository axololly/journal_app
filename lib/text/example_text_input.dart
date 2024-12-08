import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:google_fonts/google_fonts.dart';

DefaultStyles retrieveCustomStyles() {
  return DefaultStyles(
    h1: DefaultTextBlockStyle(
      GoogleFonts.inter(
        fontSize: 24,
        color: Colors.deepOrange.shade700,
      ),
      const HorizontalSpacing(0, 0),
      const VerticalSpacing(0, 0),
      const VerticalSpacing(0.0, 5.0),
      const BoxDecoration()
    ),

    h2: DefaultTextBlockStyle(
      GoogleFonts.inter(
        fontSize: 18,
        color: Colors.deepOrange.shade600,
      ),
      
      const HorizontalSpacing(0, 0),
      const VerticalSpacing(0, 0),
      const VerticalSpacing(0.0, 5.0),
      const BoxDecoration()
    ),

    h3: DefaultTextBlockStyle(
      GoogleFonts.inter(
        fontSize: 16,
        color: Colors.deepOrange.shade500,
      ),
      
      const HorizontalSpacing(0, 0),
      const VerticalSpacing(0, 0),
      const VerticalSpacing(0.0, 5.0),
      const BoxDecoration()
    ),

    h4: DefaultTextBlockStyle(
      GoogleFonts.inter(
        fontSize: 14,
        color: Colors.deepOrange.shade400
      ),
      
      const HorizontalSpacing(0, 0),
      const VerticalSpacing(0, 0),
      const VerticalSpacing(0.0, 5.0),
      const BoxDecoration()
    ),

    h5: DefaultTextBlockStyle(
      GoogleFonts.inter(
        fontSize: 12,
        color: Colors.deepOrange.shade300
      ),
      
      const HorizontalSpacing(0, 0),
      const VerticalSpacing(0, 0),
      const VerticalSpacing(0.0, 5.0),
      const BoxDecoration()
    ),

    h6: DefaultTextBlockStyle(
      GoogleFonts.inter(
        fontSize: 10,
        color: Colors.deepOrange.shade300
      ),
      
      const HorizontalSpacing(0, 0),
      const VerticalSpacing(0, 0),
      const VerticalSpacing(0.0, 5.0),
      const BoxDecoration()
    ),

    paragraph: DefaultTextBlockStyle(
      GoogleFonts.inter(
        fontSize: 14,
        color: const Color(0xFFF4FDFF),
      ),
      
      const HorizontalSpacing(0, 0),
      const VerticalSpacing(0, 0),
      const VerticalSpacing(0.0, 1.0),
      const BoxDecoration()
    ),

    bold: GoogleFonts.inter(
      color: Colors.deepOrange.shade600,
      fontSize: 14,
      fontWeight: FontWeight.bold
    ),
  );
}

class TextInput extends StatelessWidget {
  const TextInput({super.key});
  
  @override
  Widget build(BuildContext context) {
    var background = const Color(0xFF0C0C0C);

    var widthPadding = 400.0;
    var heightPadding = 150.0;

    var configs = QuillEditorConfigurations(
      customStyles: retrieveCustomStyles()
    );
    
    return Container(
      // Making the width and height massive forces
      // the text field to be fully expanded.
      width: 10000,
      height: 10000,
      margin: EdgeInsets.fromLTRB(widthPadding, heightPadding, 0, 0),

      color: background,
      child: Container(
    padding: const EdgeInsets.all(20),
    child: QuillEditor.basic(
      controller: QuillController.basic(),
      configurations: configs,
    )
      )
    );
  }
}