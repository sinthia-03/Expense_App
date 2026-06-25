import 'package:expense_app/utilits/asset_path.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        appBar: AppBar(
          title: InkWell(
            onTap: (){},
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                backgroundImage: AssetImage(AssetPath.profilePic),
                ),
                SizedBox(width: 8),
                Text("Welcome!")
              ],
            ),
          ),
          actions: [
            IconButton(onPressed: (){},
                icon: Icon(Icons.settings,color: Colors.grey,))
          ],
        ),


      ),
    );
  }
}
