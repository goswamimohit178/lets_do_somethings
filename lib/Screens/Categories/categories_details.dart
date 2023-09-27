import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesDetails extends StatefulWidget {
  const CategoriesDetails({Key? key}) : super(key: key);

  @override
  State<CategoriesDetails> createState() => _CategoriesDetailsState();
}

class _CategoriesDetailsState extends State<CategoriesDetails> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      "assets/images/Rectangle1.png",
                      height: 160,
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                              title: Text(
                                "T-Shirt",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              trailing: Icon(Icons.more_vert)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 10),
                                child: RichText(
                                  text: TextSpan(
                                    text: "20 Items",
                                    style: TextStyle(
                                        color: Color(0xffA0ABC0),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "\nlisted",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffA0ABC0),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Transform.scale(
                                scale: .8,
                                child: CupertinoSwitch(
                                  activeColor: Color(0xff058DD1),
                                  value: state,
                                  onChanged: (value) {
                                    state = value;
                                    setState(
                                      () {},
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Color(0xffEDF0F7),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.ios_share,
                                    size: 20, color: Color(0xff058DD1)),
                                SizedBox(
                                  width: 1,
                                ),
                                Text(
                                  "Share Products",
                                  style: TextStyle(
                                      color: Color(0xff058DD1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
