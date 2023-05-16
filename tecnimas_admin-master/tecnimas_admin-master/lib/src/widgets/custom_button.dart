import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/responsive.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final bool isSecondary;
  final bool enabled;
  final bool loading;
  final int? maxLines;
  final Widget? child;
  final double width;
  final double height;
  final double? fontSize;

  const CustomButton({
    Key? key,
    this.text,
    required this.onPressed,
    this.isSecondary = false,
    this.maxLines,
    this.child,
    this.enabled = true,
    this.loading = false,
    this.width = 200.0, // set default width
    this.height = 60.0,
    this.fontSize, // set default height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsiveHeight(size: height),
      width: responsiveWidth(size: width),
      child: InkWell(
          onTap: enabled == true && loading == false ? onPressed : null,
          child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSecondary ? Colors.blueGrey : Color(0xFF413c58),
                borderRadius: BorderRadius.circular(10),
              ),
              child: loading == true
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ))
                  : text == null
                      ? SizedBox()
                      : text != null
                          ? Text(
                              text!,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                fontSize:
                                    responsiveFontSize(fontSize ?? 20, null),
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          : child)),
    );
  }
}
