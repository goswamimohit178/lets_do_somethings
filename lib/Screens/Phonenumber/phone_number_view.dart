import 'package:lets_do_somethings/Loader/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Api Services/auth_token_api.dart';
import '../../Api Services/sign_up_api.dart';
import '../Otp_verfication/otp_view.dart';

class PhoneNumberView extends StatefulWidget {
  PhoneNumberView({
    Key? key,
  }) : super(key: key);

  @override
  State<PhoneNumberView> createState() => _PhoneNumberViewState();
}

bool _isAcceptTermsAndConditions = false;
final TextEditingController phoneController = TextEditingController();
String AUTHTOKEN = "";
String TOKENTYPE = "";
String LATITUDE = "";
String LONGITUDE = "";
String IP_ADDRESS = "";
String PF_VERSION = "";

class _PhoneNumberViewState extends State<PhoneNumberView> {
  bool loading = true;

  @override
  void initState() {
    loading = false;
    //   authToken();
    // TODO: implement initState
    super.initState();
    _loadAuthToken();
  }

  //  ***** Method  created for get authToken  ***** //
  void _loadAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      AUTHTOKEN = prefs.getString('access_token')!;
      TOKENTYPE = prefs.getString('token_type')!;
      LATITUDE = prefs.getString('Latitude')!;
      LONGITUDE = prefs.getString('Longitude')!;
      IP_ADDRESS = prefs.getString('IP_Address')!;
      PF_VERSION = prefs.getString('Platform_Version')!;
      print(AUTHTOKEN);
      print(TOKENTYPE);
      print(LATITUDE);
      print(LONGITUDE);
      print(IP_ADDRESS);
      print(PF_VERSION);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          // AUTHTOKEN == null || AUTHTOKEN!.isEmpty
          //     ? const Center(
          //   child: CircularProgressIndicator(),
          // ) :
          SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 150),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          SvgPicture.asset("assets/images/Phonenumber.svg"),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Enter your Phone Number",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Please confirm the country code and enter \n your Phone Number",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff94A7C0), fontSize: 14),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 20.0, left: 20.0),
                            height: 70,
                            child: IntlPhoneField(
                              keyboardType: TextInputType.phone,
                              controller: phoneController,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]+')),
                              ],
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(bottom: 10.0, left: 10.0),
                                fillColor: Color(0xffedf0f7),
                                focusColor: Color(0xffedf0f7),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffedf0f7)),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffedf0f7),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffedf0f7), width: 2),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              initialCountryCode: 'IN',
                              onChanged: (phone) {
                                print(phone.completeNumber);
                              },
                              onCountryChanged: (country) {
                                print('Country changed to: ' + country.name);
                              },
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: [
                                Checkbox(
                                    value: _isAcceptTermsAndConditions,
                                    onChanged: (value) {
                                      setState(() {
                                        _isAcceptTermsAndConditions =
                                            value ?? false;
                                      });
                                    }),
                                Text(
                                  'I accept the',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                                Text(
                                  ' Terms of Service ',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff058DD1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                                Text(
                                  'and',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                                Text(
                                  ' Privacy Policy.',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff058DD1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _isAcceptTermsAndConditions
                                  ? () async {
                                      if (phoneController.text.isEmpty) {
                                        final snackbar = SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                              'Please enter your Mobile No. ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackbar);
                                      } else {
                                        LoadingDialog.show(context);
                                        final SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        prefs.setString('mobileNo',
                                            phoneController.text.toString());
                                        signUpApi(context,
                                            mobilenumber:
                                                phoneController.text.toString(),
                                            AuthData: AUTHTOKEN.toString(),
                                            TokenType: TOKENTYPE.toString(),
                                            Latitude: LATITUDE,
                                            Longitude: LONGITUDE,
                                            IP: IP_ADDRESS,
                                            PF_VER: PF_VERSION);
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OtpVerificationView()));
                                        LoadingDialog.hide(context);
                                      }
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _isAcceptTermsAndConditions
                                    ? Color(0xff058DD1)
                                    : Colors.teal, // This is what you need!
                              ),
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: _isAcceptTermsAndConditions
                                        ? Colors.white
                                        : Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 55,
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
