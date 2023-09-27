import 'dart:convert';

import 'package:lets_do_somethings/Screens/Profile/My%20Leads/my_leads_add_remark.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../Api Response/my_lead_response/get_candidate_customer_lead_response.dart';
import '../../../Api Services/api_main.dart';
import 'my_leads_add_view.dart';

Map? CustomerLead_res;
List? CustomerLead_res_response;

class MyLeadsAllView extends StatefulWidget {
  const MyLeadsAllView({Key? key}) : super(key: key);

  @override
  State<MyLeadsAllView> createState() => _MyLeadsAllViewState();
}

class _MyLeadsAllViewState extends State<MyLeadsAllView> {
  // void refreshMyLeadsAddView() {
  //   setState(() {});
  // }

  bool state = false;
  @override
  void initState() {
    // TODO: implement initState
    getCandidateCustomerLead();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomerLead_res_response == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: ListView.builder(
                itemCount: CustomerLead_res_response!.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomerLead_res_response!.length != 0
                      ? Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.90,
                            // height: MediaQuery.of(context).size.height * 0.28,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Color(0xffCBD2E0))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          leading: Image.asset(
                                              "assets/images/Rectangle11.png"),
                                          title: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, top: 0),
                                            child: Text(
                                              CustomerLead_res_response![index]
                                                      ['CustomerName']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, top: 0),
                                            child: Text(
                                              "+91 ${CustomerLead_res_response![index]['ContactNo'].toString()}",
                                              style: TextStyle(
                                                  color: Color(0xff717D96),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          trailing: Icon(
                                            Icons.av_timer_sharp,
                                            color: Color(0xff058DD1),
                                            size: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16.0, bottom: 4),
                                          child: Text(
                                            "Remark",
                                            style: TextStyle(
                                                color: Color(0xff058DD1),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 16.0,
                                          ),
                                          child: Text(
                                            "${CustomerLead_res_response![index]['BusinessName'].toString()} ",
                                            style: TextStyle(
                                                color: Color(0xff717D96),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0, top: 20, bottom: 0),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const MyLeadsAddRemark()),
                                              );
                                            },
                                            child: Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.black12,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0, bottom: 0.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.add,
                                                      size: 18,
                                                      color: Color(0xff058DD1),
                                                    ),
                                                    Text(
                                                      "Add Remark",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff058DD1),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
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
                        )
                      : CircularProgressIndicator();
                }),
          );
  }

  Future<GetCandidateLeadRes> getCandidateCustomerLead() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String AUTHTOKEN = prefs.getString('access_token')!;
    String TOKENTYPE = prefs.getString('token_type')!;
    String url =
        '${ApiConstants.BASE_URL + ApiConstants.GET_CANDIDATE_CUSTOMER_LEAD + "?SId=0&CId=3303"}';
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
      print("CANDIDATE CUSTOMER LEAD FOUND! => $result");
      var getCustLeadResoourcesRes = GetCandidateLeadRes.fromJson(result);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        CustomerLead_res = jsonDecode(response.body);
        CustomerLead_res_response = CustomerLead_res!['CustomerLead'];
      });
      return GetCandidateLeadRes.fromJson(jsonDecode(response.body));
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
