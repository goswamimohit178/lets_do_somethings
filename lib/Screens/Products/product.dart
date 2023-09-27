import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  onShareWithEmptyFields(BuildContext context) async {
    await Share.share("Products");
  }

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
                          ListTile(
                              title: Text(
                                "White T-Shirt",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                "Category",
                                style: TextStyle(
                                    color: Color(0xff717D96),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              trailing: Icon(Icons.more_vert)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: RichText(
                                  text: TextSpan(
                                    text: " ₹90 ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "105",
                                        style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffA0ABC0),
                                          fontSize: 16,
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
                            child: GestureDetector(
                              onTap: () {
                                onShareWithEmptyFields(context);
                              },
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
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
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
