import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import '../Api Response/auth_token_response.dart';
import '../Loader/loading_view.dart';
import '../Screens/Phonenumber/phone_number_view.dart';
import 'api_main.dart';

/////// ******* Method for get AuthToken  *******    ////////

Future<AuthTokenResponse> authToken() async {
  String url = "${ApiConstants.BASE_URL + ApiConstants.AUTH_TOKEN}";
  Map<String, String> header = {
    "Content-Type": "application/json",
  };
  final _body = jsonEncode(<String, String>{
    "grant_type": "client_credentials",
    "client_id": "0C98AD45BA5F91829B20A60E8915CFF7",
    "client_secret": "A376FE1333B262B3017AAD59AC559BF6"
  });
  final response =
      await http.post(Uri.parse(url), headers: header, body: _body);
  var body = json.decode(response.body);
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    print("DATA FOUND => $result");
    var authTokenResponse = AuthTokenResponse.fromJson(result);
    if (authTokenResponse != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('access_token', authTokenResponse.accessToken.toString());
      prefs.setString('token_type', authTokenResponse.tokenType.toString());
    } else {
      print("Data");
    }
    return AuthTokenResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

//
//
// Future<AuthTokenResponse>  authToken(BuildContext context) async {
//   final http.Response response = await http.post(
//     Uri.parse('https://lets_do_somethings.com/API_DEMO/Auth2/token'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       "grant_type": "client_credentials",
//       "client_id": "0C98AD45BA5F91829B20A60E8915CFF7",
//       "client_secret": "A376FE1333B262B3017AAD59AC559BF6"
//     }),
//   );
//
//   // Dispatch action depending upon
//   // the server response
//   if (response.statusCode == 200) {
//     print(AuthTokenResponse.fromJson(json.decode(response.body)));
//     return AuthTokenResponse.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Album loading failed!');
//   }
// }