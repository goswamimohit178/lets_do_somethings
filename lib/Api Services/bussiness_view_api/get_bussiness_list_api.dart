// import 'dart:convert';
// import 'package:lets_do_somethings/Api%20Response/bussiness_page_response/bussiness_sigment_response.dart';
// import 'package:lets_do_somethings/Api%20Response/bussiness_page_response/get_%20bussiness_response.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../api_main.dart';
//
//
// // class BussinessSigmnetRepository {
// //////////    *****    Method create for call signupApi  *****  ///////
// Future <GetBussinessListResponse> getBussinessList(String SIGMENT_ID) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String AUTHTOKEN = prefs.getString('access_token')!;
//   String TOKENTYPE = prefs.getString('token_type')!;
//   String url = '${ApiConstants.BASE_URL + ApiConstants.GET_BUSSINESS_LIST + "?SId=$SIGMENT_ID"} ';
//   print(url);
//   // ***** Sending some data in headers  ***** ///
//   Map<String, String> header = {
//     "Authorization": "$TOKENTYPE ${AUTHTOKEN.toString()}",
//     "Content-Type": "application/json",
//   };
//   final response =
//   await http.get(Uri.parse(url), headers: header);
//
//   var body = json.decode(response.body);
//   if (response.statusCode == 200) {
//
//     var result = jsonDecode(response.body);
//     print("BUSSINESS LIST FOUND ! => $result");
//
//     var getBussinessListResponse = GetBussinessListResponse.fromJson(result);
//
//
//     return GetBussinessListResponse.fromJson(jsonDecode(response.body));
//   } else {
//     final snackbar = SnackBar(
//         backgroundColor: Colors.red,
//         content: Text(
//           'No Bussiness Sigment Found!',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
//         ));
//     // ScaffoldMessenger.showSnackBar(snackbar);
//     throw Exception('Failed to load data');
//   }
// }
// // }
