import 'package:flutter/material.dart';
import 'package:journal_app/pallete.dart';
import 'loader.dart';

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
        color: Pallete.watermelonDarkGreen,
        child: ListView(
          children: Loader.entries
            .map((details) => JournalCard(details: details))
            .toList()
          )
      )
    );
  }
}

class JournalCard extends StatelessWidget {
  final JournalEntryDetails details;
  
  const JournalCard({required this.details, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print("Journal Card was clicked!");
      },

      style: ElevatedButton.styleFrom(
        
      ),

      child: SizedBox(
        width: 406,
        height: 118,

        child: Column(
          children: [
            Text("${details.dateWrittenFor.day}/${details.dateWrittenFor.month}/${details.dateWrittenFor.year}"),
            Text("(${details.content})")
          ]
        ),
      ),
    );
  }
}