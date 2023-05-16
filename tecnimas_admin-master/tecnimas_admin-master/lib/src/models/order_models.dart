import 'package:cloud_firestore/cloud_firestore.dart';

import 'service_model.dart';

class OrderModel {
  double price;
  List<ServiceModel> services;
  String userName;
  String userID;
  DateTime date;
  String hour;
  String address;
  String phoneNumber;

  OrderModel(
      {required this.price,
      required this.services,
      required this.userName,
      required this.userID,
      required this.date,
      required this.hour,
      required this.address,
      required this.phoneNumber});

  factory OrderModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return OrderModel(
        price: data['price'] ?? 0,
        services: List<ServiceModel>.from(
          data['services'].map(
            (service) => ServiceModel.fromMap(service),
          ),
        ),
        userName: data['username'],
        userID: data['user_id'],
        date: data['date'].toDate(),
        hour: data['hour'],
        address: data['address'],
        phoneNumber: data['phone_number']);
  }

  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'services': services.map((service) => service.toMap()).toList(),
      'username': userName,
      'user_id': userID,
      'date': date,
      'hour': hour,
      'address': address,
      'phone_number': phoneNumber
    };
  }

  copyWith({
    double? price,
    List<ServiceModel>? services,
    String? userName,
    String? userID,
    DateTime? date,
    String? hour,
    String? address,
    String? phoneNumber,
  }) {
    return OrderModel(
      price: price ?? this.price,
      services: services ?? this.services,
      userName: userName ?? this.userName,
      userID: userID ?? this.userID,
      date: date ?? this.date,
      hour: hour ?? this.hour,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
