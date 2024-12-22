import 'package:flutter/material.dart';

class BuildButtonWidget extends StatelessWidget {
  const BuildButtonWidget({super.key,required this.txt,this.onTap});
  final String txt;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10.5),
        decoration: BoxDecoration(
          color: Color(0xff2B3D16),
          borderRadius: BorderRadius.circular(6)
        ),
        child: Text(txt,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
      ),
    );
  }
}
