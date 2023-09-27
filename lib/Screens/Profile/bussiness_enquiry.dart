import 'package:lets_do_somethings/Screens/Profile/My%20Leads/my_leads_add_remark.dart';
import 'package:lets_do_somethings/Screens/Profile/business_chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lets_do_somethings/models/myleads/mylead_all_model.dart';

class BussinessEnquiry extends StatefulWidget {
  const BussinessEnquiry({Key? key}) : super(key: key);

  @override
  State<BussinessEnquiry> createState() => _BussinessEnquiryState();
}

class _BussinessEnquiryState extends State<BussinessEnquiry> {
  List<ListItem> myList = [
    ListItem(
        title: 'Jane Cooper',
        subtitle: 'ESP Lead',
        imagePath: 'assets/images/Ellipse 17.png',
        onlineStatus: 'Engaged'),
    ListItem(
        title: 'Ankita Williamsonsssss',
        subtitle: 'Business Lead',
        imagePath: 'assets/images/Ellipse 18.png',
        onlineStatus: 'Qualified'),

    ListItem(
        title: 'Eleanor Pena',
        subtitle: 'lets_do_somethings Lead',
        imagePath: 'assets/images/Ellipse 19.png',
        onlineStatus: 'Engaged'),
    ListItem(
        title: 'Ralph Edwards',
        subtitle: 'Direct Lead',
        imagePath: 'assets/images/Ellipse 20.png',
        onlineStatus: 'Qualified'),
    ListItem(
        title: 'Cody Fisher',
        subtitle: 'Business Lead',
        imagePath: 'assets/images/Ellipse 21.png',
        onlineStatus: 'Engaged'),
    ListItem(
        title: 'Rahul Sharma',
        subtitle: 'lets_do_somethings Lead',
        imagePath: 'assets/images/Ellipse 22.png',
        onlineStatus: 'Qualified'),
    ListItem(
        title: 'Rahul Sharma',
        subtitle: 'lets_do_somethings Lead',
        imagePath: 'assets/images/Ellipse 22.png',
        onlineStatus: 'UnQualified'),
    ListItem(
        title: 'Jane Cooper',
        subtitle: 'ESP Lead',
        imagePath: 'assets/images/Ellipse 17.png',
        onlineStatus: 'Engaged'),
    ListItem(
        title: 'Ankita Williamsonsssss',
        subtitle: 'Business Lead',
        imagePath: 'assets/images/Ellipse 18.png',
        onlineStatus: 'Qualified'),

    ListItem(
        title: 'Eleanor Pena',
        subtitle: 'lets_do_somethings Lead',
        imagePath: 'assets/images/Ellipse 19.png',
        onlineStatus: 'Engaged'),
    ListItem(
        title: 'Ralph Edwards',
        subtitle: 'Direct Lead',
        imagePath: 'assets/images/Ellipse 20.png',
        onlineStatus: 'Qualified'),
    ListItem(
        title: 'Cody Fisher',
        subtitle: 'Business Lead',
        imagePath: 'assets/images/Ellipse 21.png',
        onlineStatus: 'Engaged'),
    ListItem(
        title: 'Rahul Sharma',
        subtitle: 'lets_do_somethings Lead',
        imagePath: 'assets/images/Ellipse 22.png',
        onlineStatus: 'Qualified'),
    ListItem(
        title: 'Rahul Sharma',
        subtitle: 'lets_do_somethings Lead',
        imagePath: 'assets/images/Ellipse 22.png',
        onlineStatus: 'UnQualified'),

    // Add more items with different actions
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      // appBar: AppBar(
      //   backgroundColor: Color(0xff058DD1),
      //   elevation: 0,
      //   centerTitle: true,
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarColor: Color(0xff058DD1),
      //     statusBarIconBrightness: Brightness.light,
      //   ),
      //   title: Text(
      //     "Bussiness Enquiry",
      //     style: TextStyle(
      //       fontSize: 18,
      //       color: Colors.white,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      // ),
      body: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = myList[index];

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: Container(
                height: 70,
                width: 60,
                decoration: BoxDecoration(
                  color: Color(0xffe6f3f9),
                  image: DecorationImage(
                    image: AssetImage(item.imagePath),
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    item.subtitle,
                    style: TextStyle(
                      color: Color(0xff717d96),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width: MediaQuery.of(context).size.width * 0.22,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange,
                          ),
                        ),
                        Text(
                          item.onlineStatus ?? '',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyLeadsAddRemark(),
                      // BusinessChatView(),
                    ));
              },
              selected: true,
            ),
          );
        },
      ),
    );
  }
}
