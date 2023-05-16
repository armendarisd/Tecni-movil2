enum ServicesEnum {
  aires,
  muebles,
  camas,
  cortinas,
  superficies,
}

class ServiceModel {
  String name;
  int? quantity;
  double price;

  ServiceModel({required this.name, this.quantity, required this.price});

  factory ServiceModel.fromMap(Map<String, dynamic> data) {
    return ServiceModel(
        name: data['name'] as String,
        quantity: data['quantity'] as int,
        price: data['price'] as double);
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'quantity': quantity, 'price': price};
  }
}
