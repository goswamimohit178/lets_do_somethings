import 'dart:io';
import 'package:collabact/Screens/Phonenumber/phone_number_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_imei/device_imei.dart';
import '../../Api Services/auth_token_api.dart';
import '../../Loader/loading_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final int _numPages = 3;
  PageController pageController = PageController();
  int _currentpage = 0;
  String? _currentAddress;
  Position? _currentPosition;

  //  ***** Method  created for change the current page ***** //
  onChanged(int index) {
    setState(() {
      _currentpage = index;
    });
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentpage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  //  *****  List Method  created for  Onboarding data  ***** //
  List<Map> onboardData = [
    {
      'title': 'India’s Highest Commission Earning Platform',
      'content':
          'CollabAct is an online platform that gives you an opportunity to start your own business. We do this by connecting sales partners with businesses.',
      'image': 'assets/images/Frame.svg'
    },
    {
      'title': 'Start your own business.',
      'content':
          'CollabAct can help you start your own business without any investment by giving you access to a wide range of products and services to sell. You can also choose to work with businesses that are a good fit for your skills and interests.',
      'image': 'assets/images/Frame_1.svg'
    },
    {
      'title': 'Register and Earn unlimited.',
      'content':
          'Create a free account and start earning commissions by selling products and services from a wide range of businesses. There is no limit to the amount of money that can be earned.It takes time and effort to build a successful business on CollabAct. ',
      'image': 'assets/images/Frame_2.svg'
    }
  ];

  //  ***** Method  created for Showing the Indicator of pages  ***** //
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 18.0 : 8.0,
      decoration: BoxDecoration(
          color: isActive ? Color(0xff3483EF) : Color(0xffD9D9D9),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    loading = false;
    _getCurrentPosition();
    super.initState();
    // authToken();
    printIps();
    initPlatformState();
  }

  String _platformVersion = 'Unknown';
  String? deviceImei;
  String? type;
  String message = "Please allow permission request!";
  DeviceInfo? deviceInfo;
  bool getPermission = false;
  bool isloading = false;
  final _deviceImeiPlugin = DeviceImei();

  //***** Platform messages are asynchronous, so we initialize in an async method.*****//
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _deviceImeiPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() async {
      _platformVersion = platformVersion;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('Platform Version', _platformVersion.toString());
      print("Platform Version: " + _platformVersion);
    });
  }

  //  ***** Method to get IP address of user device ***** //
  Future printIps() async {
    for (var interface in await NetworkInterface.list()) {
      print('== Interface: ${interface.name} ==');
      for (var addr in interface.addresses) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('IP_Address', addr.address.toString());
        print('${addr.address}');
      }
    }
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xffffffff),
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Stack(children: [
        PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: pageController,
          itemCount: onboardData.length,
          onPageChanged: onChanged,
          itemBuilder: (context, index) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 150),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        SvgPicture.asset(onboardData[index]['image']),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          onboardData[index]['title'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: Text(
                            onboardData[index]['content'],
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color(0xff94A7C0), fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ]);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 40.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(onboardData.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 150,
                    ),
                    height: 10,
                    width: (index == _currentpage) ? 20 : 10,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (index == _currentpage)
                          ? Color(0xffF18C16)
                          : Colors.black12,
                    ),
                  );
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16, bottom: 20),
                    child: FloatingActionButton(
                        onPressed: () async {
                          loading == true;
                          _getCurrentPosition();

                          LoadingDialog.show(context);
                          if (_currentPosition != null) {
                            //   authToken();
                            // LoadingDialog.show(context);
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('Latitude',
                                _currentPosition!.latitude.toString());
                            prefs.setString('Longitude',
                                _currentPosition!.longitude.toString());
                            print(
                                'Latitude: ${_currentPosition!.latitude ?? ""}');
                            print(
                                'Longitude: ${_currentPosition!.longitude ?? ""}');
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PhoneNumberView()));
                            LoadingDialog.hide(context);
                          } else {
                            LoadingDialog.hide(context);
                            final snackbar = SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  'Sorry ! Location not Fetched ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          }
                        },
                        child: loading == true
                            ? SizedBox(
                                height: 10,
                                width: 10,
                                child: CircularProgressIndicator(),
                              )
                            : Icon(
                                Icons.arrow_forward,
                              )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

//  ***** Handle Location Permission of any device  *****  //

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      bool isturnedon = (await Geolocator.openLocationSettings());
      if (isturnedon) {
        print("GPS device is turned ON");
      } else {
        print("GPS Device is still OFF");
      }
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

//   *****  Method for get current location of User  *****  //
  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  //  *****   Method for get address from lat lang  *****  ///
  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
