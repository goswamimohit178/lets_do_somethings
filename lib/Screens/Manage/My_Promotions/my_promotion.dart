import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyPromotionView extends StatefulWidget {
  const MyPromotionView({Key? key}) : super(key: key);

  @override
  State<MyPromotionView> createState() => _MyPromotionViewState();
}

class _MyPromotionViewState extends State<MyPromotionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xff058DD1),
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff058DD1),
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          "My Promotions",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context, true);
      //     },
      //     icon: Icon(
      //       Icons.arrow_back_outlined,
      //       color: Colors.white,
      //       size: 30,
      //     ),
      //   ),
      //   title: Text(
      //     "My Promotions",
      //     style: TextStyle(
      //         fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      //   ),
      //   backgroundColor: Colors.blue,
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "My Bussiness card",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              //height: 180,
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: (1 / .6),
                shrinkWrap: true,
                children: List.generate(6, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      color: Colors.grey[200],
                    ),
                  );
                }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 0.8,
                            color: Color(0xff058DD1),
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 10, right: 10),
                          child: Text(
                            "See All",
                            textAlign: TextAlign.center,
                            style: (TextStyle(
                                color: Color(0xff058DD1),
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "E-Commerce Banner",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              // height: 300,
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: (1 / .8),
                shrinkWrap: true,
                children: List.generate(6, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      color: Colors.grey[200],
                    ),
                  );
                }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 0.8,
                            color: Color(0xff058DD1),
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 10, right: 10),
                          child: Text(
                            "See All",
                            textAlign: TextAlign.center,
                            style: (TextStyle(
                                color: Color(0xff058DD1),
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Whatsapp Status",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 300,
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: (1 / 1.2),
                children: List.generate(6, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      color: Colors.grey[200],
                    ),
                  );
                }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 0.8,
                            color: Color(0xff058DD1),
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 10, right: 10),
                          child: Text(
                            "See All",
                            textAlign: TextAlign.center,
                            style: (TextStyle(
                                color: Color(0xff058DD1),
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
