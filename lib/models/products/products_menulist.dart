class ProductsItem {
  final String title;
  final String icon;
  final GestureAction2 action;

  ProductsItem({
    required this.title,
    required this.icon,
    required this.action,
  });
}

enum GestureAction2 { OpenScreen1, OpenScreen2, OpenScreen3 }
