import 'package:flutter/material.dart';
import '../utils/responsive.dart';

class MyTextField extends StatefulWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Color? backgroundColor;
  final String label;
  final bool? primary;
  final Color? labelColor;
  final double? labelSize;
  final Color? borderColor;
  final FocusNode? nextFocusNode;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final void Function()? suffixIconOnPressed;
  final bool readOnly;
  final String? hintText;
  final bool keepLabelOnTop;

  MyTextField({
    this.focusNode,
    this.controller,
    this.backgroundColor,
    this.label = "",
    this.primary = true,
    this.labelColor,
    this.labelSize,
    this.borderColor,
    this.nextFocusNode,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.suffixIconOnPressed,
    this.readOnly = false,
    this.hintText,
    this.keepLabelOnTop = false,
  });

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: responsiveWidth(size: 260),
      height: responsiveHeight(size: 70),
      child: TextFormField(
        readOnly: widget.readOnly,
        obscureText: widget.obscureText,
        focusNode: widget.focusNode,
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.backgroundColor ?? Color(0xFFEEE5E9),
          label: Text(
            widget.label,
            style: TextStyle(
              color: widget.labelColor ?? Color(0xFF413c58),
              fontSize: widget.labelSize ?? 18,
            ),
          ),
          alignLabelWithHint: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: widget.borderColor ?? Color(0xFF413c58),
              width: 2.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: widget.borderColor ?? Color(0xFF413c58),
              width: 2.5,
            ),
          ),
          suffixIcon: widget.suffixIcon != null
              ? IconButton(
                  icon: widget.suffixIcon!,
                  color: Color(0xFF413c58),
                  onPressed: widget.suffixIconOnPressed,
                )
              : null,
          hintText: widget.hintText,
          floatingLabelBehavior: widget.keepLabelOnTop
              ? FloatingLabelBehavior.always
              : FloatingLabelBehavior.auto,
        ),
        validator: widget.validator,
      ),
    );
  }
}
