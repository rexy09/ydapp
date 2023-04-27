import 'package:flutter/material.dart';
import 'package:ydapp/screens/navbar/boats.dart';
import 'package:ydapp/screens/navbar/bookings.dart';
import 'package:ydapp/screens/navbar/home.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectPage = 0;

  final List<Widget> _pageOptions = <Widget>[
    const Home(),
    const Boats(),
    const Bookings(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/bg/water.jpg"), fit: BoxFit.cover),
      ),
      child: Container(
        color: const Color.fromARGB(82, 0, 0, 0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons.notes,
                    color: Colors.white, // Change Custom Drawer Icon Color
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                // tooltip: 'Show Snackbar',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('This is a snackbar')));
                },
              ),
            ],
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Text(
                    'Eddy Biggz',
                    textScaleFactor: 1.2,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: const Text('FAQ'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('Help'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
          ),
          body: IndexedStack(
            index: _selectPage,
            children: _pageOptions,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            elevation: 0.0,
            selectedFontSize: 10.0,
            unselectedFontSize: 10.0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            currentIndex: _selectPage,
            onTap: (int index) {
              setState(() {
                _selectPage = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.directions_boat_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event_outlined),
                label: '',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.settings),
              //   label: '',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
