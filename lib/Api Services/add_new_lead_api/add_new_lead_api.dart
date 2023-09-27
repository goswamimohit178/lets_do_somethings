import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Api Response/my_lead_response/add_and_edit_customer_lead_ response.dart';
import '../api_main.dart';

//////////    ********    Method create for call verifyOtpApi  *********  ///////
Future<AddEditCustomerLeadRes> addEditNewCustomerLead(
  BuildContext context,
  f_Name,
  l_Name,
  phone_No,
  e_mail,
  s_Id,
  state_Id,
  city_Id,
) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String USERID = prefs.getString('CandidateUserId')!;
  String AUTHTOKEN = prefs.getString('access_token')!;
  String TOKENTYPE = prefs.getString('token_type')!;
  String url = '${ApiConstants.BASE_URL + ApiConstants.ADD_EDIT_CUSTOMER_LEAD}';
  print(url);
  Map<String, String> header = {
    "Authorization": "$TOKENTYPE ${AUTHTOKEN.toString()}",
    "Content-Type": "application/json",
  };
  final _body = jsonEncode({
    "ESPCustomer": {
      "CustomerId": 0,
      "CandidateUserId": USERID,
      "FirstName": f_Name.toString() == "" ? "__" : f_Name.toString(),
      "LastName": l_Name.toString() == "" ? "__" : l_Name.toString(),
      "ContactNo": phone_No.toString() == "" ? "__" : phone_No.toString(),
      "WhatsappNo": phone_No.toString() == "" ? "__" : phone_No.toString(),
      "EmailId": e_mail.toString() == "" ? "__" : e_mail.toString(),
      "SourceId": s_Id.toString() == "" ? "__" : s_Id.toString(),
      "Address": state_Id.toString() == "" ? "__" : state_Id.toString(),
      "CityId": state_Id.toString() == "" ? "__" : state_Id.toString(),
      "StateId": city_Id.toString() == "" ? "__" : city_Id.toString(),
      "PinCode": "<string>",
      "StatusID": "1",
      "IsActive": true
    },
    "ESPCustomerProduct": {
      "ESPCustomerProductDetailId": 0,
      "CustomerId": 0,
      "CandidateUserId": 0,
      "BusinessUserId": 0,
      "ProductId": 0,
      "SegmentId": 0,
      "Quantity": 0,
      "IsApprove": true
    },
    "CandidateUserId": 0
  });
  final response =
      await http.post(Uri.parse(url), headers: header, body: _body);
  var body = json.decode(response.body);
  print(_body);
  print(response.body);

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    print("ADD CUSTOMER LEAD  DATA $result");

    var otpVerifyResponse = AddEditCustomerLeadRes.fromJson(result);
    print(otpVerifyResponse.message);
    if (response.statusCode == 200) {
      final snackbar = SnackBar(
          backgroundColor: Color(0xff058DD1),
          content: Text(
            'New Lead Added SuccessFully !',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    return AddEditCustomerLeadRes.fromJson(jsonDecode(response.body));
  } else {
    final snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'Sorry ! Lead did not create!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    throw Exception('Failed to load data');
  }
}
