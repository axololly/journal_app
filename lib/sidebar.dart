import 'package:flutter/material.dart';
import 'package:journal_app/pallete.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {    
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 439),
      child: Container(
        color: Pallete.watermelonDarkGreen
      )
    );
  }
}