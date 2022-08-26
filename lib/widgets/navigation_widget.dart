import 'package:chrip/pages/hist_page.dart';
import 'package:chrip/pages/home_page.dart';
import 'package:chrip/pages/trends_page.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  // gettings the userid
  String? userId;

  NavigationDrawer({Key? key, this.userId}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue[100],
        child: Column(
          children: [
            DrawerHeader(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue[50],
                ),
                child: Center(
                  child: Image.asset('images/birdCircle.png', fit: BoxFit.fill),
                ),
              ),
            ),
            // list of menu items
            ListTile(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              leading: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.home),
              ),
              title: const Text(
                'H O M E',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryList(userId: widget.userId),
                  ),
                );
              },
              leading: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.history),
              ),
              title: const Text(
                'H I S T O R Y',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Trends(userId: widget.userId),
                  ),
                );
              },
              leading: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.graphic_eq_rounded),
              ),
              title: const Text(
                'T R E N D S',
                style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
            ),
            const ListTile(
              leading: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.camera),
              ),
              title: Text(
                'G A L L E R Y',
                style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
            ),
            const ListTile(
              leading: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.settings),
              ),
              title: Text(
                'S E T T I N G S',
                style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
            ),
            const ListTile(
              leading: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.login),
              ),
              title: Text(
                'L O G O U T',
                style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
