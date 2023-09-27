import 'package:flutter/material.dart';

class TutorialsView extends StatefulWidget {
  const TutorialsView({Key? key}) : super(key: key);

  @override
  State<TutorialsView> createState() => _TutorialsViewState();
}

class _TutorialsViewState extends State<TutorialsView>
    with SingleTickerProviderStateMixin {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Color(0xff058DD1),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.18,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Text(
                          "Tutorials",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xff717D96),
                            size: 28,
                          ),
                          hintText: "Search Videos",
                          suffixIcon: Icon(
                            Icons.display_settings_sharp,
                            color: Color(0xff000000),
                            size: 28,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                          filled: true,
                          fillColor: Color(0xffF7F9FC),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 10, top: 20),
                child: Text(
                  "New Videos",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/Group32.png",
                    width: 120,
                    height: 80,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How to Staff Account & \nShare store access?",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1A202C),
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.16,
                          height: 28,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "01:15",
                              style: (TextStyle(
                                  color: Color(0xff058DD1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/Group32.png",
                    width: 120,
                    height: 80,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How to add shipping and\nlabel order invoice",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1A202C),
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.16,
                          height: 28,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "01:15",
                              style: (TextStyle(
                                  color: Color(0xff058DD1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/Group32.png",
                    width: 120,
                    height: 80,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How to add delivery time?",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1A202C),
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.16,
                          height: 28,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "01:15",
                              style: (TextStyle(
                                  color: Color(0xff058DD1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
