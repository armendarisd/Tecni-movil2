import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/responsive.dart';

class CustomPreferredSize extends StatelessWidget
    implements PreferredSizeWidget {
  final String text;
  final List<Widget>? actions;
  final String? backGoRoute;
  final bool showBackArrow;
  final VoidCallback? onBackArrowPressed; // <-- Agrega esta variable

  const CustomPreferredSize({
    super.key,
    required this.text,
    this.actions,
    this.backGoRoute,
    this.showBackArrow = true,
    this.onBackArrowPressed,
  });

  @override
  Size get preferredSize => Size.fromHeight(responsiveHeight(size: 70));

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(responsiveHeight(size: 70)),
      child: AppBar(
        backgroundColor: const Color(0xFFcef7a0),
        leadingWidth: 47,
        actions: actions,
        leading: showBackArrow
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: (Color(0xFF413c58)),
                ),
                onPressed: () {
                  onBackArrowPressed
                      ?.call(); // <-- Llama la función antes de cambiar de ruta
                  if (Navigator.canPop(context)) {
                    Navigator.of(context).pop();
                  } else {}
                },
              )
            : null,
        title: Text(
          text,
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            fontSize: responsiveFontSize(32, null),
            color: (Color(0xFF413c58)),
          ),
        ),
        centerTitle: true,
        toolbarHeight: responsiveHeight(size: 70),
        shape: const Border(
            bottom: BorderSide(
          color: (Color(0xFF413c58)),
          width: 1,
        )),
        elevation: 4,
      ),
    );
  }
}
