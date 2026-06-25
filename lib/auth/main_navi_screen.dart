import 'package:expense_app/screens/add_screen.dart';
import 'package:expense_app/screens/home_screen.dart';
import 'package:expense_app/screens/transaction_screen.dart';
import 'package:flutter/material.dart';

class MainNaviScreen extends StatefulWidget {
  const MainNaviScreen({super.key});

  @override
  State<MainNaviScreen> createState() => _MainNaviScreenState();
}

class _MainNaviScreenState extends State<MainNaviScreen> {
  int _seletedIndex = 0;
  List _screen = [
    HomeScreen(),
    TransactionScreen(),
    AddScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_seletedIndex],

      bottomNavigationBar: NavigationBar(
          selectedIndex: _seletedIndex,
          onDestinationSelected: (int index){
            _seletedIndex = index;
            setState(() {

            });
          },
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.transform), label: 'Transaction')

      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(onPressed:
        _add,
        child: Icon(Icons.add),backgroundColor: Colors.purpleAccent.withAlpha(80),
      ),
    );
  }
  void _add(){
Navigator.push(context, MaterialPageRoute(builder: (_)=>AddScreen()));
  }
}
