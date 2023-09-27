import 'dart:convert';
import 'package:collabact/Api%20Services/api_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Api Response/verify_otp_response.dart';
import '../Screens/bottomNavigation/menu_view.dart';

//////////    ********    Method create for call verifyOtpApi  *********  ///////
Future<OtpVerifyResponse> verifyOtp(
  BuildContext context,
  String authtoken,
  String tokentype,
  String userid,
  String otpController,
) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
String  USERID = prefs.getString('CandidateUserId')!;
  String url = '${ApiConstants.BASE_URL + ApiConstants.OTP_VERIFICATION }';
  print(url);
  Map<String, String> header = {
    "Authorization": "$tokentype ${authtoken.toString()}",
    "Content-Type": "application/json",
  };
  final _body = jsonEncode({
    "CandidateUserId": USERID.toString(),
    "OTP": otpController,
  });
  final response =
      await http.post(Uri.parse(url), headers: header, body: _body);
  var body = json.decode(response.body);
  print(response.body);
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    print("OTP DATA $result");
    var otpVerifyResponse = OtpVerifyResponse.fromJson(result);
    print(otpVerifyResponse.message);
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MenuView(1)));
    }
    return OtpVerifyResponse.fromJson(jsonDecode(response.body));
  } else {
    final snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'OTP not valid !',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    throw Exception('Failed to load data');
  }
}
