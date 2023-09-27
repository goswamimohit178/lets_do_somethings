import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  // final double coverHeight = 40;
  // final double profileHeight = 100;
  String? _thisWeeks = null;
  @override
  Widget build(BuildContext context) {
    //final bottom = profileHeight / 2;
    // final cliptop = coverHeight - profileHeight / 2;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          backgroundColor: Color(0xff058DD1),
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff058DD1),
            statusBarIconBrightness: Brightness.light,
          ),
          title: Text(
            "My Wallet",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.red,
          child: Column(
            children: [
              Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      color: Color(0xff058DD1),
                      //  color: Colors.green,

                      ///margin: EdgeInsets.only(bottom: bottom),
                      margin: EdgeInsets.only(bottom: 110),

                      width: MediaQuery.of(context).size.width,
                      //height: coverHeight,
                      height: 128,
                      child: const Column(
                        children: [],
                      ),
                    ),
                    Positioned(
                      //top: 100,
                      //bottom: 10,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 2,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.80,
                          //height: MediaQuery.of(context).size.height * 0.28,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      "Total Earnings",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Spacer(),
                                  /////////// drop down week

                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 20),
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width: MediaQuery.of(context).size.width *
                                        0.38,
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: ("This week"),
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Color(0xff717D96)),
                                      ),
                                      isDense: true,
                                      validator: (value) =>
                                          value == null ? "This WeeK " : null,
                                      value: _thisWeeks,
                                      items: [
                                        "This Week",
                                        "This month",
                                        "This year",
                                        "This days",
                                      ]
                                          .map((dynamic value) =>
                                              DropdownMenuItem(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    color: Colors.grey,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _thisWeeks = value! as String?;
                                          if (_thisWeeks != null) {
                                            print("Value+ $value");
                                          }
                                        });
                                      },
                                    ),
                                  ),

                                  //////////////////////
                                  // Padding(
                                  //   padding: const EdgeInsets.only(right: 15),
                                  //   child: Container(
                                  //     //height: 40,
                                  //     width: 150,
                                  //     decoration: BoxDecoration(
                                  //       //  color: Colors.red,
                                  //       borderRadius:
                                  //           BorderRadius.circular(6),
                                  //       border: Border.all(
                                  //         color: Colors.grey,
                                  //       ),
                                  //     ),
                                  //     child: DropdownButtonHideUnderline(
                                  //       child: DropdownButtonFormField(
                                  //         decoration: InputDecoration(
                                  //           border: InputBorder
                                  //               .none, // Remove the border
                                  //           hintText: ("send to"),
                                  //           hintStyle: TextStyle(
                                  //             fontWeight: FontWeight.w500,
                                  //             fontSize: 10,
                                  //             overflow: TextOverflow.ellipsis,
                                  //             color: Colors.grey,
                                  //           ),
                                  //           // contentPadding:
                                  //           //     EdgeInsets.symmetric(
                                  //           //   //  vertical: 5,
                                  //           //   horizontal: 20,
                                  //           // ),
                                  //         ),
                                  //         isDense: true,
                                  //         value: _thisWeeks,
                                  //         validator: (value) => value == null
                                  //             ? "Orders Status "
                                  //             : null,
                                  //         items: [
                                  //           "This Week",
                                  //           "This month",
                                  //           "This Year",
                                  //           "This days",
                                  //         ].map((dynamic value) {
                                  //           return DropdownMenuItem(
                                  //             value: value,
                                  //             child: Text(
                                  //               value,
                                  //               style: TextStyle(
                                  //                 fontWeight: FontWeight.w500,
                                  //                 fontSize: 16,
                                  //                 color: Colors.black,
                                  //               ),
                                  //             ),
                                  //           );
                                  //         }).toList(),
                                  //         onChanged: (value) {
                                  //           setState(() {
                                  //             _thisWeeks = value! as String?;
                                  //             if (_thisWeeks != null) {
                                  //               print("Value+ $value");
                                  //             }
                                  //           });
                                  //         },
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  ////////////////////////////////
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 10),
                                child: Row(
                                  children: [
                                    Text("₹20000",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff02283C),
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "+10%",
                                      style: TextStyle(
                                          color: Color(0xff24AD71),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "from last week",
                                      style: TextStyle(
                                          color: Color(0xff717D96),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 20),
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.066,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                                    onPressed: () {},
                                    child: const Text('Withdraw'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
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
