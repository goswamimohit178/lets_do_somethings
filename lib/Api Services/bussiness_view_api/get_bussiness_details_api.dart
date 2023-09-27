// /*
// import 'dart:convert';
// import 'package:lets_do_somethings/Screens/Bussiness/bussiness_details.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:lets_do_somethings/Api%20Response/bussiness_page_response/bussiness_details_response.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../api_main.dart';
// Map? bussiness_details;
// List? bussiness_details_response;
// Future<BussinessDetailsResponse> getBussinessDetails( BuildContext context, String BusinessUserId) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String AUTHTOKEN = prefs.getString('access_token')!;
//   String TOKENTYPE = prefs.getString('token_type')!;
//   String url = '${ApiConstants.BASE_URL + ApiConstants.GET_BUSSINESS_DETAILS + "?BId=$BusinessUserId"} ';
//   // ***** Sending some data in headers  ***** ///
//   Map<String, String> header = {
//     "Authorization": "$TOKENTYPE ${AUTHTOKEN.toString()}",
//     "Content-Type": "application/json",
//   };
//   final response = await http.get(Uri.parse(url), headers: header);
//
//   var body = json.decode(response.body);
//   print(body);
//   if (response.statusCode == 200) {
//     var result = jsonDecode(response.body);
//     print("BUSSINESS DETAILS FOUND! => $result");
// // final    bussiness_details = jsonDecode(response.body);
//  //  final  bussiness_details_response = bussiness_details!['vBusinessDetail'];
//     var bussinessSigmentResponse = BussinessDetailsResponse.fromJson(result);
//     return BussinessDetailsResponse.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load data');
//
//   }
// }*/
