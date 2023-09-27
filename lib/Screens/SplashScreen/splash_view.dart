import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Api Services/auth_token_api.dart';
import '../../main.dart';
import '../OnBoardingScreen/on_boarding.dart';
import '../bottomNavigation/menu_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState()  {
    authToken();
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffffffff) ,
      appBar: AppBar(
        backgroundColor:Color(0xffffffff) ,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:  Color(0xffffffff),
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SafeArea(
        child: InkWell(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Image.asset("assets/images/image1.png")),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Text(
                    "V 1.0",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(.3)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
//   ***** Method created for set timmer for splash screen *****  //
  startTime() async {
    var duration = new Duration(seconds: 5);
    return new Timer(duration, route);
  }

  //  ***** Method  created for Navigation ***** //
  route() {
     otpVerified == false || otpVerified == null ?
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OnBoardingView()))
     : Navigator.pushReplacement(
         context, MaterialPageRoute(builder: (context) =>  MenuView(1)));
  }
}
