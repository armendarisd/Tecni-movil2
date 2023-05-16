import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/order_models.dart';
import '../models/service_model.dart';
import 'auth_controller.dart';

class ServicesController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection("orders");

    _authController.auth.userChanges().listen((user) {
      if (user != null) {
        orders.bindStream(getOrders());
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

  Stream<List<OrderModel>> getOrders() =>
      collectionReference.snapshots().map((query) => query.docs
          .map((item) => OrderModel.fromDocumentSnapshot(item))
          .toList());
}
