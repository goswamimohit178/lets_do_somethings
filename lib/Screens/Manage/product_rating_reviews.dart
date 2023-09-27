import 'package:collabact/Screens/Manage/monthly.dart';
import 'package:collabact/Screens/Manage/quarterly_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductsRatingReview extends StatefulWidget {
  const ProductsRatingReview({Key? key}) : super(key: key);

  @override
  State<ProductsRatingReview> createState() => _ProductsRatingReviewState();
}

class _ProductsRatingReviewState extends State<ProductsRatingReview>
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
      backgroundColor:Color(0xffffffff) ,
      appBar: AppBar( backgroundColor: Color(0xff058DD1),
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:  Color(0xff058DD1),
          statusBarIconBrightness: Brightness.light,
        ),
        title:Text(
          "Product Rating & Reviews",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xff058DD1),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: CircleTabIndicator(color: Colors.white),
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.white,
                        tabs: <Widget>[
                          Row(
                            children: [
                              Tab(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Quarterly",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Tab(
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Text(
                                    "Monthly",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
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
                      Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        QuaterlyRating(),
                      ]),
                      Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        MonthlyDetails(),
                      ]),
                    ],
                    controller: _tabController,
                  ),
                ),
              ],
            ),
          ),
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
