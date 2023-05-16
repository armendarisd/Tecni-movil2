import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/order_models.dart';
import '../utils/responsive.dart';

Container cardHistory(OrderModel order) {
  return Container(
    margin: EdgeInsets.only(top: 10, right: 10, left: 10),
    height: 440,
    width: 170,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Color(0xFFcef7a0).withOpacity(0.3),
      border: Border.all(
        color: Color(0xFF413c58),
        width: 2,
      ),
    ),
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Fecha   ${order.date.day}/${order.date.month}/${order.date.year}",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: responsiveFontSize(16, null),
                color: (Color(0xFF413c58)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Hora   ${order.date.hour}:${NumberFormat('##').format(order.date.minute)}",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: responsiveFontSize(16, null),
                color: (Color(0xFF413c58)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Servicios', // Agrega el símbolo de peso y formatea el número con separadores de miles
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: responsiveFontSize(16, null),
                color: (Color(0xFF413c58)),
              ),
            ),
          ),
          Column(
            children: order.services
                .map((service) => Text(
                      service.name,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w700,
                        fontSize: responsiveFontSize(16, null),
                        color: (Color(0xFF413c58)),
                      ),
                    ))
                .toList(),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Direccion: ${order.address}', // Agrega el símbolo de peso y formatea el número con separadores de miles
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: responsiveFontSize(16, null),
                color: (Color(0xFF413c58)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Estado: ${order.address}', // Agrega el símbolo de peso y formatea el número con separadores de miles
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: responsiveFontSize(16, null),
                color: (Color(0xFF413c58)),
              ),
            ),
          ),
        ],
      ),
      Column(
        children: [
          Divider(
            color: Color(0xFF413c58),
            thickness: 1.4,
          ),
          Center(
            child: Text(
              '\$${NumberFormat('#,###').format(order.price)}', // Agrega el símbolo de peso y formatea el número con separadores de miles
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: responsiveFontSize(26, null),
                color: (Color(0xFF413c58)),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    ]),
  );
}
