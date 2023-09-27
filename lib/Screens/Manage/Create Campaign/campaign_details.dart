import 'package:flutter/material.dart';

class CampaignDetails extends StatefulWidget {
  const CampaignDetails({Key? key}) : super(key: key);

  @override
  State<CampaignDetails> createState() => _CampaignDetailsState();
}

class _CampaignDetailsState extends State<CampaignDetails> {
  String? selectedValue = "All Customers";
  late BankListDataModel _bankChoose;

  @override
  void initState() {
    super.initState();
    _bankChoose = bankDataList[0];
  }

  void _onDropDownItemSelected(BankListDataModel newSelectedBank) {
    setState(() {
      _bankChoose = newSelectedBank;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Campaign Name",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                initialValue: 'Arjun',
                style: new TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Email',
                  fillColor: Color(0xffEDF0F7),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Choose Customer",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              child: Center(
                child: Container(
                  //margin: EdgeInsets.only(left: 15, top: 10, right: 15),
                  child: FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                            hintText: "All Customers",
                            contentPadding: EdgeInsets.fromLTRB(12, 10, 20, 20),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<BankListDataModel>(

                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontFamily: "verdana_regular",
                            ),
                            hint: Text(
                              "Select Bank",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: "verdana_regular",
                              ),
                            ),

                            items: bankDataList
                                .map<DropdownMenuItem<BankListDataModel>>(
                                    (BankListDataModel value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(value.bank_name),
                                  ],
                                ),
                              );
                            }).toList(),
                            isExpanded: true,
                            isDense: true,
                            onChanged: (BankListDataModel? newSelectedBank) {
                              _onDropDownItemSelected(newSelectedBank!);
                            },
                            value: _bankChoose,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<BankListDataModel> bankDataList = [
  BankListDataModel("All Customers"),
  BankListDataModel("Arjun"),
  BankListDataModel("Rahul"),
];

class BankListDataModel {
  String bank_name;

  BankListDataModel(
    this.bank_name,
  );
}
