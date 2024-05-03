import 'package:doctor_appoinment_booking/features/homePage/ui/homePage.dart';
import 'package:flutter/material.dart';

import '../searchPage/ui/searchPage.dart';

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  final List tabs = [
    HomePage(),
    SearchPage(),
    HomePage(),
    HomePage(),
  ];
 var isSelect = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
bottomNavigationBar: NavigationBar(
  selectedIndex: isSelect,
  onDestinationSelected: (value){
    setState(() {
      isSelect = value;
    });
  },
  destinations: const [
    NavigationDestination(icon: Icon(Icons.home),
        label: ""),
    NavigationDestination(icon: Icon(Icons.search_outlined),
        label: ""),
    NavigationDestination(icon: Icon(Icons.schedule),
        label: ""),
    NavigationDestination(icon: Icon(Icons.person),
        label: ""),
  ],
backgroundColor: Colors.blue.withOpacity(0.4),
  indicatorColor: Colors.deepPurple.withOpacity(0.4),
  indicatorShape: null,
),
      body: tabs[isSelect],
    );
  }
}
