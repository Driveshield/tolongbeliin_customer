
import 'package:flutter/material.dart';
// import '../../../lib_backup/OTP_Layout.dart';


class PrimaryButton extends StatelessWidget {
   PrimaryButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.onPressed,
    this.fontSize,
     this.fontWeight,
     this.textAlign, this.backgroundd, this.textcolor,
     required this.isPressed,

  });
  final String text;
  final double width;
  final double height;
  //final Color background;
  //final Color textcolor;
  final Function onPressed;
  final bool isPressed;
   double? fontSize = 16;
   FontWeight? fontWeight = FontWeight.w500;
  TextAlign? textAlign = TextAlign.center;
  Color? backgroundd = const Color(0xFF008037);//Colors.green.shade900; const Color(0xFF008037);
  Color? textcolor = Colors.black;

  @override
  Widget build(BuildContext context) {

    return  ElevatedButton(

      style: ElevatedButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size(width,height),
          backgroundColor: backgroundd,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          disabledBackgroundColor: Colors.green.shade100

      ),
      onPressed: (isPressed == true) ? () { onPressed(); } : null ,
      child: GestureDetector(
        onTap: (isPressed == true) ? () { onPressed(); } : null ,
        child: Text(
          text,
          textAlign: textAlign,
          style:  TextStyle(
              color: (isPressed == true) ? textcolor : Colors.grey,
              fontWeight: fontWeight,
              fontSize: fontSize,
      
          ),
        ),
      ),
    );
  }

}