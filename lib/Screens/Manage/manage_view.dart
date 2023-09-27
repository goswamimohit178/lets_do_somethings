import 'dart:async';

import 'package:collabact/Screens/Manage/Create%20Campaign/my_campaign.dart';
import 'package:collabact/Screens/Manage/My_Promotions/my_promotion.dart';
import 'package:collabact/Screens/Manage/my_qr_code_view.dart';
import 'package:collabact/Screens/Manage/product_rating_reviews.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ManageView extends StatefulWidget {
  const ManageView({Key? key}) : super(key: key);

  @override
  State<ManageView> createState() => _ManageViewState();
}

class _ManageViewState extends State<ManageView> {
  StreamSubscription? internetconnection;
  bool isoffline = false;

  @override
  void initState() {
    // TODO: implement initState
    try {
      internetconnection = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) {
        // whenevery connection status is changed.
        if (result == ConnectivityResult.none) {
          //there is no any connection
          setState(() {
            isoffline = true;
          });
        } else if (result == ConnectivityResult.mobile) {
          //connection is mobile data network
          setState(() {
            isoffline = false;
          });
        } else if (result == ConnectivityResult.wifi) {
          //connection is from wifi
          setState(() {
            isoffline = false;
          });
        }
      }); // using this listiner, you can get the medium of connection as well.
    } on Exception catch (e) {
      print(e);
    }
    super.initState();
  }

  @override
  void dispose() {
     internetconnection!.cancel();
    //cancel internent connection subscription after you are done
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffffffff) ,
      appBar: AppBar( backgroundColor: Color(0xff058DD1),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:  Color(0xff058DD1),
          statusBarIconBrightness: Brightness.light,
        ),
        title:Text(
          "Manage",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              color: Color(0xff058DD1),
                      child:
                          errmsg("No Internet Connection Available", isoffline),
                      //to show internet connection message on isoffline = true.
                    ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/images/Vector6.svg"),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyCampaignView()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "My Campaign",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/images/Vector7.svg"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyPromotionView()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "My Promotions",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/images/Vector8.svg"),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductsRatingReview()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "Product Rating & Reviews",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/images/Vector9.svg"),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QrCodeView()));
                      },
                      child: Text(
                        "My QR Code",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
  //* Internet Error Message 
  Widget errmsg(String text, bool show) {
    //error message widget.
    if (show == true) {
      //if error is true then show error message box
      return Container(
        padding: EdgeInsets.all(10.00),
        margin: EdgeInsets.only(bottom: 10.00),
        color: Colors.red,
        child: Row(children: [
          Container(
            margin: EdgeInsets.only(right: 6.00),
            child: Icon(Icons.info, color: Colors.white),
          ), // icon for error message

          Text(text, style: TextStyle(color: Colors.white)),
          //show error message text
        ]),
      );
    } else {
      return Container();
      //if error is false, return empty container.
    }
  }
}
