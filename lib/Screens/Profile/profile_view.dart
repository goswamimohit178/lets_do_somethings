import 'dart:async';
import 'package:lets_do_somethings/Screens/Location/location_page.dart';
import 'package:lets_do_somethings/Screens/Phonenumber/phone_number_view.dart';
import 'package:lets_do_somethings/Screens/Profile/bussiness_enquiry.dart';
import 'package:lets_do_somethings/Screens/Profile/My%20Leads/myleads_view.dart';
import 'package:lets_do_somethings/Screens/Profile/supports_socials.dart';
import 'package:lets_do_somethings/Screens/Profile/tutorials_view.dart';
import 'package:lets_do_somethings/Screens/Profile/wallet/my_wallet_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.pop(context, true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PhoneNumberView()),
        );
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Would you like to continue Logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  final double coverHeight = 60;
  final double profileHeight = 100;
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
    final bottom = profileHeight / 2;
    final cliptop = coverHeight - profileHeight / 2;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xff058DD1),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff058DD1),
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          "Account",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  color: Color(0xff058DD1),
                  child: errmsg("No Internet Connection Available", isoffline),
                  //to show internet connection message on isoffline = true.
                ),
                Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        color: Color(0xff058DD1),
                        margin: EdgeInsets.only(bottom: bottom),
                        width: MediaQuery.of(context).size.width,
                        height: coverHeight,
                        child: const Column(
                          children: [],
                        ),
                      ),
                      Positioned(
                        top: cliptop,
                        child: CircleAvatar(
                          radius: profileHeight / 2,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage("assets/images/Ellipse4.png"),
                        ),
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 16),
                  child: Text(
                    "Ajay Clothing Store",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffF48C13),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LocationPage()),
                      );
                    },
                    child: Text(
                      "Edit Profile",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyLeadsView()),
                      );
                    },
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/images/users1.svg"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "My Leads",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyWalletScreen()),
                      );
                    },
                    child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/images/Frame171.svg"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "My Wallet",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SupportsSocialsView()),
                      );
                    },
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/images/social-networks.svg"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Support & Socials",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TutorialsView()),
                      );
                    },
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/images/Vector4.svg"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Tutorials",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/Group.svg"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Help Center",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/Vector5.svg"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Privacy / Terms & Conditions",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/Vector11.svg"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Rate Us",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ()),
                            );*/
                          },
                          child: Icon(Icons.keyboard_arrow_right)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 40, 10),
                  child: GestureDetector(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/images/Vector10.svg"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Log Out",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xffE30909),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
