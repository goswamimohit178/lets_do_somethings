import 'package:collabact/Screens/Manage/manage_view.dart';
import 'package:collabact/Screens/Orders/orders_view.dart';
import 'package:collabact/Screens/Products/product_view.dart';
import 'package:collabact/Screens/Profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Home/home_view.dart';

class MenuView extends StatefulWidget {
  const MenuView(int i, {Key? key}) : super(key: key);
  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  int _page = 0;
  late PageController pageController; //

  List<Widget> homeScreenItems = [
    HomeView(),
    OrdersView(),
    ProductView(),
    ManageView(),
    ProfileView(),
  ]; // for tabs animation
  
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  var primaryColor = Colors.blue;
  var secondaryColor = Color(0xff717d96);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: homeScreenItems,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        child: BottomNavigationBar(
          selectedLabelStyle: TextStyle(color: Colors.white),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Color(0xff717d96),
          backgroundColor: Colors.white,
          unselectedLabelStyle: TextStyle(color: Colors.white.withOpacity(.50)),
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/images/home.svg",
                  color: (_page == 0) ? primaryColor : secondaryColor),
              label: 'Home',
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/orders.svg",
                    color: (_page == 1) ? primaryColor : secondaryColor),
                label: 'Orders',
                backgroundColor: primaryColor),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/products.svg",
                    color: (_page == 2) ? primaryColor : secondaryColor),
                label: 'Products',
                backgroundColor: primaryColor),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/images/products.svg",
                  color: (_page == 3) ? primaryColor : secondaryColor),
              label: 'Manage',
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/images/person.svg",
                  fit: BoxFit.fill,
                  color: (_page == 4) ? primaryColor : secondaryColor),
              label: 'Account',
              backgroundColor: primaryColor,
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }
}
