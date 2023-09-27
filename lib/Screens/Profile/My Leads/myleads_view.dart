import 'package:collabact/Screens/Profile/My%20Leads/my_leads_add_view.dart';
import 'package:collabact/Screens/Profile/bussiness_enquiry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_leads_all_view.dart';

class MyLeadsView extends StatefulWidget {
  const MyLeadsView({Key? key}) : super(key: key);

  @override
  State<MyLeadsView> createState() => _MyLeadsViewState();
}

class _MyLeadsViewState extends State<MyLeadsView>
    with SingleTickerProviderStateMixin {
  bool state = false;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
          "My Leads ",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Color(0xff058DD1),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 42,
                      child: TextField(
                        /// // obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: Color(0xff717D96),
                            size: 26,
                          ),
                          hintText: "Search Leads",
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                          filled: true,
                          fillColor: Color(0xffF7F9FC),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  TabBar(
                    isScrollable: true,
                    controller: _tabController,
                    indicator: CircleTabIndicator(color: Colors.white),
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.white,
                    tabs: <Widget>[
                      Row(
                        children: [
                          Tab(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "All",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Tab(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Follow Up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                // ignore: sort_child_properties_last
                children: [
                  BussinessEnquiry(),
                  MyLeadsAllView(),
                ],
                controller: _tabController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0, left: 15, right: 15),
              child: SizedBox(
                height: 50,
                width: 160,
                child: ElevatedButton(
                  onPressed: () {
                    // refreshMyLeadsAddView();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyLeadsAddView()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xffF48C13),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  child: Text(
                    "+ Add New Lead",
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
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator(
      {double width = 20, double height = 10, required Color color})
      : _painter = _CirclePainter(width, height);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double width;
  final double height;
  _CirclePainter(this.width, this.height)
      : _paint = Paint()
          ..color = Colors.white
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Path trianglePath = Path();
    if (cfg.size != null) {
      Offset centerTop =
          Offset(cfg.size!.width / 2, cfg.size!.height - height) + offset;
      Offset bottomLeft =
          Offset(cfg.size!.width / 2 - (width / 2), cfg.size!.height) + offset;
      Offset bottomRight =
          Offset(cfg.size!.width / 2 + (width / 2), cfg.size!.height) + offset;

      trianglePath.moveTo(bottomLeft.dx, bottomLeft.dy);
      trianglePath.lineTo(bottomRight.dx, bottomRight.dy);
      trianglePath.lineTo(centerTop.dx, centerTop.dy);
      trianglePath.lineTo(bottomLeft.dx, bottomLeft.dy);

      trianglePath.close();
      canvas.drawPath(trianglePath, _paint);
    }
  }
}
