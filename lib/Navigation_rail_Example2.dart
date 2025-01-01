import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


                              //Read Me
//In this Example Data is shared from HomeScreen to page 1 and page 2 using Static keyword
/// Main Navigation Rail Example
class NavigationRailExample2 extends StatefulWidget {
  const NavigationRailExample2({super.key});

  @override
  State<NavigationRailExample2> createState() => _NavigationRailExample2State();
}

class _NavigationRailExample2State extends State<NavigationRailExample2> {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
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
                icon: Icon(Icons.password),
                selectedIcon: Icon(Icons.add),
                label: Text('First'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.account_box),
                selectedIcon: Icon(Icons.back_hand),
                label: Text('Second'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
              child: _selectedIndex == 0
                  ? HomeScreen()// Show Home Screen when Home is selected
                  : _selectedIndex == 1
                  ?  Page1(name: HomeScreen.name)// for index 1
                  :   Page2(email: HomeScreen.email)// Show "I am page 2" for index 1
          ),
        ],
      ),
    );
  }
}

/// Home Screen Class
class HomeScreen extends StatelessWidget {
   static final String email = 'Jadoon@gmail.com'; // Email to share with Page1
   static final String name = 'Khan'; // Name to share with Page2

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
}

/// Page 1 Class
class Page1 extends StatelessWidget {
  final String name;

  const Page1({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Name: $name',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

/// Page 2 Class
class Page2 extends StatelessWidget {
  final String email;

  const Page2({required this.email, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Email: $email',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
