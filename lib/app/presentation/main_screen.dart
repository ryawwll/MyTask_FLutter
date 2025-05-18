import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lapanganku/app/core/appColors.dart';
import 'package:lapanganku/app/presentation/answer_page.dart';
import 'package:lapanganku/app/presentation/profil_screen.dart';
import 'package:lapanganku/app/presentation/task_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List screen = [
    const TaskScreen(),
    const AnswerPage(),
    const ProfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color(0xFF9E9E9E),
        selectedItemColor: Appcolors.basicColor,
        currentIndex: _currentIndex,  
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.task),
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.assignment),
            label: 'Answer',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
