import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfirmOrderView extends StatefulWidget {
  const ConfirmOrderView({Key? key}) : super(key: key);

  @override
  State<ConfirmOrderView> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xff058DD1),
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff058DD1),
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          "Order #870892",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.watch_later_rounded,
                    color: Color(0xfff18c16),
                    size: 28,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'PENDING',
                    style: TextStyle(
                        color: Color(0xfff18c16),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Spacer(),
                  Text(
                    "Today, 10:00 PM",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff717d96),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              //  bottomLeft: Radius.circular(10)),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/Rectangle.png"),
                                fit: BoxFit.fill,
                              )),
                        )),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'White T-Shirt',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            Text(
                              'T-Shirts',
                              style: TextStyle(
                                  color: Color(0xff717d96),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'QTY: 1',
                              style: TextStyle(
                                  color: Color(0xff717d96),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              '₹250',
                              style: TextStyle(
                                  color: Color(0xff058DD1),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            Text(
                              '1x250',
                              style: TextStyle(
                                  color: Color(0xff717d96),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 30),
              child: Row(
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(
                        // color: Color(0xff058DD1),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  Spacer(),
                  Text(
                    "₹250",
                    style: TextStyle(
                        //  color: Color(0xff058DD1),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 10),
              child: Row(
                children: [
                  Text(
                    "Delivery Fee",
                    style: TextStyle(
                        // color: Color(0xff058DD1),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  Spacer(),
                  Text(
                    "FREE",
                    style: TextStyle(
                        color: Color(0xfff18c16),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 10),
              child: Row(
                children: [
                  Text(
                    "GST (18%)",
                    style: TextStyle(
                        // color: Color(0xff058DD1),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  Spacer(),
                  Text(
                    "₹45",
                    style: TextStyle(
                        //  color: Color(0xff058DD1),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              height: 32,
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffF4FBF4),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 20.0, top: 10),
                child: Row(
                  children: [
                    Text(
                      "Commission(10%)",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
                          fontSize: 15),
                    ),
                    Spacer(),
                    Text(
                      "₹25",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 0),
              child: Divider(),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 20.0, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                        // color: Color(0xff058DD1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Spacer(),
                  Text(
                    "₹320",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 10,
              color: Color(0xffedf0f7),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color(0xff058DD1),
                    //  size: 28,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Delivery Address",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 0),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Text(
                                    'Arun Jain',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  VerticalDivider(
                                    thickness: 2,
                                  ),
                                  Text(
                                    '+91768674624',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'abs@gmail.com',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              //  bottomLeft: Radius.circular(10)),
                              image: DecorationImage(
                                image: AssetImage("assets/images/Call.png"),
                              )),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 20.0, top: 0),
              child: Row(
                children: [
                  Text(
                    "Address",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 20.0, top: 0),
              child: Row(
                children: [
                  Text(
                    "4/52 Malviya Nagar, Jaipur - 302020",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 5),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.ios_share_rounded,
                    // size: 25,
                    color: Color(0xfff18c16),
                  ),
                  Text(
                    "Share Details",
                    style: TextStyle(
                        color: Color(0xfff18c16),
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ],
                // Text("More Info")
              ),
            ),
            Divider(
              thickness: 10,
              color: Color(0xffedf0f7),
            ),
            Card(
              elevation: 2,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 20.0, top: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.credit_card_outlined,
                          color: Color(0xff058DD1),
                          // size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Payment",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 20.0, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          "CASH ON DELIVERY",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomSheet: Container(
      //   color: Colors.white,
      //   child: Padding(
      //     padding: const EdgeInsets.only(bottom: 20.0),
      //     child: Row(
      //       children: [
      //         Expanded(
      //           flex: 1,
      //           child: Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Container(
      //               height: 50,
      //               decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   border: Border.all(width: 2, color: Colors.red),
      //                   borderRadius: BorderRadius.circular(10)),
      //               child: const Center(
      //                 child: Text(
      //                   "Reject",
      //                   textAlign: TextAlign.center,
      //                   style: (TextStyle(
      //                       color: Colors.red,
      //                       fontSize: 18,
      //                       fontWeight: FontWeight.bold)),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //           flex: 1,
      //           child: GestureDetector(
      //             onTap: () {
      //               showModalBottomSheet<void>(
      //                   context: context,
      //                   builder: (BuildContext context) {
      //                     return Container(
      //                       decoration: BoxDecoration(
      //                           color: Colors.white,
      //                           borderRadius: BorderRadius.circular(10)),
      //                       height: 200,
      //                       width: double.maxFinite,
      //                       child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         mainAxisSize: MainAxisSize.min,
      //                         children: <Widget>[
      //                           const Text(
      //                             'Accept Order',
      //                             style: TextStyle(
      //                                 fontWeight: FontWeight.w700,
      //                                 fontSize: 20),
      //                           ),
      //                           Text(
      //                             'Do you want to Accept this Order?',
      //                             style: TextStyle(
      //                                 fontWeight: FontWeight.w500,
      //                                 fontSize: 18),
      //                           ),
      //                           SizedBox(
      //                             height: 20,
      //                           ),
      //                           Container(
      //                             color: Colors.white,
      //                             child: Padding(
      //                               padding:
      //                                   const EdgeInsets.only(bottom: 20.0),
      //                               child: Row(
      //                                 children: [
      //                                   Expanded(
      //                                     flex: 1,
      //                                     child: Padding(
      //                                       padding:
      //                                           const EdgeInsets.all(8.0),
      //                                       child: Container(
      //                                         height: 50,
      //                                         decoration: BoxDecoration(
      //                                             color: Colors.white,
      //                                             border: Border.all(
      //                                               width: 2,
      //                                               color: Color(0xff058DD1),
      //                                             ),
      //                                             borderRadius:
      //                                                 BorderRadius.circular(
      //                                                     10)),
      //                                         child: const Center(
      //                                           child: Text(
      //                                             "Cancel",
      //                                             textAlign: TextAlign.center,
      //                                             style: (TextStyle(
      //                                                 color:
      //                                                     Color(0xff058DD1),
      //                                                 fontSize: 18,
      //                                                 fontWeight:
      //                                                     FontWeight.bold)),
      //                                           ),
      //                                         ),
      //                                       ),
      //                                     ),
      //                                   ),
      //                                   Expanded(
      //                                     flex: 1,
      //                                     child: GestureDetector(
      //                                       onTap: () {
      //                                         Navigator.push(
      //                                           context,
      //                                           MaterialPageRoute(
      //                                               builder: (context) =>
      //                                                   const AddTrackingDetails()),
      //                                         );
      //                                       },
      //                                       child: Padding(
      //                                         padding:
      //                                             const EdgeInsets.all(8.0),
      //                                         child: Container(
      //                                           height: 50,
      //                                           decoration: BoxDecoration(
      //                                               color: Color(0xff058DD1),
      //                                               borderRadius:
      //                                                   BorderRadius.circular(
      //                                                       10)),
      //                                           child: const Center(
      //                                             child: Text(
      //                                               "Yes",
      //                                               textAlign:
      //                                                   TextAlign.center,
      //                                               style: (TextStyle(
      //                                                   color: Colors.white,
      //                                                   fontSize: 18,
      //                                                   fontWeight:
      //                                                       FontWeight.bold)),
      //                                             ),
      //                                           ),
      //                                         ),
      //                                       ),
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                     );
      //                   });
      //             },
      //             child: Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(
      //                 height: 50,
      //                 decoration: BoxDecoration(
      //                     color: Color(0xff058DD1),
      //                     borderRadius: BorderRadius.circular(10)),
      //                 child: const Center(
      //                   child: Text(
      //                     "Accept",
      //                     textAlign: TextAlign.center,
      //                     style: (TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 18,
      //                         fontWeight: FontWeight.bold)),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
