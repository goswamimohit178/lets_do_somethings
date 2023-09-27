import 'dart:io';

import 'package:collabact/Screens/Home/home_view.dart';
import 'package:collabact/Screens/Qrcode_aadharcard/qr_code_pancard.dart';
import 'package:collabact/Screens/Qrcode_aadharcard/qrcode_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Api Services/home_page_api/candidate_kyc_api.dart';

class CandidateKYC extends StatefulWidget {
  const CandidateKYC({Key? key}) : super(key: key);

  @override
  State<CandidateKYC> createState() => _CandidateKYCState();
}

class _CandidateKYCState extends State<CandidateKYC> {
  File? _imageAadharcard;
  File? _imagepancard;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset("assets/images/Frame2.svg"),
            const Text(
              "Complete your KYC to continue",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    "Photo",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Text(
                    "Validate",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (() async {
                  await ImageAadharcardDialogbox();
                  setState(() {
                    _imageAadharcard;
                  });
                }),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffCBD2E0), width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: _imageAadharcard == null
                              ? Image.asset(
                                  "assets/images/aadhaarcard.png",
                                  width: 40,
                                  height: 40,
                                )
                              : Image.file(
                                  _imageAadharcard!,
                                  width: 40,
                                  height: 40,
                                )),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Aadhar Card",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Spacer(),
                      Checkbox(
                        shape: CircleBorder(),
                        activeColor: Color(0xff16B31A),
                        value: is_checkedaadharphoto,
                        onChanged: (bool? value) {
                          setState(() {
                            is_checkedaadharphoto = value!;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Checkbox(
                        shape: CircleBorder(),
                        activeColor: Color(0xff16B31A),
                        value: is_checkedaadhar,
                        onChanged: (bool? value) {
                          setState(() {
                            is_checkedaadhar = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (() async {
                  await ImagePancardDialogBox();
                  setState(() {
                    _imagepancard;
                  });
                }),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffCBD2E0), width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: _imagepancard == null
                              ? Image.asset(
                                  "assets/images/pan-card.png",
                                  width: 40,
                                  height: 40,
                                )
                              : Image.file(
                                  _imagepancard!,
                                  width: 50,
                                  height: 50,
                                )),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Pan Card",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Spacer(),
                      Checkbox(
                        shape: CircleBorder(),
                        activeColor: Color(0xff16B31A),
                        value: is_checkedpancardphoto,
                        onChanged: (bool? value) {
                          setState(() {
                            is_checkedpancardphoto = value!;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Checkbox(
                        shape: CircleBorder(),
                        activeColor: Color(0xff16B31A),
                        value: is_checkedpancard,
                        onChanged: (bool? value) {
                          setState(() {
                            is_checkedpancard = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                candidateKycApi(context);
              },
              child: Container(
                margin:
                    EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
                width: MediaQuery.of(context).size.width * 0.90,
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xff058DD1),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "Proceed to KYC ",
                    textAlign: TextAlign.center,
                    style: (TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// AadharCard Dialog Box ///
  Future ImageAadharcardDialogbox() {
    return showDialog(
        context: this.context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Choose Your Option",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (() async {
                            selectImageFromCamera();
                          }),
                          child: Container(
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  size: 50,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Camera",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QRViewExample()),
                            );
                          },
                          child: Container(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/qr-code1(traced).svg",
                                width: 50,
                                height: 50,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "QR Code",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  /* Pancard Dialog Box */

  Future ImagePancardDialogBox() {
    return showDialog(
        context: this.context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Choose Your Option",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (() async {
                            selectImageFromCamera1();
                          }),
                          child: Container(
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  size: 50,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Camera",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (() async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const QRViewPancard()),
                            );
                          }),
                          child: Container(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/qr-code1(traced).svg",
                                width: 50,
                                height: 50,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "QR Code",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
  //* Pancard Dialog Box Complete(finish) */

  //** AadharCard select Image Function */

  Future selectImageFromCamera() async {
    try {
      final imgAadharcard =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (imgAadharcard == null) return;
      File? img = File(imgAadharcard.path);
      img = await _cropImage1(imageFile: img);
      setState(() {
        _imageAadharcard = img;
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  //** PanCard select Image Function */

  Future selectImageFromCamera1() async {
    try {
      final imgpancard =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (imgpancard == null) return;
      File? img = File(imgpancard.path);
      img = await _cropImage1(imageFile: img);
      setState(() {
        _imagepancard = img;
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage1({required File imageFile}) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: Colors.blue,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
        ]);
    print("croppedImage => ${croppedImage}");
    if (croppedImage == null) return null;
    print("CroppedImage.path => ${croppedImage.path}");
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('cropImage_path', croppedImage.path.toString());
    return File(croppedImage.path);
  }
}
