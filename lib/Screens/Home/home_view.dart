import 'dart:async';

import 'package:collabact/Screens/Home/alertdialog.dart';
import 'package:collabact/Screens/Products/product_view.dart';
import 'package:collabact/Screens/Profile/profile_view.dart';
import 'package:collabact/Screens/models/chart_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

String? selectedweek = null;
bool is_checkedaadhar = false;
bool is_checkedaadharphoto = false;
bool is_checkedpancard = false;
bool is_checkedpancardphoto = false;
String dropdownvalue = "Last Week";

class _HomeViewState extends State<HomeView> {
  onShareLink(BuildContext context) async {
    await Share.share('collabact.com/new\n This is according to the details',
    subject: 'This is according to the details',
    );

  }

  StreamSubscription? internetconnection;
  bool isoffline = false;

  @override
  void initState() {
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
    // TODO: implement initState
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
    internetconnection!.cancel();
    //cancel internent connection subscription after you are done
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(builder: (_, snapshot) {
      return Scaffold(
        backgroundColor:Color(0xffffffff) ,
        body: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(Duration(seconds: 1), () {
              setState(() {});
            });
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    Container(
                      child:
                          errmsg("No Internet Connection Available", isoffline),
                      //to show internet connection message on isoffline = true.
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Ajay Clothing Store",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.3,
                                  fontSize: 20)),
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                "assets/images/Ellipse5.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 15, bottom: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Your Store Link",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -0.3,
                                        fontSize: 16)),
                                Text(
                                    "Customers can visit the following link and place their orders",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff717d96),
                                        fontSize: 14)),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 0.5, color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return CandidateKYC();
                                                  });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "collabact.com/new",
                                                style: TextStyle(
                                                    color: Color(0xff058dd1),
                                                    fontSize: 17),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: InkWell(
                                          onTap: () {
                                            onShareLink(context);
                                          },
                                          child: Container(
                                              height: 45,
                                              decoration: BoxDecoration(
                                                color: Color(0xff058dd1),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.grey),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.ios_share,
                                                      size: 20,
                                                      color: Colors.white),
                                                  SizedBox(
                                                    width: 1,
                                                  ),
                                                  Text(
                                                    "Share",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17),
                                                  )
                                                ],
                                              ))),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            children: [
                              Text(
                                "TOTAL SALES",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                              Text(
                                "₹5,800",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.only(top: 4, right: 16),
                          height: 75,
                          width: 150,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                hintText: ("Last Week"),
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Color(0xff717D96))),
                            validator: (value) =>
                                value == null ? "Last WeeK " : null,
                            value: selectedweek,
                            items: [
                              "Today",
                              "Weekly",
                              "Monthly",
                              "Quaterly",
                              "Yearly",
                              "Custom",
                            ]
                                .map((dynamic value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: Colors.grey),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedweek = value! as String?;
                                if (selectedweek != null) {
                                  print("Value");
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        height: 250,
                        width: double.infinity,
                        child: Chart(),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image:
                                    AssetImage("assets/images/frame_image.png"),
                              )),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 10),
                                    child: Container(
                                        height: 20,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 1, color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "NEW!",
                                              style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontSize: 10),
                                            )
                                          ],
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 20),
                                    child: Text(
                                      "52",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 0),
                                    child: Text(
                                      "Total Orders",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image:
                                    AssetImage("assets/images/frame_img.png"),
                              )),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 55),
                                    child: Text(
                                      "300",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 0),
                                    child: Text(
                                      "Store Views",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image:
                                    AssetImage("assets/images/frame_imge.png"),
                              )),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 55),
                                    child: Text(
                                      "250",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 0),
                                    child: Text(
                                      "Product Views",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Missing Details",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                width: 260,
                                decoration: BoxDecoration(
                                  color: Color(0xfff7f9fc),
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 15, bottom: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Store Address",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: -0.3,
                                              fontSize: 15)),
                                      Text(
                                          "Add your address so that buyers\n can discover your store",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff717d96),
                                              fontSize: 13)),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfileView()));
                                        },
                                        child: Container(
                                            height: 45,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              color: Color(0xffe6f3f9),
                                              border: Border.all(
                                                  width: 1, color: Colors.grey),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Add Address",
                                                  style: TextStyle(
                                                      color: Color(0xff1787ba),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      ),
                                                )
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                                width: 270,
                                decoration: BoxDecoration(
                                  color: Color(0xfff7f9fc),
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 15, bottom: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Email",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15)),
                                      Text(
                                          "Add your email to get updated about \nnew features, updates & more",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff717d96),
                                              fontSize: 13)),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfileView()));
                                        },
                                        child: Container(
                                            height: 45,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              color: Color(0xffe6f3f9),
                                              border: Border.all(
                                                  width: 1, color: Colors.grey),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Add Email",
                                                  style: TextStyle(
                                                      color: Color(0xff1787ba),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                  ),
                                                )
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Pending Requests",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductView()));
                      },
                      child: ListTile(
                        leading: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Color(0xffe6f3f9),
                            image: DecorationImage(
                                image: AssetImage("assets/images/buss1.png"),
                                fit: BoxFit.fitHeight),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        title: Text(
                          'Fiona Gold Professional',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xff1787ba),
                        ),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.watch_later_rounded,
                              color: Color(0xfff18c16),
                              size: 20,
                            ),
                            Text(
                              '01-06-2023 6:00 PM',
                              style: TextStyle(
                                color: Color(0xff717d96),
                              ),
                            ),
                          ],
                        ),
                        selected: true,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductView()));
                      },
                      child: ListTile(
                        leading: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Color(0xffe6f3f9),
                            image: DecorationImage(
                              image: AssetImage("assets/images/buss.png"),
                              fit: BoxFit.fitHeight,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        title: Text(
                          'JB Masala Product',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xff1787ba),
                        ),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.watch_later_rounded,
                              color: Color(0xfff18c16),
                              size: 20,
                            ),
                            Text(
                              '01-06-2023 6:00 PM',
                              style: TextStyle(
                                color: Color(0xff717d96),
                              ),
                            ),
                          ],
                        ),
                        selected: true,
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    )
                  ]),
                ),
              ),
            ),
          ),
        ),
      );
    });
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

Widget Chart() {
  return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          labelRotation: 0,
          labelIntersectAction: AxisLabelIntersectAction.multipleRows,
        ),
        series: <ChartSeries>[
          ColumnSeries<ChartDataInfo, String>(
            dataSource: indexChart,
            pointColorMapper: (ChartDataInfo data, _) => data.color,
            xValueMapper: (ChartDataInfo data, _) => data.year,
            yValueMapper: (ChartDataInfo data, _) => data.value,
            enableTooltip: true,
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              angle: 0,
            ),
          ),
        ],
      ));
}
