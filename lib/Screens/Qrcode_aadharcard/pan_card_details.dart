import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xml/xml.dart';

class PanCardDetails extends StatelessWidget {
  QRViewController? controller;
  var code;

  PanCardDetails(this.code, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    try{
      XmlDocument xmlDocument = XmlDocument.parse(code.toString());
      XmlElement rootElement = xmlDocument.rootElement;
      String? uid = rootElement.getAttribute('Name / नाम');
      /*String? name = rootElement.getAttribute('name');
      String? gender = rootElement.getAttribute('gender');
      String? dob = rootElement.getAttribute('dob');
      String? co = rootElement.getAttribute('co');
      String? lm = rootElement.getAttribute('lm');
      String? pc = rootElement.getAttribute('pc');*/
      return Container(
        height: 300,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text("UID: ${code.toString()}".toUpperCase()),
           /* Text("Name: ${name.toString()}".toUpperCase()),
            Text("Father Name: ${co.toString()}".toUpperCase()),
            Text("Gender: ${gender.toString()}".toUpperCase()),
            Text("Date of birth: ${dob.toString()}".toUpperCase()),
            Text("Address: ${lm.toString()}".toUpperCase()),
            Text("Pin Code: ${pc.toString()}".toUpperCase()),*/
            Container(
                margin: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () async {
                    controller?.dispose();
                    final SharedPreferences pref = await SharedPreferences.getInstance();
                    pref.setString('AadhaarNo', uid.toString());
                    // pref.setString('AadhaarAddress', lm.toString());
                    // pref.setString('AadhaarName', name.toString());
                    // pref.setString('CandidateDOB', dob.toString());
                    Navigator.of(context).pop();

                  },
                  child: const Text("Save Details",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                )),
          ],
        ),
      );
    } on Exception catch(e){
      return const AlertDialog(content: Text("Please Scan Your PAN Card"));
    }
  }
}
