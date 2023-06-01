import 'package:projekan/views/profiel.dart';
import 'package:flutter/material.dart';
import '../data.dart';
import 'konversi_uang.dart';
import 'konversi_waktu.dart';

void main() {
  runApp(MainMenu());
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       title: 'Projek Akhir Prak TPM',
       theme: ThemeData(
        primarySwatch: Colors.blue,
         visualDensity: VisualDensity.adaptivePlatformDensity,
       ),
      home: MyHomePage(title: 'Receipt Food'),
    );

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    RecipeListScreen(),
    CalendarPage(),
    conversiMoney(),
    ProfilePage(),
    // ProfilePage(name: "Selvi", nim: "123200026", photoUrl: "" ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.grey,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm_outlined),
            backgroundColor: Colors.grey,
            label: 'Time',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            backgroundColor: Colors.grey,
            label: 'konversi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_sharp),
            backgroundColor: Colors.grey,
            label: 'AccountMe',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext index) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[


        ],
      ),
    );
  }
}



