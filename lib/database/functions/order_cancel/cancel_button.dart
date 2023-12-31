import 'package:flutter/material.dart';
import 'package:we_store/database/functions/order_cancel/cancel_functions.dart';
import 'package:we_store/database/functions/order_cancel/cancel_model.dart';
import 'package:we_store/database/functions/place_order/models.dart';

Future<void> cancelbtn(Oredrplace ordercanl, BuildContext context) async {
  final cancel = Cancelorder(
      name: ordercanl.productName,
      price: ordercanl.productPrice,
      details: ordercanl.productDetails,
      image: ordercanl.productImage,
      deliveryAddress: ordercanl.deliveryAddress,
      deliveryName: ordercanl.deliveryName,
      deliveryCity: ordercanl.deliveryCity,
      deliveryPhone: ordercanl.deliveryPhone,
      pincode: ordercanl.pincode,
      productCount: ordercanl.productCount.toString(),
      id: ordercanl.id);
  cancelthisorder(cancel);
  getcancel();
}
