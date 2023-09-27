import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  void Function()? onTabfunction;
  String title;
  CustomButton({Key? key, required this.title, this.onTabfunction})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTabfunction,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff3484F0), borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 22),
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Text(
          widget.title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        )),
      ),
    );
  }
}
