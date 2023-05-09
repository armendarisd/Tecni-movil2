import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecnimas/src/models/service_model.dart';
import 'package:tecnimas/src/screen/details_screen.dart';

import 'package:tecnimas/src/widgets/custom_appbar.dart';
import 'package:tecnimas/src/widgets/custom_button.dart';

import '../controllers/services_controllert.dart';
import '../utils/responsive.dart';
import '../widgets/labor_card.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final ServicesController servicesController = Get.put(ServicesController());

  @override
  void initState() {
    servicesController.servicesList.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomPreferredSize(text: "Servicios"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 40,
                ),
                Wrap(
                  spacing: 30, // horizontal spacing between the containers
                  runSpacing: 20, // vertical spacing between the containers
                  children: [
                    ServicesCard(
                      service: ServiceModel(name: "Superficies", price: 90000),
                      iconData: Icons.ac_unit,
                      title: "Aire acondiconado",
                      onTap: () => {},
                      color: Colors.blue.shade700,
                    ),
                    ServicesCard(
                      service: ServiceModel(name: "Superficies", price: 100000),
                      iconData: Icons.event_seat,
                      title: "Muebles",
                      color: Colors.orange,
                    ),
                    ServicesCard(
                      service: ServiceModel(name: "Superficies", price: 70000),
                      iconData: Icons.curtains_closed,
                      title: "Cortinas",
                      color: Colors.cyan.shade400,
                    ),
                    ServicesCard(
                      service: ServiceModel(name: "Superficies", price: 120000),
                      iconData: Icons.bed,
                      title: "Colchones",
                      onTap: () => {},
                      color: Colors.blueGrey,
                    ),
                    ServicesCard(
                      service: ServiceModel(name: "Superficies", price: 50000),
                      iconData: Icons.clean_hands,
                      title: "Superficies",
                      onTap: () => {},
                      color: Colors.deepPurple,
                    ),
                  ],
                ),
                Container(
                  height: responsiveHeight(size: 50),
                ),
                CustomButton(
                  text: "Siguiente",
                  onPressed: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailsScreen()),
                    )
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
