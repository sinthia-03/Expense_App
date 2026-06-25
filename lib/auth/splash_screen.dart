import 'package:expense_app/auth/main_navi_screen.dart';
import 'package:expense_app/screens/home_screen.dart';
import 'package:expense_app/utilits/asset_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    movetoNextScreen();
  }
  Future<void>movetoNextScreen()async {
    await Future.delayed(Duration(seconds: 3));
    final user = FirebaseAuth.instance.currentUser;

    if (user !=null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNaviScreen()));

    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(AssetPath.backgroundSVG),
          Center(child: SvgPicture.asset(AssetPath.logoSVG,width:150,height: 150,)),

        ],
      ),

    );
  }

}
