import 'package:flutter/material.dart';

class MonthlyDetails extends StatefulWidget {
  const MonthlyDetails({Key? key}) : super(key: key);

  @override
  State<MonthlyDetails> createState() => _MonthlyDetailsState();
}

class _MonthlyDetailsState extends State<MonthlyDetails> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.90,
          //  height: MediaQuery.of(context).size.height * 0.28,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 10),
                          child: Text(
                            "Basic",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            "For new businesses \nand influencers",
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
                          child: RichText(
                            text: TextSpan(
                              text: '₹599',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w500),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '/month',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff717D96),
                                      fontSize: 16,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                          ),
                          child: Text(
                            "Billed Yearly ₹6,499",
                            style: TextStyle(
                                color: Color(0xff717D96),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 20 ,bottom: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.80,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xff058DD1),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "Subscribe",
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
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.90,
          //  height: MediaQuery.of(context).size.height * 0.32,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.white,
                        ),
                        Text(
                          "Popular",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 10),
                          child: Text(
                            "Pro",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            "For new businesses \nand influencers",
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
                          child: RichText(
                            text: TextSpan(
                              text: '₹899',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w500),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '/month',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff717D96),
                                      fontSize: 16,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                          ),
                          child: Text(
                            "Billed Yearly ₹6,499",
                            style: TextStyle(
                                color: Color(0xff717D96),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 20, bottom: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.80,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xffF48C13),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "Subscribe",
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
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
