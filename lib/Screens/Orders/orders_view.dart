import 'dart:async';

import 'package:collabact/Screens/Orders/orders_accepted.dart';
import 'package:collabact/Screens/Orders/orders_all.dart';
import 'package:collabact/Screens/Orders/orders_delievery.dart';
import 'package:collabact/Screens/Orders/orders_pending.dart';
import 'package:collabact/Screens/Orders/orders_shipped.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView>
    with SingleTickerProviderStateMixin {
  bool state = false;
  late TabController _tabController;
  StreamSubscription? internetconnection;
  bool isoffline = false;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);

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
    _tabController.dispose();
    internetconnection!.cancel();
    //cancel internent connection subscription after you are done
    super.dispose();
  }

  String? _selectOrdersStatus = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xff058DD1),
        //backgroundColor: Colors.red,
        elevation: 0,

        automaticallyImplyLeading: false,
        // centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff058DD1),
          statusBarIconBrightness: Brightness.light,
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: Text(
            "Your Orders",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // color: Color(0xff058DD1),

                child: errmsg("No Internet Connection Available", isoffline),
                //to show internet connection message on isoffline = true.
              ),
              Container(
                color: Color(0xff058DD1),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.09,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          // textAlign: TextAlign.right,
                          onChanged: (value) {
                            String st;
                            searchData(st = value.trim().toLowerCase());
                            // Method For Searching
                          },
                          cursorColor: Color(0xff5067EB),
                          // maxLines: 2,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              suffixIcon: Container(
                                  child: const Icon(
                                Icons.search,
                                color: Color(0xff90909A),
                              )),
                              filled: true,
                              hintText: "Order Id,Phone No. or Name",
                              hintTextDirection: TextDirection.ltr,
                              hintStyle: const TextStyle(
                                  color: Color(0xff90909A),
                                  fontWeight: FontWeight.w400),
                              fillColor: Color(0xffF1EFFA),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    height: 70,
                    //  color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '15 ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Orders',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                          padding: EdgeInsets.only(top: 4, right: 16),
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none, // Remove the border
                                hintText: ("Orders "),
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.grey,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10.0,
                                ),
                              ),
                              isExpanded: true,
                              isDense:
                                  true, // Align the list items to the leading side
                              value: _selectOrdersStatus,
                              validator: (value) =>
                                  value == null ? "Orders Status " : null,
                              items: [
                                "All",
                                "Pending",
                                "Accepted",
                                "Shipped",
                              ].map((dynamic value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectOrdersStatus = value! as String?;
                                  if (_selectOrdersStatus != null) {
                                    print("Value+ $value");
                                  }
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              OrdersAllDetails(),
            ],
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

void searchData(String st) {}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator(
      {double width = 20, double height = 10, required Color color})
      : _painter = _CirclePainter(width, height);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double width;
  final double height;
  _CirclePainter(this.width, this.height)
      : _paint = Paint()
          ..color = Colors.white
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Path trianglePath = Path();
    if (cfg.size != null) {
      Offset centerTop =
          Offset(cfg.size!.width / 2, cfg.size!.height - height) + offset;
      Offset bottomLeft =
          Offset(cfg.size!.width / 2 - (width / 2), cfg.size!.height) + offset;
      Offset bottomRight =
          Offset(cfg.size!.width / 2 + (width / 2), cfg.size!.height) + offset;

      trianglePath.moveTo(bottomLeft.dx, bottomLeft.dy);
      trianglePath.lineTo(bottomRight.dx, bottomRight.dy);
      trianglePath.lineTo(centerTop.dx, centerTop.dy);
      trianglePath.lineTo(bottomLeft.dx, bottomLeft.dy);

      trianglePath.close();
      canvas.drawPath(trianglePath, _paint);
    }
  }
}
