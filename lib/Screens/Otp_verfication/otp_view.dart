import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:sms_retriever_api_plus/sms_retriever_api_plus.dart';
import '../../Api Services/otp_verification_api.dart';
import '../../Api Services/re_send_otp_api.dart';
import '../bottomNavigation/menu_view.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({Key? key}) : super(key: key);

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  bool isChecked = false;
  final interval = const Duration(seconds: 1);
  bool countDownComplete = false;
  int _timerMaxSeconds = 120;
  int currentSeconds = 0;
  Timer? timer;

  String get timerText =>
      '${((_timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((_timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  //  ***** Method  created for Timer  ***** //
  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      if (_timerMaxSeconds != 0) {
        setState(() {
          _timerMaxSeconds--;
        });
      } else {
        setState(() {
          countDownComplete = true;
        });
      }
    });
  }

  String _signature = "";
  String _initSMSAPI = "";

  Future<void> getSignature() async {
    String signature = "";
    try {
      signature = await SmsRetrieverApiPlus.getSignature() ??
          'Unknown platform version';
    } catch (e) {
      debugPrint(e.toString());
    }
    if (!mounted) return;
    setState(() {
      _signature = signature;
    });
  }

  @override
  void initState() {
    _listenOtp();
    startTimeout();
    _custID();
    getSignature();
    getMessage();
    // TODO: implement initState
    super.initState();
  }


  //  ***** Method  created for Get the Message using initSMSAPI Only one's triger using get meaage ***** //
  Future<void> getMessage() async {
    String status =
        await SmsRetrieverApiPlus.initSMSAPI() ?? 'Unknown platform version';
    setState(() {
      _initSMSAPI = status;
    });
  }

  TextEditingController otpController = TextEditingController();
  String signature = "{{ app signature }}";
  String? USERID;
  String? AUTHTOKEN;
  String? TOKENTYPE;
  String? MOBILENO;

  //  ***** Method  created for Get Saved values by using SharedPreferences ***** //
  void _custID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      AUTHTOKEN = prefs.getString('access_token')!;
      TOKENTYPE = prefs.getString('token_type')!;
      MOBILENO = prefs.getString('mobileNo')!;
      USERID = prefs.getString('CandidateUserId')!;
      print("OTP SREEN ");
      print("AUTHTOKEN => $AUTHTOKEN");
      print("AUTHTOKEN => $TOKENTYPE");
      print("AUTHTOKEN => $MOBILENO");
      print("AUTHTOKEN => $USERID");

    });
  }

  void _listenOtp() async {
    await SmsAutoFill().listenForCode();
    print("OTP Listen is called");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffffffff) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              "Enter Verification Code",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              timerText,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            const Text(
              "We sent the verification code to your \n mobile Number",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff94A7C0), fontSize: 14),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Pinput(
                length: 6,
                controller: otpController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid OTP';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  " Didn't get the code?",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                MaterialButton(
                  child: Text(
                    'Resend Code',
                    style: TextStyle(
                        color: countDownComplete ? Colors.blue : Colors.black),
                  ),
                  onPressed:()  {
                    countDownComplete ? _resendCode : null;
                     reSendOtp(context, AUTHTOKEN.toString(), TOKENTYPE.toString(), MOBILENO.toString(), USERID.toString(),
                        );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Spacer(),
            InkWell(
              onTap: () async {
                signature = await SmsAutoFill().getAppSignature;
               if(otpController.text.isEmpty){
                 final snackbar = SnackBar(
                     backgroundColor: Colors.red,
                     content: Text(
                       'Please Enter your otp',
                       style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                     ));
                 ScaffoldMessenger.of(context).showSnackBar(snackbar);

               } else {
                 signature = await SmsAutoFill().getAppSignature;
                 verifyOtp(context, AUTHTOKEN.toString(), TOKENTYPE.toString(), USERID.toString(),
                     otpController.text.toString());
                 print(otpController.text);
                 final SharedPreferences prefs = await SharedPreferences.getInstance();
                 prefs.setString('otp', otpController.text);
                 if (otpController.text.isNotEmpty) {
                   prefs.setBool('otpVerified', true);
                 } else {
                   prefs.setBool('otpVerified', false);
                 }
               }
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width * 0.90,
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xff058DD1),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "Continue",
                    textAlign: TextAlign.center,
                    style: (TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  // ***** Method  created for Resend Otp ***** //
  void _resendCode() {
    //other code here
    setState(() {
      _timerMaxSeconds = 60;
      countDownComplete = false;
    });
  }
// ***** Method  created for cancel the timer when timer getting to out ***** //
  @override
  dispose() {
    timer!.cancel();
    SmsAutoFill().unregisterListener();
    print("Unregistered Listener");
    super.dispose();
  }
}
