import 'dart:developer';
import 'package:intl/intl.dart'; // Importa el paquete intl

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tecnimas/src/models/service_model.dart';
import 'package:tecnimas/src/utils/responsive.dart';

import '../controllers/services_controllert.dart';

class ServicesCard extends StatefulWidget {
  final IconData? iconData;
  final String title;
  final String? text;
  final Color? color;
  final void Function()? onTap;
  final ServiceModel service;

  const ServicesCard(
      {super.key,
      this.iconData = Icons.abc,
      this.title = "",
      this.text = "",
      this.onTap,
      this.color,
      required this.service});

  @override
  State<ServicesCard> createState() => _ServicesCardState();
}

class _ServicesCardState extends State<ServicesCard> {
  bool _isSelected = false;

  final ServicesController controller = Get.put(ServicesController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;

          _isSelected
              ? controller.addService(ServiceModel(
                  name: widget.title, price: widget.service.price, quantity: 1))
              : controller.deleteElementsByName(widget.title);
        });

        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Container(
        height: responsiveHeight(size: 160),
        width: responsiveWidth(size: 130),
        decoration: BoxDecoration(
          border: Border.all(color: widget.color ?? Colors.black, width: 1.3),
          color: _isSelected ? Colors.blueGrey.shade100 : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Container(
              height: 39,
              width: 39,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: widget.color != null
                      ? widget.color!.withOpacity(0.3)
                      : Colors.white),
              child: Icon(
                size: 26,
                widget.iconData,
                color: widget.color,
              )),
          SizedBox(
            height: responsiveHeight(size: 10),
          ),
          Center(
            child: Column(
              children: [
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: (Colors.black)),
                ),
                Container(
                  height: 10,
                ),

// ...

                Text(
                  ' \$${NumberFormat('#,###').format(widget.service.price)}', // Agrega el símbolo de peso y formatea el número con separadores de miles
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: responsiveHeight(size: 15),
          ),
        ]),
      ),
    );
  }
}
