import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecnimas/src/models/service_model.dart';

import 'package:tecnimas/src/widgets/custom_appbar.dart';
import 'package:tecnimas/src/widgets/custom_button.dart';
import 'package:tecnimas/src/widgets/custom_textfield.dart';

import '../controllers/auth_controller.dart';
import '../controllers/services_controllert.dart';
import '../models/order_models.dart';
import '../utils/responsive.dart';
import '../widgets/labor_card.dart';

import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final ServicesController servicesController = Get.find<ServicesController>();

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  late DateTime _selectedDate; // 1
  @override
  void initState() {
    // servicesController.servicesList.clear();
    _selectedDate = DateTime(
        DateTime.now().hour > 5 ? DateTime.now().year : DateTime.now().year,
        DateTime.now().hour > 5 ? DateTime.now().month : DateTime.now().month,
        DateTime.now().hour > 5 ? DateTime.now().day + 1 : DateTime.now().day,
        0,
        0,
        0,
        0); // Inicializa el date picker con la fecha actual

    super.initState();
  }

  void _selectDateTime() async {
    final DateTime now = DateTime.now();
    final DateTime lastDate = now.add(Duration(days: 7));
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(
        DateTime.now().hour > 5 ? DateTime.now().year : DateTime.now().year,
        DateTime.now().hour > 5 ? DateTime.now().month : DateTime.now().month,
        DateTime.now().hour > 5 ? DateTime.now().day + 1 : DateTime.now().day,
        0,
        0,
        0,
        0,
      ),
      firstDate: DateTime(
        DateTime.now().hour > 5 ? DateTime.now().year : DateTime.now().year,
        DateTime.now().hour > 5 ? DateTime.now().month : DateTime.now().month,
        DateTime.now().hour > 5 ? DateTime.now().day + 1 : DateTime.now().day,
        0,
        0,
        0,
        0,
      ),
      lastDate: lastDate,
    );
  }

  void _selectHour() async {
    if (_selectedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final DateTime pickedDateTime = DateTime(
          _selectedDate.year,
          _selectedDate.month,
          _selectedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        if (pickedDateTime != _selectedDate) {
          setState(() {
            _selectedDate = pickedDateTime;
            print(_selectedDate);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();

    return Scaffold(
      appBar: const CustomPreferredSize(text: "Ubicación y hora"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 40,
                ),
                Container(
                  height: 60,
                ),
                MyTextField(
                  label: "Telefono",
                  textEditingController: _phoneController,
                ),
                Container(
                  height: responsiveHeight(size: 15),
                ),
                MyTextField(
                  label: "Direccion",
                  textEditingController: _addressController,
                ),
                Container(
                  height: responsiveHeight(size: 15),
                ),
                MyTextField(
                  label: "Fecha",
                  keepLabelOnTop: true,
                  textEditingController: _dateController,
                  suffixIcon: Icon(Icons.calendar_today),
                  suffixIconOnPressed: () => _selectDateTime(),
                  readOnly: true,
                  hintText: DateFormat('dd-MM-yyyy').format(_selectedDate),
                ),
                Container(
                  height: responsiveHeight(size: 15),
                ),
                MyTextField(
                  label: "Hora",
                  keepLabelOnTop: true,
                  textEditingController: _dateController,
                  suffixIcon: Icon(Icons.watch),
                  hintText: DateFormat('HH:MM').format(_selectedDate),
                  suffixIconOnPressed: () => {_selectHour()},
                  readOnly: true,
                ),
                Container(
                  height: responsiveHeight(size: 50),
                ),
                Column(
                  children: servicesController.servicesList.map((service) {
                    return Text(
                      "${service.name} :\$${NumberFormat('#,###').format(service.price)}",
                      style:
                          GoogleFonts.lato(fontSize: 15, color: Colors.black),
                    );
                  }).toList(),
                ),
                Container(
                  height: responsiveHeight(size: 10),
                ),
                Text(
                  'Total  \$${NumberFormat('#,###').format(servicesController.totalCost.value)}', // Agrega el símbolo de peso y formatea el número con separadores de miles
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.lato(fontSize: 15, color: Colors.black),
                ),
                Container(
                  height: responsiveHeight(size: 20),
                ),
                Container(
                  height: responsiveHeight(size: 20),
                ),
                CustomButton(
                  text: "Pedir servicio",
                  onPressed: () => {
                    if (_phoneController.text.trim() == "")
                      {
                        Get.snackbar("Campo faltante", "Número",
                            backgroundColor: Colors.red,
                            colorText: Colors.white)
                      }
                    else if (_addressController.text.trim() == "")
                      {
                        Get.snackbar("Campo faltante", "Dirección",
                            backgroundColor: Colors.red,
                            colorText: Colors.white)
                      }
                    else
                      {
                        servicesController.saveOrder(OrderModel(
                            price: servicesController.totalCost.value,
                            services: servicesController.servicesList,
                            phoneNumber: _phoneController.text,
                            userName:
                                _authController.auth.currentUser!.displayName!,
                            userID: _authController.auth.currentUser!.uid,
                            date: _selectedDate,
                            hour: DateFormat('HH:MM').format(_selectedDate),
                            address: _addressController.text))
                      }
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
