import 'package:flutter/material.dart';

class CotainerSetting extends StatelessWidget {
  CotainerSetting({super.key, required this.leadingIcon, required this.press, required this.size, required this.title, required this.trailingIcon});

  final Size size;
  final VoidCallback press;
  final String leadingIcon;
  final String title;
  final String trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.85,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 2,
            spreadRadius: 2,
            color: Colors.black,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: press,
        child: ListTile(
          dense: false,
          leading: Image.asset(leadingIcon),
          title: Text(title, style: TextStyle(fontSize: 20, color: Colors.amber, fontWeight: FontWeight.bold),),
          trailing: Image.asset(trailingIcon),
        ),
      ),
    );
  }
}
