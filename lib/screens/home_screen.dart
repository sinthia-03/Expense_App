import 'package:expense_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(children: [
          Center(child: Text('Home Screen')),
          Center(child: Text('Transaction Screen')),
          SizedBox(),
          Center(child: Text('Analytics Screen')),
          Center(child: Text('Account Screen')),
        ],
        ),

          floatingActionButton: FloatingActionButton(onPressed: (

              ){
            print('Add clicked');
          },
          shape: CircleBorder(),
            child: Icon(Icons.add,color: Colors.white,size: 30),

          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, -1),
              )
            ]
          ),
          child:TabBar(
            labelColor: Colors.purple,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.transparent,
            labelStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontSize: 11),
            tabs: [
              Tab(icon: Icon(Icons.home_outlined), text: 'Home'),
              Tab(icon: Icon(Icons.account_balance_wallet), text: 'Transaction'),
              Tab(icon: SizedBox(height: 24), text: ''),
              Tab(icon: Icon(Icons.analytics_outlined), text: 'Analytics'),
              Tab(icon: Icon(Icons.supervisor_account), text: 'Account'),
            ],
          ),
        )
        ),
        );
  }

}
