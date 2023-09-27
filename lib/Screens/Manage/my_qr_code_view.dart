import 'package:flutter/material.dart';

class QrCodeView extends StatefulWidget {
  const QrCodeView({Key? key}) : super(key: key);

  @override
  State<QrCodeView> createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> {
  final double coverHeight = 340;
  final double profileHeight = 510;
  @override
  Widget build(BuildContext context) {
    final bottom = profileHeight / 2;
    final cliptop = coverHeight - profileHeight / 2;
    return Scaffold(
      body: SafeArea(
        child: Container(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      color: Color(0xff058DD1),
                      margin: EdgeInsets.only(bottom: bottom),
                      width: MediaQuery.of(context).size.width,
                      height: coverHeight,
                      child: Column(
                        children: [
                          Row(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, right: 20),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                icon: Icon(
                                  Icons.arrow_back_outlined,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, left: 60),
                              child: Text(
                                "My QR code",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    Positioned(
                        top: cliptop,
                        child: Card(
                          color: Colors.white,
                          child: Container(
                            height: 500,
                            width: 300,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Order Online",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Scan QR Code to see \nour Products ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Image.asset("assets/images/image7.png"),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Store link",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "collabact.io/mystore123",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff058DD1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.70,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Color(0xff058DD1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Text(
                                      "Print",
                                      textAlign: TextAlign.center,
                                      style: (TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        )),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
