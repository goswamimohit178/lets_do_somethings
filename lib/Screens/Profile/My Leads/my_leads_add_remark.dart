import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:intl/intl.dart';

class MyLeadsAddRemark extends StatefulWidget {
  const MyLeadsAddRemark({Key? key}) : super(key: key);

  @override
  State<MyLeadsAddRemark> createState() => _MyLeadsAddRemarkState();
}

class _MyLeadsAddRemarkState extends State<MyLeadsAddRemark> {
  String? _messageSendTo = null;
  String? _UpdatedStatus = null;

  _makingPhoneCall() async {
    var url = Uri.parse("tel:8849951310");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color(0xffe6f3f9),
                      image: DecorationImage(
                        image: AssetImage("assets/images/Rectangle11.png"),
                        fit: BoxFit.fitHeight,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Ankita Williamson',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          '+91 9012345678',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: _makingPhoneCall,
                    child: Image.asset(
                      "assets/images/chatCall.png",
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            color: Colors.orange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Engaged",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      bottomUpdateStatusSheet(context);
                    },
                    child: const Text('Update Status'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text(
                              "12-Feb-2023",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Color(0xff058DD1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "I've made a simple example for and each tile looks at that to see if its the currently selected tile.",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 5),
                    child: Text(
                      "lets_do_somethings",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 1.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "I've made a simple example for and each tile looks at that to see if its the currently selected tile.",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text(
                              "01-Feb-2023",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 10),
                    child: Text(
                      "Bussiness",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 1.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "I've made a simple example for and each tile looks at that to see if its the currently selected tile.",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text(
                              "02-Mar-2023",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
      bottomSheet: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Container(
            height: 150,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Send Messages to",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          height: 45,
                          width: 120,
                          decoration: BoxDecoration(
                            //  color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none, // Remove the border
                                hintText: ("send to"),
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.grey,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 10.0,
                                ),
                              ),
                              isDense:
                                  true, // Align the list items to the leading side
                              value: _messageSendTo,
                              validator: (value) =>
                                  value == null ? "Orders Status " : null,
                              items: [
                                "lets_do_somethings",
                                "Business",
                                "ESP",
                                "Direct",
                              ].map((dynamic value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _messageSendTo = value! as String?;
                                  if (_messageSendTo != null) {
                                    print("Value+ $value");
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10, left: 10, right: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          height: 50,
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Type Message Here",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10, right: 10),
                        child: Container(
                          width: 30,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Image(
                              image: AssetImage("assets/images/tele1gram.png"),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void bottomUpdateStatusSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (Context) => Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text("Update Status",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffEDF0F7),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.5), //(x,y)
                        // blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none, // Remove the border
                        hintText: ("Your Status"),
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10.0,
                        ),
                      ),
                      isDense: true, // Align the list items to the leading side
                      value: _UpdatedStatus,
                      validator: (value) =>
                          value == null ? "Orders Status " : null,
                      items: [
                        "Engaged",
                        "Qualified",
                        "Unqualified",
                      ].map((dynamic value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _UpdatedStatus = value! as String?;
                          if (_UpdatedStatus != null) {
                            print("Value+ $value");
                          }
                        });
                      },
                    ),
                  ),
                ),
              ),
              ////////
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Follow Up Date",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  //  focusNode: AlwaysDisabledFocusNode(),
                  controller: Datecontroller,
                  decoration: InputDecoration(
                    hintText: "sep 1, 2030",
                    prefixIcon: Icon(Icons.calendar_month),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    filled: true,
                    fillColor: Color(0xffEDF0F7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Remark",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    filled: true,
                    fillColor: Color(0xffEDF0F7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.062,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blue,
                            side: BorderSide(
                              color: Colors.blue,
                            )),
                        onPressed: () {},
                        child: const Text('Cancel'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.062,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: const Text('Update'),
                      ),
                    ),
                  ),
                ],
              )
            ])));
  }

////////date function concept
  final TextEditingController Datecontroller = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: now,
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        Datecontroller
          ..text = DateFormat.yMMMd().format(selectedDate)
          ..selection = TextSelection.fromPosition(TextPosition(
              offset: Datecontroller.text.length,
              affinity: TextAffinity.upstream));
      });
    }
  }
}
