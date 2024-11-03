import 'package:flutter/material.dart';
import 'package:open_todo/styles.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.check),
          label: 'To do',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.trending_up_rounded),
          label: 'Habits',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.note_outlined),
          label: 'Notes',
        ),
      ],
      selectedItemColor: kPrimaryColor,
    );
  }
}