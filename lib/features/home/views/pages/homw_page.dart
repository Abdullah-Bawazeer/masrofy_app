import 'package:flutter/material.dart';
import 'package:masrofy_app/features/home/views/tabs/expenses_tab.dart';
import 'package:masrofy_app/features/home/views/tabs/home_tab.dart';
import 'package:masrofy_app/features/home/views/tabs/more_tab.dart';
import 'package:masrofy_app/features/home/views/tabs/reports_tab.dart';
import 'package:masrofy_app/features/home/views/widgets/home_bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentNavIndex = 0; // الرئيسية selected by default

  final List<Widget> _tabs = [
    HomeTab(),
    ReportsTab(),
    SizedBox.shrink(), // FAB Placeholder
    ExpensesTab(),
    MoreTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentNavIndex, children: _tabs),
      ),
      bottomNavigationBar: HomeBottomNavigation(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index;
          });
        },
      ),
    );
  }
}
