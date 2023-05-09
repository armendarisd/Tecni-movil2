import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tecnimas/src/utils/responsive.dart';

class MenuCard extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final String? text;
  final Color? color;
  final void Function()? onTap;

  const MenuCard(
      {this.iconData = Icons.abc,
      this.title = "",
      this.text = "",
      this.onTap,
      this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: responsiveHeight(size: 240),
        width: responsiveWidth(size: 125),
        decoration: BoxDecoration(
          border: Border.all(color: color ?? Colors.black, width: 1.3),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(children: [
          SizedBox(
            height: 10,
          ),
          Container(
              height: 39,
              width: 39,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                      color != null ? color!.withOpacity(0.3) : Colors.white),
              child: Icon(
                size: 26,
                iconData,
                color: color,
              )),
          SizedBox(
            height: responsiveHeight(size: 10),
          ),
          Center(
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: (Colors.black)),
            ),
          ),
          SizedBox(
            height: responsiveHeight(size: 15),
          ),
          Container(
            width: responsiveWidth(size: 90),
            child: Text(
              text!,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: (Colors.black)),
            ),
          ),
        ]),
      ),
    );
  }
}
