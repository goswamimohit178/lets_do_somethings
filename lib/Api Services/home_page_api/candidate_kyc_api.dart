import 'dart:convert';
import 'package:collabact/Api%20Services/api_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Api Response/home_page_response/candidate_kyc_response.dart';

//////////    ********    Method create for CandidateApi *********  ///////

Future<CandidateKycResponse> candidateKycApi(
  BuildContext context,
) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String USERID = prefs.getString('CandidateUserId')!;
  String TOKEN_TYPE = prefs.getString('token_type')!;
  String ACCESS_TOKEN = prefs.getString('access_token')!;
  String AADHAAR_NO = prefs.getString('AadhaarNo')!;
  String AADHAAR_ADD = prefs.getString('AadhaarAddress')!;
  String AADHAAR_NAME = prefs.getString('AadhaarName')!;
  String DOB = prefs.getString('CandidateDOB')!;
  String AADHAR_FILE_NAME = prefs.getString('cropImage_path')!;
  String PAN_FILE_NAME = prefs.getString('cropImage_path')!;
  String PAN_CARD_NO = prefs.getString('PanCardNo')!;
  String FATHER_NAME = prefs.getString('FatherName')!;
  String url = '${ApiConstants.BASE_URL + ApiConstants.CANDIDATE_KYC}';
  print(url);
  Map<String, String> header = {
    "Authorization": "$TOKEN_TYPE ${ACCESS_TOKEN.toString()}",
    "Content-Type": "application/json",
  };

  Map<String, String> _body = <String, String>{
    "AadhaarAddress": AADHAAR_ADD.toString(),
    "AadhaarFileName": AADHAR_FILE_NAME.toString(),
    "CandidateAadhaarName": AADHAAR_NAME.toString(),
    "CandidateAadhaarNo": AADHAAR_NO.toString(),
    "CandidateDOB": DOB.toString(),
    "CandidatePANFHGName": FATHER_NAME.toString(),
    "CandidatePANName": AADHAAR_NAME.toString(),
    "CandidatePANNo": PAN_CARD_NO.toString(),
    "CandidateUserId": "15480",
    "PANFileName": PAN_FILE_NAME.toString(),
  };
  /*final _body = jsonEncode({
    "AadhaarAddress":AADHAAR_ADD.toString(),
    "AadhaarFileName":AADHAR_FILE_NAME.toString(),
    "CandidateAadhaarName":AADHAAR_NAME.toString(),
    "CandidateAadhaarNo":AADHAAR_NO.toString(),
    "CandidateDOB":DOB.toString(),
    "CandidatePANFHGName":FATHER_NAME.toString(),
    "CandidatePANName":AADHAAR_NAME.toString(),
    "CandidatePANNo":PAN_CARD_NO.toString(),
    "CandidateUserId":15480,
    "PANFileName":PAN_FILE_NAME.toString(),
  });*/

  http.Response response =
      await http.post(Uri.parse(url), headers: header, body: _body);
  var body = json.decode(response.body);
  print(body);
  print(_body);
  print("RES ${response.body}");
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    print("KYC DETAILS Found =>  $result");
    var otpVerifyResponse = CandidateKycResponse.fromJson(result);
    print(otpVerifyResponse.message);
    if (response.statusCode == 200) {
      final snackbar = SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'OTP not valid !',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    return CandidateKycResponse.fromJson(jsonDecode(response.body));
  } else {
    final snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'OTP not valid !',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    throw Exception();
  }
}
