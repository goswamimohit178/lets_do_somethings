import 'package:flutter/material.dart';

class PreviewAndPay extends StatefulWidget {
  const PreviewAndPay({Key? key}) : super(key: key);

  @override
  State<PreviewAndPay> createState() => _PreviewAndPayState();
}

class _PreviewAndPayState extends State<PreviewAndPay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: GestureDetector(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: Color(0xfff18c16),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Vector (2).png',
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "My Credits",
                              textAlign: TextAlign.center,
                              style: (TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: Color(0xffedf0f7),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Group.png',
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Online Payment",
                              textAlign: TextAlign.center,
                              style: (TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff717d96),
                                  fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Broadcast Charges",
                textAlign: TextAlign.center,
                style: (TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ),
              Spacer(),
              Text(
                "₹1",
                textAlign: TextAlign.center,
                style: (TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Credits Discount",
                textAlign: TextAlign.center,
                style: (TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ),
              Spacer(),
              Text(
                "-₹0.25",
                textAlign: TextAlign.center,
                style: (TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Total Amount",
                textAlign: TextAlign.center,
                style: (TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
              Spacer(),
              Text(
                "₹0.75",
                textAlign: TextAlign.center,
                style: (TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 10,
            color: Color(0xffedf0f7),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "CAMPAIGN MESSAGE",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "I've made a simple example for you. When we click a tile, we just set the selected index to the index we clicked, and each tile looks at that to see if its the currently selected tile.",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/Vector.png',
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "SMS Broadcast",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/users.png',
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "New Customer(0)",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
