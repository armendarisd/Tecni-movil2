import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecnimas/src/controllers/auth_controller.dart';
import 'package:tecnimas/src/screen/order_complete_screen.dart';

import '../models/order_models.dart';
import '../models/service_model.dart';

class ServicesController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection("orders");

    _authController.auth.userChanges().listen((user) {
      if (user != null) {
        orders.bindStream(getOrders(user.uid));
      } else {
        orders.value = [];
      }
    });
  }

  final _authController = Get.find<AuthController>();

  late CollectionReference collectionReference;

  RxList<OrderModel> orders = RxList<OrderModel>([]);

  var servicesList = <ServiceModel>[].obs;

  void addService(ServiceModel service) {
    servicesList.add(service);

    print(servicesList);

    print(getTotalCost());
  }

  void removeService(ServiceModel service) {
    servicesList.remove(service);
  }

  void deleteElementsByName(String name) {
    // Get the index of the element with the given name.
    int index = servicesList.indexWhere((service) => service.name == name);

    // If the element is found, remove it from the array.
    if (index != -1) {
      servicesList.removeAt(index);
    }
  }

  RxDouble totalCost = RxDouble(0.0);

  double getTotalCost() {
    double cost = servicesList.fold(
        0, (total, service) => total + service.price * service.quantity!);
    totalCost.value = cost;
    return cost;
  }

  void saveOrder(OrderModel order) {
    print(servicesList); // Add this line
    try {
      collectionReference.add(order.toMap()).whenComplete(() => {
            Get.snackbar(
              'Exito',
              "Se ha agregado el pedido",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            ),
            Get.off(MadeScreen())
          });
    } on FirebaseException catch (e) {
      Get.snackbar(
        'Error',
        "No se ha agregado el pedido ${e}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Stream<List<OrderModel>> getOrders(String user_id) => collectionReference
      .where('user_id', isEqualTo: user_id)
      .snapshots()
      .map((query) => query.docs
          .map((item) => OrderModel.fromDocumentSnapshot(item))
          .toList());
}
