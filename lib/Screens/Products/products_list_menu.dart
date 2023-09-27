import 'package:lets_do_somethings/Screens/Products/orders_list.dart';
import 'package:lets_do_somethings/models/products/products_menulist.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

class ProductsItemsList extends StatefulWidget {
  const ProductsItemsList({super.key});

  @override
  State<ProductsItemsList> createState() => _ProductsItemsListState();
}

class _ProductsItemsListState extends State<ProductsItemsList> {
  List<ProductsItem> myList = [
    ProductsItem(
      title: 'Jane Cooper',
      icon: 'icon1',
      action: GestureAction2.OpenScreen1,
    ),
    ProductsItem(
      title: 'Jane Cooper',
      icon: 'icon2',
      action: GestureAction2.OpenScreen1,
    ),
    ProductsItem(
      title: 'Jane Cooper',
      icon: 'icon3',
      action: GestureAction2.OpenScreen1,
    ),
    ProductsItem(
      title: 'Jane Cooper',
      icon: 'icon1',
      action: GestureAction2.OpenScreen1,
    ),
    ProductsItem(
      title: 'Jane Cooper',
      icon: 'ESP Lead',
      action: GestureAction2.OpenScreen1,
    ),
    ProductsItem(
      title: 'Jane Cooper',
      icon: 'ESP Lead',
      action: GestureAction2.OpenScreen1,
    ),
    ProductsItem(
      title: 'Jane Cooper',
      icon: 'ESP Lead',
      action: GestureAction2.OpenScreen1,
    ),
    ProductsItem(
      title: 'Jane Cooper',
      icon: 'ESP Lead',
      action: GestureAction2.OpenScreen1,
    ),
  ];

  Icon getIconForAction(String icon) {
    switch (icon) {
      case 'icon1':
        return Icon(Icons
            .food_bank_outlined); // Replace 'icon1' with your actual icon data.
      case 'icon2':
        return Icon(Icons
            .electric_bolt_outlined); // Replace 'icon2' with your actual icon data.
      case 'icon3':
        return Icon(Icons
            .gif_box_outlined); // Replace 'icon3' with your actual icon data.
      default:
        return Icon(Icons
            .health_and_safety_outlined); // You can set a default icon here if needed.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xffB1CAD8),
          ),
          child: Column(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              //
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fast Moving ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Products",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      "assets/images/foodproducts.png",
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              child: ListView.builder(
                itemCount: myList.length,
                itemBuilder: (BuildContext context, int index) {
                  final productItem = myList[index];
                  final iconWidget = getIconForAction(productItem.icon);

                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.5), //(x,y)
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: iconWidget,
                        title: Text(
                          productItem.title,
                          style: TextStyle(color: Colors.black),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                        onTap: () {
                          // Handle the onTap action here based on productItem.action
                          // For example:
                          switch (productItem.action) {
                            case GestureAction2.OpenScreen1:
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OnlyMyProductsList()));
                              break;
                            case GestureAction2.OpenScreen2:
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OnlyMyProductsList()));
                              break;
                            case GestureAction2.OpenScreen3:
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OnlyMyProductsList()));
                              break;
                          }
                        },
                        selected: true,
                      ),
                    ),
                  );
                },
              ),
            )
          ])),
    );
  }
}
