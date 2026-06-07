import 'package:expense_app/utilits/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
