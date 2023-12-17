import 'package:flutter/material.dart';
class HeadersWidget extends StatelessWidget {
  const HeadersWidget({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(15),
      child: Text(
        title,
        style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),
      ),
    );
  }
}
