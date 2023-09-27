import 'package:lets_do_somethings/Screens/Manage/Create%20Campaign/preview_and_pay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'campaign_details.dart';
import 'choose_messages.dart';

class CreateCampaignView extends StatefulWidget {
  const CreateCampaignView({Key? key}) : super(key: key);

  @override
  State<CreateCampaignView> createState() => _CreateCampaignViewState();
}

class _CreateCampaignViewState extends State<CreateCampaignView> {
  int _currentStep = 0;

  List<Step> getSteps() => [
        Step(
            isActive: _currentStep >= 0,
            label: Text(
              "Choose\nMessaage",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue),
            ),
            title: Text(''),
            content: ChooseMessage()),
        Step(
            isActive: _currentStep >= 1,
            label: Text(
              "Campagin \nDetails",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: _currentStep >= 1 ? Colors.blue : Colors.black),
            ),
            title: Text(''),
            content: CampaignDetails()),
        Step(
            isActive: _currentStep >= 2,
            label: Text(
              "Preview \n& Pay",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: _currentStep >= 2 ? Colors.blue : Colors.black),
            ),
            title: Text(''),
            content: PreviewAndPay())
      ];

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
            "Create Campaign",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Theme(
          data: ThemeData(
            canvasColor: Colors.white,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Colors.blue,
                  secondary: Colors.blue,
                ),
          ),
          child: Stepper(
            elevation: 1,
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: _currentStep,
            controlsBuilder: (BuildContext context, ControlsDetails controls) {
              return const SizedBox.shrink();
            },
          ),
        ),
        bottomSheet: Container(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          if (_currentStep == 0) {
                            null;
                          } else {
                            setState(() => _currentStep -= 1);
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 2,
                                color: Color(0xff058DD1),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              "Previous",
                              textAlign: TextAlign.center,
                              style: (TextStyle(
                                  color: Color(0xff058DD1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          final isLastStep =
                              _currentStep == getSteps().length - 1;
                          if (isLastStep) {
                            print("Completed");
                          } else {
                            setState(() => _currentStep += 1);
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xff058DD1),
                              // border: Border.all(width: 2, color: Colors.red),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: _currentStep == 2
                                  ? Text(
                                      "Pay",
                                      textAlign: TextAlign.center,
                                      style: (TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                    )
                                  : Text(
                                      "Next",
                                      textAlign: TextAlign.center,
                                      style: (TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                    )),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
