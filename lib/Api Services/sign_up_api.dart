import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Api Response/sign_up_response.dart';
import '../Loader/loading_view.dart';
import 'api_main.dart';

//////////    *****    Method create for call signupApi  *****  ///////
Future<SignUpResponse> signUpApi(BuildContext context,
    {required String mobilenumber,
    required String AuthData,
    required String TokenType,
    required String Latitude,
    required String Longitude,
    required String IP,
      required String PF_VER,
    }) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
String   AUTHTOKEN = prefs.getString('access_token')!;
  String TOKENTYPE = prefs.getString('token_type')!;
  String LATITUDE = prefs.getString('Latitude')!;
  String  LONGITUDE = prefs.getString('Longitude')!;
  String url = '${ApiConstants.BASE_URL + ApiConstants.SIGN_UP}';
  // ***** Sending some data in headers  ***** ///
  Map<String, String> header = {
    "Authorization": "$TOKENTYPE ${AUTHTOKEN.toString()}",
    "Content-Type": "application/json",
  };
  // ***** Sending some data in body  ***** ///
  final _body = jsonEncode({
    "CandidateUserId": 0,
    "Longitude": LONGITUDE == "" ? "35.23325235" : LONGITUDE.toString(),
    "Latitude": LATITUDE == "" ? "25.1212412" : LATITUDE.toString() ,
    "IPAddress": IP.toString() == "" ? "127.0.0.1" :IP.toString() ,
    "IMEI": "867212047000867",
    "MobileVersion": PF_VER == "" ? "Android 12" : PF_VER.toString(),
    "MobileSDK": "jhgac",
    "Mobile": mobilenumber.toString(),
    "OTP": "887466"
  });
  final response =
      await http.post(Uri.parse(url), headers: header, body: _body);

  var body = json.decode(response.body);
  print(body);
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    print("SIGNUP DATA FOUND => $result");
    var signUpResponse = SignUpResponse.fromJson(result);
    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(
          "CandidateUserId", signUpResponse.candidateUserId.toString());
    }
    return SignUpResponse.fromJson(jsonDecode(response.body));
  } else {
    final snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'Mobile No. already Exsist !',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    throw Exception('Failed to load data');
  }
}
