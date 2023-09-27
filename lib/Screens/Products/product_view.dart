import 'dart:async';

import 'package:collabact/Screens/Bussiness/bussiness_view.dart';
import 'package:collabact/Screens/Categories/categories_details.dart';
import 'package:collabact/Screens/Products/product.dart';
import 'package:collabact/Screens/Products/products_list_menu.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Api Response/bussiness_page_response/bussiness_sigment_response.dart';
import '../../Api Services/bussiness_view_api/bussiness_sigment_api.dart';
import '../../Api Services/bussiness_view_api/get_bussiness_list_api.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView>
    with SingleTickerProviderStateMixin {
  bool state = false;
  late TabController _tabController;
  StreamSubscription? internetconnection;
  bool isoffline = false;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
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

  @override
  Widget build(BuildContext context) {
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
          "Your Products",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xff058DD1),
                  child: errmsg("No Internet Connection Available", isoffline),
                  //to show internet connection message on isoffline = true.
                ),
                Container(
                  color: Color(0xff058DD1),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          height: 44,
                          child: TextField(
                            cursorColor: Color(0xff5067EB),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                suffixIcon: Container(
                                    child: const Icon(
                                  Icons.search,
                                  color: Color(0xff90909A),
                                )),
                                filled: true,
                                hintText: "Search Products",
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
                      Spacer(),
                      TabBar(
                        isScrollable: true,
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: CircleTabIndicator(color: Colors.white),
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.white,
                        tabs: <Widget>[
                          Row(
                            children: [
                              Tab(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/Vector.svg"),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Products",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     Tab(
                          //       child: Row(
                          //         children: [
                          //           SvgPicture.asset(
                          //               "assets/images/Vector1.svg"),
                          //           Padding(
                          //             padding: const EdgeInsets.all(8.0),
                          //             child: Text(
                          //               "Categories",
                          //               style: TextStyle(
                          //                   fontWeight: FontWeight.w500,
                          //                   fontSize: 16,
                          //                   color: Colors.white),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Row(
                            children: [
                              Tab(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/Vector2.svg"),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Businesses",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    // ignore: sort_child_properties_last
                    children: [
                      Column(children: [
                        ProductsItemsList(),
                        // ProductDetails(),
                      ]),
                      // Column(children: [
                      //   CategoriesDetails(),
                      // ]),
                      SingleChildScrollView(
                        child: Column(children: [
                          // SigmnetContainer(),
                          BussinessView(),
                        ]),
                      ),
                    ],
                    controller: _tabController,
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
