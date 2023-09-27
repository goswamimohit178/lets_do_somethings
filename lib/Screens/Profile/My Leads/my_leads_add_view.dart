import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Api Response/my_lead_response/get_city_list_response.dart';
import '../../../Api Response/my_lead_response/get_customer_lead_resources_response.dart';
import '../../../Api Response/my_lead_response/get_product_list_response.dart';
import '../../../Api Services/add_new_lead_api/add_new_lead_api.dart';
import '../../../Api Services/api_main.dart';
import 'my_leads_all_view.dart';
import 'myleads_view.dart';

Map? cust_lead_resoources_Res;
Map? product_list_Res;
Map? city_response;
List? city_list_res;
List? resources_list_response;
List? slProductList;
List? state_list_response;
List? bussiness_list_response;
List? lproduct_response;

class MyLeadsAddView extends StatefulWidget {
  const MyLeadsAddView({Key? key}) : super(key: key);

  @override
  State<MyLeadsAddView> createState() => _MyLeadsAddViewState();
}

class _MyLeadsAddViewState extends State<MyLeadsAddView> {
  final TextEditingController Datecontroller = TextEditingController();
  final TextEditingController fName_controller = TextEditingController();
  final TextEditingController lName_controller = TextEditingController();
  final TextEditingController phone_no_controller = TextEditingController();
  final TextEditingController email_controller = TextEditingController();
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

  @override
  void initState() {
    // TODO: implement initState
    getCustLeadResources();
    city_list_res?.clear();

    // var sources_list = cust_lead_resoources_Res?['objCustResource']['lcustomerLeadSource'];
    super.initState();
  }

  String? _selectResourcs = null;
  String? _selectState = null;
  String? _selectCity = null;
  String? _selectBussinessName = null;
  String? _selectcategory = null;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xff058DD1),
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff058DD1),
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          "Add New Lead",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: cust_lead_resoources_Res == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Text(
                          "First Name",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: TextFormField(
                          controller: fName_controller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter your first Name !';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.0),
                            filled: true,
                            fillColor: Color(0xffEDF0F7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Text(
                          "Last Name",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: TextFormField(
                          controller: lName_controller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter your Last Name !';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.0),
                            filled: true,
                            fillColor: Color(0xffEDF0F7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Text(
                          "Phone Number",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: TextFormField(
                          controller: phone_no_controller,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter your Contact No !';
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
                          ],
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.0),
                            filled: true,
                            fillColor: Color(0xffEDF0F7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: TextFormField(
                          controller: email_controller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter your Email !';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20.0),
                              filled: true,
                              fillColor: Color(0xffEDF0F7),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              hintText: "example @abc.com"),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Text(
                          "Source",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: const Color(0xffEDF0F7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                              ),
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(10),
                              icon: Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 30,
                              ),
                              validator: (value) => value == null
                                  ? 'Please select your Source !'
                                  : null,
                              value: _selectResourcs,
                              hint: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  'Select Source',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              items:
                                  resources_list_response!.map((dynamic value) {
                                return DropdownMenuItem(
                                    value: value['CustomerLeadSourceId']
                                        .toString(),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        value['CustomerLeadSourceName']
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ));
                              }).toList(),
                              // onTap: _onRefresh,
                              onChanged: (value) async {
                                print(value);
                                _selectResourcs = value.toString();
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Text(
                          "State",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: const Color(0xffEDF0F7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                              ),
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(10),
                              icon: Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 30,
                              ),
                              value: _selectState,
                              validator: (value) => value == null
                                  ? 'Please select your State !'
                                  : null,
                              hint: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Select state',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              items: state_list_response!.map((dynamic value) {
                                return DropdownMenuItem(
                                    value: value['StateId'].toString(),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        value['state_name'],
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ));
                              }).toList(),
                              onChanged: (value) async {
                                setState(() {
                                  _selectState = value
                                      .toString(); // Set the selected state
                                  _selectCity = null;
                                  // Reset city when state changes
                                });

                                if (_selectState != null) {
                                  await getCityList(State_id: value.toString());
                                  setState(() {});
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      city_list_res != null
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              child: Text(
                                "City / Village",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          : Container(),
                      city_list_res != null
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              child: Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: const Color(0xffEDF0F7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                    ),
                                    isExpanded: true,
                                    validator: (value) => value == null
                                        ? 'Please select your City/Village !'
                                        : null,
                                    borderRadius: BorderRadius.circular(10),
                                    icon: Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: 30,
                                    ),
                                    value: _selectCity,
                                    hint: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Select City',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    items: city_list_res!.map((dynamic value) {
                                      return DropdownMenuItem(
                                          value: value['Value'].toString(),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Text(
                                              value['Text'].toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ));
                                    }).toList(),
                                    onChanged: (value) async {
                                      print(value);
                                      _selectCity = value.toString();
                                      // _selectState = null;
                                      //_selectCity = null;
                                      // _selectCity = '';
                                      print("_selectCity $_selectCity");
                                      setState(() {});
                                    },
                                  ),
                                ),
                                ///////////////////////////////////////////////////////////
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          padding: EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 2, color: Color(0xffCBD2E0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 10, top: 10),
                                child: Text(
                                  "Bussiness",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Container(
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffEDF0F7),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                      ),
                                      isExpanded: true,
                                      borderRadius: BorderRadius.circular(10),
                                      icon: Icon(
                                        Icons.arrow_drop_down_sharp,
                                        size: 30,
                                      ),
                                      value: _selectBussinessName,
                                      hint: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          'Please Select Bussiness',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      items: bussiness_list_response!
                                          .map((dynamic value) {
                                        return DropdownMenuItem(
                                            value: value['BusinessName']
                                                .toString(),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Text(
                                                value['BusinessName']
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ));
                                      }).toList(),
                                      onChanged: (value) async {
                                        print(value);
                                        _selectBussinessName = value.toString();
                                        getBussinessProduct();

                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 10, top: 10),
                                child: Text(
                                  "Category ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              slProductList == null
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, top: 10),
                                      child: Container(
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffEDF0F7),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child:
                                              DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              enabledBorder: InputBorder.none,
                                            ),
                                            isExpanded: true,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            icon: Icon(
                                              Icons.arrow_drop_down_sharp,
                                              size: 30,
                                            ),
                                            value: _selectcategory,
                                            hint: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Text(
                                                'Select Category',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            items: slProductList!
                                                .map((dynamic value) {
                                              return DropdownMenuItem(
                                                  value:
                                                      value['Text'].toString(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: Text(
                                                      value['Text'].toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ));
                                            }).toList(),
                                            // onTap: _onRefresh,
                                            onChanged: (value) async {
                                              print(value);
                                              _selectcategory =
                                                  value.toString();
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Text(
                          "Remark",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.0),
                            filled: true,
                            fillColor: Color(0xffEDF0F7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Text(
                          "Follow Up Date",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: TextField(
                          readOnly: true,
                          onTap: () => _selectDate(context),
                          //  focusNode: AlwaysDisabledFocusNode(),
                          controller: Datecontroller,
                          decoration: InputDecoration(
                            hintText: "sep 1, 2030",
                            prefixIcon: Icon(Icons.calendar_month),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.0),
                            filled: true,
                            fillColor: Color(0xffEDF0F7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            addEditNewCustomerLead(
                              context,
                              fName_controller.text,
                              lName_controller.text,
                              phone_no_controller.text,
                              email_controller.text,
                              _selectResourcs,
                              _selectState,
                              _selectCity,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyLeadsView()),
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(0xff058DD1),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "Add",
                                textAlign: TextAlign.center,
                                style: (TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Future<GetCustLeadResoourcesRes> getCustLeadResources() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String AUTHTOKEN = prefs.getString('access_token')!;
    String TOKENTYPE = prefs.getString('token_type')!;
    String url = '${ApiConstants.BASE_URL + ApiConstants.GET_LEAD_RESOURCES}';
    // ***** Sending some data in headers  ***** ///
    Map<String, String> header = {
      "Authorization": "$TOKENTYPE ${AUTHTOKEN.toString()}",
      "Content-Type": "application/json",
    };
    final response = await http.get(Uri.parse(url), headers: header);

    var body = json.decode(response.body);
    print(body);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print("CUSTOMER LEAD RESOURCES FOUND! => $result");
      var getCustLeadResoourcesRes = GetCustLeadResoourcesRes.fromJson(result);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        cust_lead_resoources_Res = jsonDecode(response.body);
        resources_list_response =
            cust_lead_resoources_Res?['objCustResource']['lcustomerLeadSource'];
        state_list_response =
            cust_lead_resoources_Res?['objCustResource']['lstate'];
        bussiness_list_response =
            cust_lead_resoources_Res?['objCustResource']['lbusiness'];
        lproduct_response =
            cust_lead_resoources_Res?['objCustResource']['lproductStatus'];
      });
      return GetCustLeadResoourcesRes.fromJson(jsonDecode(response.body));
    } else {
      final snackbar = SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'No Bussiness Sigment Found!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ));
      // ScaffoldMessenger.showSnackBar(snackbar);
      throw Exception('Failed to load data');
    }
  }

  Future<ProductListResponse> getBussinessProduct() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String AUTHTOKEN = prefs.getString('access_token')!;
    String TOKENTYPE = prefs.getString('token_type')!;
    String url =
        '${ApiConstants.BASE_URL + ApiConstants.GET_PRODUCT_LIST + "?BId=13337"}';
    // ***** Sending some data in headers  ***** ///
    Map<String, String> header = {
      "Authorization": "$TOKENTYPE ${AUTHTOKEN.toString()}",
      "Content-Type": "application/json",
    };
    final response = await http.get(Uri.parse(url), headers: header);
    var body = json.decode(response.body);
    print(body);
    print(url);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print("PRODUCTS ACCORDING TO BUSSINESS FOUND! => $result");
      var getCustLeadResoourcesRes = ProductListResponse.fromJson(result);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        product_list_Res = jsonDecode(response.body);
        slProductList = product_list_Res?['slProduct'];
      });
      return ProductListResponse.fromJson(jsonDecode(response.body));
    } else {
      final snackbar = SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'No Bussiness Sigment Found!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ));
      // ScaffoldMessenger.showSnackBar(snackbar);
      throw Exception('Failed to load data');
    }
  }

  Future<CityListResponse> getCityList({required String State_id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String AUTHTOKEN = prefs.getString('access_token')!;
    String TOKENTYPE = prefs.getString('token_type')!;
    String url =
        '${ApiConstants.BASE_URL + ApiConstants.GET_CITY_LIST + "?SId=$State_id"}';
    // ***** Sending some data in headers  ***** ///
    Map<String, String> header = {
      "Authorization": "$TOKENTYPE ${AUTHTOKEN.toString()}",
      "Content-Type": "application/json",
    };
    final response = await http.get(Uri.parse(url), headers: header);

    var body = json.decode(response.body);
    print(body);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print("CITY LIST FOUND! => $result");
      var getCustLeadResoourcesRes = CityListResponse.fromJson(result);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        city_response = jsonDecode(response.body);
        city_list_res = city_response?['slCity'];
      });
      return CityListResponse.fromJson(jsonDecode(response.body));
    } else {
      final snackbar = SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'No CITY LIST Found!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ));
      throw Exception('Failed to load data');
    }
  }
}
