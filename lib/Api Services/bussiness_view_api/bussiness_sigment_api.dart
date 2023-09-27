// import 'dart:convert';
// import 'package:collabact/Api%20Response/bussiness_page_response/bussiness_sigment_response.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../api_main.dart';
//
//
// //////////    *****    Method create for call GET BUSSINESS SIGMENT   *****  ///////
//  Future <BussinessSigmentResponse> getBussinessSigment() async {
//
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String AUTHTOKEN = prefs.getString('access_token')!;
//     String TOKENTYPE = prefs.getString('token_type')!;
//     String url = '${ApiConstants.BASE_URL + ApiConstants.GET_SIGMENT_LIST}';
//     // ***** Sending some data in headers  ***** ///
//     Map<String, String> header = {
//       "Authorization": "$TOKENTYPE ${AUTHTOKEN.toString()}",
//       "Content-Type": "application/json",
//     };
//     final response =
//     await http.get(Uri.parse(url), headers: header);
//
//     var body = json.decode(response.body);
//     print(body);
//     if (response.statusCode == 200) {
//       var result = jsonDecode(response.body);
//       print("BUSSINESS SIGMENT FOUND! => $result");
//       var bussinessSigmentResponse = BussinessSigmentResponse.fromJson(result);
//
//       // setState(() {
//       //
//       // });
//       final bussiness_sigment = BussinessSigmentResponse.fromJson(jsonDecode(response.body));
//       return BussinessSigmentResponse.fromJson(jsonDecode(response.body));
//     } else {
      /*final snackbar = SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'No Bussiness Sigment Found!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ));*/
//       // ScaffoldMessenger.showSnackBar(snackbar);
//       throw Exception('Failed to load data');
//     }
//   }
//
