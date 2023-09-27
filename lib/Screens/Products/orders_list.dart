import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class OnlyMyProductsList extends StatefulWidget {
  const OnlyMyProductsList({super.key});

  @override
  State<OnlyMyProductsList> createState() => _OnlyMyProductsListState();
}

class _OnlyMyProductsListState extends State<OnlyMyProductsList> {
  //String? selectedValue = "All Customers";
  //bool onOffButtonState = false;
  List<bool> itemSwitchStates = List.generate(10, (index) => false);
  bool _checkedButton = false;
  String? _selectOrdersStatus = null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xff058DD1),
        //backgroundColor: Colors.red,
        elevation: 0,

        automaticallyImplyLeading: false,
        // centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff058DD1),
          statusBarIconBrightness: Brightness.light,
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: Text(
            "Your Orders",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
        color: Colors.grey.withOpacity(0.2),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              color: Color(0xff058DD1),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.09,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        // textAlign: TextAlign.right,
                        onChanged: (value) {
                          String st;
                          // searchData(st = value.trim().toLowerCase());
                          // Method For Searching
                        },
                        cursorColor: Color(0xff5067EB),
                        // maxLines: 2,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            suffixIcon: Container(
                                child: const Icon(
                              Icons.search,
                              color: Color(0xff90909A),
                            )),
                            filled: true,
                            hintText: "Search Products",
                            hintTextDirection: TextDirection.ltr,
                            hintStyle: const TextStyle(
                                color: Color(0xff90909A),
                                fontWeight: FontWeight.w400),
                            fillColor: Color(0xffF1EFFA),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Checkbox(
                      value: _checkedButton,
                      onChanged: (value) {
                        setState(() {
                          _checkedButton = value!;
                          if (_checkedButton) {
                            print("check on+ $value");
                          } else {
                            print("check off+ $value");
                          }
                        });
                      }),
                ),
                Text(
                  "My Products Only",
                  style: TextStyle(color: Colors.black),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    height: 45,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none, // Remove the border
                          hintText: ("Orders "),
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                        ),
                        isDense:
                            true, // Align the list items to the leading side
                        value: _selectOrdersStatus,
                        validator: (value) =>
                            value == null ? "Orders Status " : null,
                        items: [
                          "All",
                          "Pending",
                          "Accepted",
                          "Shipped",
                        ].map((dynamic value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectOrdersStatus = value! as String?;
                            if (_selectOrdersStatus != null) {
                              print("Value+ $value");
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.7,
                  // width: MediaQuery.of(context).size.width * 0.95,
                  child: GridView.builder(
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.5), //(x,y)
                                blurRadius: 2.0,
                              ),
                            ],
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/coffeemachine.jpg",
                                    ),
                                  )),
                                ),
                                SizedBox(height: 10),
                                Text("Non-stick Pan",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis)),
                                SizedBox(height: 5),
                                Container(
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: " ₹600 ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "750",
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
                                      Transform.scale(
                                        scale: .8,
                                        child: CupertinoSwitch(
                                          activeColor: Color(0xff058DD1),
                                          value: itemSwitchStates[index],
                                          onChanged: (value) {
                                            // onOffButtonState = value;
                                            setState(() {
                                              itemSwitchStates[index] = value;
                                              if (itemSwitchStates[index]) {
                                                print("Item $index is on");
                                              } else {
                                                print("Item $index is off");
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
