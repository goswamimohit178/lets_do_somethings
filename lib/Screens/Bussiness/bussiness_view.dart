import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Api Response/bussiness_page_response/bussiness_sigment_response.dart';
import '../../Api Response/bussiness_page_response/get_ bussiness_response.dart';
import '../../Api Services/api_main.dart';
import 'bussiness_details.dart';

String? Bussiness_sigment_response;
Map? bussiness_sigment;
List? sigment_list_response;
String? Bussiness_list_response;
Map? bussiness_list;
List? bussiness_list_response;

class BussinessView extends StatefulWidget {
  const BussinessView({Key? key}) : super(key: key);

  @override
  State<BussinessView> createState() => _BussinessViewState();
}

class _BussinessViewState extends State<BussinessView> {
  String? SIGMENT_ID;
  bool  _bussilist= false;

  @override
  void initState() {
    // TODO: implement initState

    getBussinessSigment();
    getSigmentID();
    print("bussiness_sigment ${bussiness_sigment}");
    print("bussiness_list_response ${bussiness_list_response}");
    super.initState();
  }

  void getSigmentID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      SIGMENT_ID = prefs.getString('segment_Id')!;

      print("SIGMENT_ID => $SIGMENT_ID");
      getBussinessList(SIGMENT_ID.toString());
      print("bussiness_list_response ${bussiness_list_response}");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65,
            child: SigmnetContainer()),
        bussiness_list_response == null
            ? Center(child: CircularProgressIndicator()) : Container(
          width: MediaQuery.of(context).size.width,
          child: Column(children: [

            bussiness_list_response == null
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      children: [
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: bussiness_list_response!.length,
                            itemBuilder: (context, index) {
                              print(
                                  "BUSSINESS LIST LENGTH => ${bussiness_list_response!.length}");
                              return  Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Card(
                                  elevation: 4,
                                  child: Container(
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image(
                                              image: AssetImage(
                                                "assets/images/buss.png",
                                              ),
                                              width: double.maxFinite,
                                              fit: BoxFit.fitWidth),
                                          Row(
                                            children: [
                                              Expanded(
                                                  flex: 4,
                                                  child: Container(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          bussiness_list_response![
                                                                          index]
                                                                      [
                                                                      'CompanyName'] ==
                                                                  null
                                                              ? Text(
                                                                  "Company name not found !",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          15),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                )
                                                              : Text(
                                                                  "${bussiness_list_response![index]['CompanyName']}",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          15),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                ),
                                                          Text(
                                                            "${bussiness_list_response![index]['BrandName'] == null ? "Brand name not found!" : bussiness_list_response![index]['BrandName']}",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                    0xff717D96),
                                                                fontSize: 14),
                                                            textAlign:
                                                                TextAlign.start,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Container(
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffddfeef),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                             // for (int i=0;i<bussiness_list_response![index]['EarningRange_Min'].length;i++)
                                                              Text(
                                                                "₹${bussiness_list_response![index]['EarningRange_Min'] == null ? "20K " : bussiness_list_response![index]['EarningRange_Min'].toString()}- ${bussiness_list_response![index]['EarningRange_Max'] == null ? "30K" : bussiness_list_response![index]['EarningRange_Max']}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .green,

                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                              Text(
                                                                "per ${bussiness_list_response![index]['EarningRange_Unit'] == null ? "Month" : bussiness_list_response![index]['EarningRange_Unit']}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .green,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Divider(
                                            thickness: 1,
                                          ),
                                          GestureDetector(
                                            onTap: () async{
                                              print( "CompanyName=  ${bussiness_list_response![index]['CompanyName'].toString()+" BID ="+  bussiness_list_response![index]['BusinessUserId'].toString()}");
                                             // getBussinessDetails(context, bussiness_list_response![index]['BusinessUserId'].toString() );
                                            await  Navigator.push(
                                                  context, MaterialPageRoute(builder: (context) => BussinessDetails(bussiness_list_response![index]['CompanyName'].toString(), bussiness_list_response![index]['BusinessUserId'].toString())));
                                            },

                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0, bottom: 10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "More Info",
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 17),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward,
                                                    size: 18,
                                                    color: Colors.blue,
                                                  )
                                                ],
                                                // Text("More Info")
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              );
                            })
                      ],
                    ),
                  )
          ]),
        ),
      ],
    );
  }

  Widget SigmnetContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 50,
          child: sigment_list_response == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: sigment_list_response!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    print("LENGTH => ${sigment_list_response!.length}");
                    return sigment_list_response!.length > 0
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                             // color: Colors.grey,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xff058DD1),
                                  ),

                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      getBussinessList(
                                          sigment_list_response![index]
                                                  ["SegmentId"]
                                              .toString());
                                    },
                                    child: Text(
                                      "${sigment_list_response![index]["SegmentName"]}",
                                      style: TextStyle(
                                          color: Color(0xff058DD1),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  })),
    );
  }

  Widget BussinessContainerList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 400,
          child: bussiness_list_response == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: bussiness_list_response!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    print("LENGTH => ${bussiness_list_response!.length}");
                    return bussiness_list_response!.length > 0
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xff058DD1),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      getBussinessList(
                                          /*sigment_list_response![index]["SegmentId"].toString()*/
                                          "18");
                                    },
                                    child: Text(
                                      "${sigment_list_response![index]["SegmentName"]}",
                                      style: TextStyle(
                                          color: Color(0xff058DD1),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  })),
    );
  }

  Future<BussinessSigmentResponse> getBussinessSigment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String AUTHTOKEN = prefs.getString('access_token')!;
    String TOKENTYPE = prefs.getString('token_type')!;
    String url = '${ApiConstants.BASE_URL + ApiConstants.GET_SIGMENT_LIST}';
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
      print("BUSSINESS SIGMENT FOUND! => $result");
      var bussinessSigmentResponse = BussinessSigmentResponse.fromJson(result);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('segment_Id',
          bussinessSigmentResponse.lSegment![0].segmentId.toString());
      setState(() {
        bussiness_sigment = jsonDecode(response.body);
        sigment_list_response = bussiness_sigment!['lSegment'];
      });
      return BussinessSigmentResponse.fromJson(jsonDecode(response.body));
    } else {
      final snackbar = SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'No Bussiness Sigment Found!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ));
      // ScaffoldMessenger.showSnackBar(snackbar);
      throw Exception('Failed to load data');
    }
  }

  Future<GetBussinessListResponse> getBussinessList(String SIGMENT_ID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String AUTHTOKEN = prefs.getString('access_token')!;
    String TOKENTYPE = prefs.getString('token_type')!;
    String url =
        '${ApiConstants.BASE_URL + ApiConstants.GET_BUSSINESS_LIST+"?SId=$SIGMENT_ID"}';
    print(url);
    // ***** Sending some data in headers  ***** ///
    Map<String, String> header = {
      "Authorization": "$TOKENTYPE ${AUTHTOKEN.toString()}",
      "Content-Type": "application/json",
    };
    final response = await http.get(Uri.parse(url), headers: header);

    var body = json.decode(response.body);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      setState(() {
        bussiness_list = jsonDecode(response.body);
        bussiness_list_response = bussiness_list!['lBusiness'];
      });
      print("BUSSINESS LIST FOUND ! => $result");

      var getBussinessListResponse = GetBussinessListResponse.fromJson(result);
      return GetBussinessListResponse.fromJson(jsonDecode(response.body));
    } else {
      final snackbar = SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'No Bussiness Sigment Found!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ));
      // ScaffoldMessenger.showSnackBar(snackbar);
      throw Exception('Failed to load data');
    }
  }
}
