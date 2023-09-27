import 'dart:convert';

import 'package:collabact/Api%20Services/bussiness_view_api/get_bussiness_details_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Api Response/bussiness_page_response/bussiness_details_response.dart';
import '../../Api Services/api_main.dart';

Map? bussiness_details;
List? bussiness_details_response;
String? companyName;
class BussinessDetails extends StatefulWidget {
  final String COMPANY_NAME;
  final String BUSSINESS_ID;
   BussinessDetails(  this.COMPANY_NAME, this.BUSSINESS_ID, {Key? key}) : super(key: key);
  @override
  State<BussinessDetails> createState() => _BussinessDetailsState();
}



class _BussinessDetailsState extends State<BussinessDetails> {
  bool descTextShowFlag = false;

  @override
  void initState() {
    // TODO: implement initState
    getBussinessDetails(context,widget.BUSSINESS_ID.toString() );
    super.initState();
  }

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
            "${widget.COMPANY_NAME} ",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: bussiness_details == null ? Center(
            child: CircularProgressIndicator()) : SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image(
                    image: AssetImage(
                      "assets/images/buss1.png",
                    ),
                    width: double.maxFinite,
                    fit: BoxFit.fitWidth),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: Text(
                  "${bussiness_details!["vBusinessDetail"]["BrandName"].toString() == "null" ? "" : bussiness_details!["vBusinessDetail"]["BrandName"].toString() }",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text(
                  "${bussiness_details!["vBusinessDetail"]["ProductShortDesc"].toString() == "null" ? "" :bussiness_details!["vBusinessDetail"]["ProductShortDesc"].toString()}",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 47,
                  decoration: BoxDecoration(
                    color: Color(0xffddfeef),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                              height: 47,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                              ),
                              child: Center(
                                  child: Text(
                                    "₹",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )))),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Earning Range: ₹${bussiness_details!["vBusinessDetail"]["EarningRange_Min"].toString() == "null" ? "20K" :bussiness_details!["vBusinessDetail"]["EarningRange_Min"].toString()  } - ₹${bussiness_details!["vBusinessDetail"]["EarningRange_Max"].toString() == "null" ? "50K" : bussiness_details!["vBusinessDetail"]["EarningRange_Max"].toString() } ',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: Text(
                  "About Us",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  children: <Widget>[
                    bussiness_details!["vBusinessDetail"]["BusinessDescription"] != null ?  Text(
                      bussiness_details!["vBusinessDetail"]["BusinessDescription"].toString().replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' '),
                      maxLines: descTextShowFlag ? 8 : 2,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ) : Text(
                      "Description is not Found !",
                      maxLines: descTextShowFlag ? 8 : 2,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          descTextShowFlag = !descTextShowFlag;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            descTextShowFlag
                                ? Text(
                              "Show Less",
                              style: TextStyle(color: Colors.blue),
                            )
                                : Text("Show More",
                                style: TextStyle(color: Colors.blue))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: Text(
                  "Products",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  // height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      width: double.maxFinite,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0,
                                            bottom: 20.0,
                                            left: 10.0,
                                            right: 10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Icon(
                                                    Icons.close,
                                                    size: 25,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(10),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                "assets/images/fiona.png"),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        '1Ltr Keratin Hair Treatment Kit',
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w500,
                                                            fontSize: 16),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Product Details',
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(top: 5),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'There’s nothing quite so moving as  "There’s nothing q supply romantics, they’ve been in abundant supply throughout history! From Rumi in the I am ok.',
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Benefits',
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "• ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "What conclusions can we draw fromcan we draw from the we draw from the implementation",
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "• ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "What conclusions can we drawcan we draw from from the we draw from the implementation",
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "• ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "What conclusions can we drawcan we draw from from the we draw from the implementation",
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/fiona.png"),
                                            fit: BoxFit.fill)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '1Ltr Keratin Hair\nTreatment Kit',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/Rectangle 46.png"),
                                          fit: BoxFit.fill)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Keratin Shampoo +\nConditioner 200ml',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  // height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/F1 2.png"),
                                          fit: BoxFit.fill)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Only Keratin \nTreatment -1 Ltr.',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/Rectangle 53.png"),
                                          fit: BoxFit.fill)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '200ml Hair \nTreatment Kit',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10, left: 20, right: 20),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.90,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff058DD1),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            "Request to Sell",
                            textAlign: TextAlign.center,
                            style: (TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<BussinessDetailsResponse> getBussinessDetails(BuildContext context,
      String BusinessUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String AUTHTOKEN = prefs.getString('access_token')!;
    String TOKENTYPE = prefs.getString('token_type')!;
    String url = '${ApiConstants.BASE_URL + ApiConstants.GET_BUSSINESS_DETAILS +
        "?BId=$BusinessUserId"} ';
    // ***** Sending some data in headers  ***** ///
    Map<String, String> header = {
      "Authorization": "$TOKENTYPE ${AUTHTOKEN.toString()}",
      "Content-Type": "application/json",
    };
    final response = await http.get(Uri.parse(url), headers: header);

    var body = json.decode(response.body);
    print(body);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print("BUSSINESS DETAILS FOUND! => $result");
      setState(() {
        bussiness_details = jsonDecode(response.body);
      });
      return BussinessDetailsResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}