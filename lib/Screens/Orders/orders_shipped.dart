import 'package:flutter/material.dart';

class OrdersShippedDetails extends StatefulWidget {
  const OrdersShippedDetails({Key? key}) : super(key: key);

  @override
  State<OrdersShippedDetails> createState() => _OrdersShippedDetailsState();
}

class _OrdersShippedDetailsState extends State<OrdersShippedDetails> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.26,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 16,
                    top: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.watch_later_sharp,
                          size: 24, color: Color(0xffF18C16)),
                      SizedBox(
                        width: 1,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          " Shipped",
                          style: TextStyle(
                              color: Color(0xffF18C16),
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16, top: 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.16,
                    height: 28,
                    decoration: BoxDecoration(
                        color: Color(0xff1EB81C),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "New",
                        textAlign: TextAlign.center,
                        style: (TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    "assets/images/Rectangle.png",
                    height: 160,
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            "ORDER #870892",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Today, 12:00 PM",
                            style: TextStyle(
                                color: Color(0xff717D96),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, bottom: 4),
                          child: Text(
                            "Item: 1",
                            style: TextStyle(
                                color: Color(0xff717D96),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, bottom: 4),
                          child: Text(
                            "₹250",
                            style: TextStyle(
                                color: Color(0xff058DD1),
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                          ),
                          child: Text(
                            "Cash on Delivery",
                            style: TextStyle(
                                color: Color(0xff717D96),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
