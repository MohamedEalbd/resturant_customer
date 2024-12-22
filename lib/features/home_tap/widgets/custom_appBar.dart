import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final String text;
  final bool? active;

  const CustomButtonAppBar(
      {super.key,
      this.onPressed,
      required this.icon,
      required this.text,
      this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,color: active == true ? Color(0xff7C0631) :  Color(0xff7D7D7D),),
          //Text(text,style: TextStyle(color: active == true ? Colors.orange :  Colors.grey[800],),),
        ],
      ),
    );
  }
}
