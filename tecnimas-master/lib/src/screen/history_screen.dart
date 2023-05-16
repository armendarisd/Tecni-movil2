import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecnimas/src/screen/services_screen.dart';

import 'package:tecnimas/src/widgets/custom_appbar.dart';
import 'package:tecnimas/src/widgets/custom_button.dart';

import '../controllers/services_controllert.dart';
import '../widgets/card_history.dart';

class HistoryScreen extends StatefulWidget {
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final ServicesController servicesController = Get.put(ServicesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomPreferredSize(text: "Historial"),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: servicesController.orders.length,
              itemBuilder: (context, index) {
                final order = servicesController.orders[index];
                return Container(child: cardHistory(order));
              },
            ),
          ),
          Container(
            height: 70,
          ),
          CustomButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ServicesScreen()),
              )
            },
            text: 'Realizar pedido',
          ),
          Container(
            height: 30,
          ),
        ],
      ),
    );
  }
}
