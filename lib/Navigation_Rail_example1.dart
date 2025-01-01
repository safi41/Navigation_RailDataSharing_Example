import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

                                 //ReadMe
//IN this Example data is shared between navigation class and other widgets functions using Parameters

class NavigationRailExample extends StatefulWidget {
  const NavigationRailExample({super.key});

  @override
  State<NavigationRailExample> createState() => _NavigationRailExampleState();
}

class _NavigationRailExampleState extends State<NavigationRailExample> {
  int _selectedIndex = 0;
  String email = 'Jadoon@gmail.com'; // Email to share with Page1
  String name = 'Khan'; // Name to share with Page2

  @override
  Widget build(BuildContext context) {
    Widget _buildSelectedPage() {
      if (_selectedIndex == 0) {
        return HomeScreen(email: email, name: name);
      } else if (_selectedIndex == 1) {
        return page1(name: name); // Send the name to Page1
      } else {
        return page2(email: email); // Send the email to Page2
      }
    }

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            minWidth: 100,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.house),
                selectedIcon: Icon(Icons.house),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('First'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Second'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _buildSelectedPage(), // Build the selected page dynamically
          ),
        ],
      ),
    );
  }
}

Widget HomeScreen({required String email, required String name}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Home Screen', style: TextStyle(fontSize: 24)),
        Text('Email: $email', style: const TextStyle(fontSize: 18)),
        Text('Name: $name', style: const TextStyle(fontSize: 18)),
      ],
    ),
  );
}

Widget page1({required String name}) {
  return Center(
    child: Text(
      'Name: $name',
      style: const TextStyle(fontSize: 24),
    ),
  );
}

Widget page2({required String email}) {
  return Center(
    child: Text(
      'Email: $email',
      style: const TextStyle(fontSize: 24),
    ),
  );
}
