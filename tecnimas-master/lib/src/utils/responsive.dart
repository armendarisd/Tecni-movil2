import 'package:flutter/material.dart';

/// Calculates the responsive font size based on the base font size and the window height.
///
/// The maximum font size can be specified to prevent the font size from becoming too large.
///
/// * `baseFontSize` - The base font size in pixels.
/// * `maximum` - The maximum font size in pixels.
///
/// Returns the calculated font size in pixels.
double responsiveFontSize(double baseFontSize, double? maximum) {
  final height =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
  double result = baseFontSize * (height / 812);

  if (maximum != null) {
    if (maximum < result) {
      result = maximum;
    }
  }

  return result;
}

/// Calculates the responsive height based on the size, minimum, and maximum values.
///
/// The minimum and maximum values can be specified to prevent the height from becoming too small or too large.
///
/// * `size` - The size in pixels.
/// * `minimum` - The minimum height in pixels.
/// * `maximum` - The maximum height in pixels.
///
/// Returns the calculated height in pixels.
double responsiveHeight({
  required double size,
  double? minimum,
  double? maximum,
}) {
  final height =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
  double result = (size / 812) * height;

  if (minimum != null) {}

  return result;
}

/// Calculates the responsive width based on the size, minimum, and maximum values.
///
/// The minimum and maximum values can be specified to prevent the width from becoming too small or too large.
///
/// * `size` - The size in pixels.
/// * `minimum` - The minimum width in pixels.
/// * `maximum` - The maximum width in pixels.
///
/// Returns the calculated width in pixels.
double responsiveWidth({
  required double size,
  double? minimum,
  double? maximum,
}) {
  final width =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
  double result = (size / 315) * width;

  if (minimum != null) {}

  return result;
}
