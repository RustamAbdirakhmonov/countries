import 'dart:async';

import 'package:countries/presintation/screens/registir_screen.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  static const routeArgs="/splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(milliseconds: 3000), () {
      Navigator.of(context).pushReplacementNamed(RegistrScreen.routeArgs);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;
    return Scaffold(

      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
              colors: [
              Colors.grey.shade400,
              Theme.of(context).primaryColor.withOpacity(.6),
            ]
          )
        ),

        child: Stack(
          children: <Widget>[
            SizedBox(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: width*.5,
                    height: width*.5,
                    child: Image.asset('assets/images/geography.png',),
                  ),
                  SizedBox(height: 40,),
                  Text('Dunyo mamlakatlari!',style: Theme.of(context).textTheme.headline1,),
                  SizedBox(height: 20,),
                  CircularProgressIndicator(),


                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
