// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:projefct/Admin/dbfuntio.dart';
// import 'dart:convert';
// import 'package:projefct/Cart_db/Cart_db.dart';
// import 'package:projefct/admindatabase/product.dart';
// import 'package:projefct/user/address/addresslist.dart';
// import 'package:projefct/user/cart/button.dart';
// import 'package:projefct/user/payment_page.dart';

// class CartPage extends StatefulWidget {
//   const CartPage({super.key});

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   late Box<CartItem> cartBox = Hive.box<CartItem>('cart');

//   @override
//   void initState() {
//     super.initState();
//     _openBox();
//   }

//   Future<void> _openBox() async {
//     cartBox = await Hive.openBox<CartItem>('cart');
//   }

//   void _deleteCartItem(CartItem cartItem) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Delete Cart Item'),
//           content: const Text('Do you want to delete this cart item?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('No'),
//             ),
//             TextButton(
//               onPressed: () {
//                 cartBox.delete(cartItem
//                     .key); // Delete the cart item from the box using its key
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Center(child: Text('Cart')),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ValueListenableBuilder<Box<CartItem>>(
//               valueListenable: cartBox.listenable(),
//               builder: (context, cartBox, _) {
//                 final cartItems = cartBox.values.toList();
//                 return ListView.builder(
//                   itemCount: cartItems.length,
//                   itemBuilder: (context, index) {
//                     final cartItem = cartItems[index];
//                     final img = cartItem.imageUrl;
//                     final imageReady = img != null ? base64Decode(img) : null;
//                     return ProductCards(
//                       imageUrl: imageReady != null
//                           ? base64Encode(imageReady)
//                           : null, // Convert Uint8List to base64-encoded string
//                       productName: cartItem.productName,
//                       productPrice: cartItem.productPrice,
//                       onDelete: () {
//                         setState(() {
//                           cartBox.deleteAt(
//                               index); // Delete the cart item from the box at the given index
//                         }); // Pass the cart item to delete
//                       },
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Total Price: ',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 ValueListenableBuilder<Box<CartItem>>(
//                   valueListenable: cartBox.listenable(),
//                   builder: (context, cartBox, _) {
//                     final cartItems = cartBox.values.toList();
//                     double totalPrice = 0.0;
//                     for (var item in cartItems) {
//                       final price = double.parse(item.productPrice);
//                       totalPrice += price;
//                     }
//                     return Text(
//                       '₹${totalPrice.toStringAsFixed(2)}',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               double totalPrice = 0.0;
//               final cartItems = cartBox.values.toList();
//               for (var item in cartItems) {
//                 final price = item.productPrice != null
//                     ? double.parse(item.productPrice)
//                     : 0.0;
//                 totalPrice += price;
//               }
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (context) =>
//               //         PaymentPage(totalAmount: totalPrice.toString()),
//               //   ),
//               // );
//               final cartItem = cartItems[cartItems.length - 1];
//               final img = cartItem.imageUrl;
//               final imageReady = img != null ? base64Decode(img) : null;
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => PaymentPage(
//                     totalAmount: totalPrice.toString(),
//                     name: cartItem.productName,
//                     image: imageReady!,
//                   ),
//                 ),
//               );
//             },
//             child: const Text('continue'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProductCards extends StatefulWidget {
//   final String? imageUrl;
//   final String productName;
//   final String productPrice;
//   final Function() onDelete;

//   const ProductCards({
//     super.key,
//     required this.imageUrl,
//     required this.productName,
//     required this.productPrice,
//     required this.onDelete,
//   });

//   @override
//   State<ProductCards> createState() => _ProductCardsState();
// }

// class _ProductCardsState extends State<ProductCards> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8, right: 8),
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: SizedBox(
//                       width: 90,
//                       height: 90,
//                       child: widget.imageUrl != null
//                           ? Image.memory(
//                               base64Decode(widget.imageUrl!),
//                               fit: BoxFit.cover,
//                             )
//                           : Container(),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           widget.productName,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const Text('1 piece', style: TextStyle(fontSize: 10)),
//                         const SizedBox(height: 8),
//                         Text(
//                           '₹${widget.productPrice}',
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 17,
//                           ),
//                         ),
//                         const Text(
//                           'In stock',
//                           style: TextStyle(color: Colors.green),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       IconButton(
//                         onPressed: widget.onDelete, // Corrected invocation
//                         icon: const Icon(Icons.delete),
//                       ),
//                       const QuantityButton(),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class QuantityButton extends StatefulWidget {
//   const QuantityButton({super.key});

//   @override
//   _QuantityButtonState createState() => _QuantityButtonState();
// }

// class _QuantityButtonState extends State<QuantityButton> {
//   int quantity = 1;

//   void incrementQuantity() {
//     setState(() {
//       quantity++;
//     });
//   }

//   void decrementQuantity() {
//     setState(() {
//       if (quantity > 1) {
//         quantity--;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 110,
//       height: 40,
//       decoration: BoxDecoration(
//         color: Colors.blue,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.grey,
//             offset: Offset(0, 1),
//             blurRadius: 4,
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           IconButton(
//             icon: const Icon(Icons.remove),
//             color: Colors.white,
//             onPressed: decrementQuantity,
//           ),
//           const SizedBox(width: 2),
//           Text(
//             quantity.toString(),
//             style: const TextStyle(fontSize: 15, color: Colors.white),
//           ),
//           const SizedBox(width: 2),
//           IconButton(
//             icon: const Icon(Icons.add),
//             color: Colors.white,
//             onPressed: incrementQuantity,
//           ),
//         ],
//       ),
//     );
//   }
// }
// // class CartPage extends StatefulWidget {
// //   const CartPage({Key? key});

// //   @override
// //   State<CartPage> createState() => _CartPageState();
// // }

// // class _CartPageState extends State<CartPage> {
// //   late Box<CartItem> cartBox = Hive.box<CartItem>('cart');
// //   double totalPrice = 0.0;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _openBox();
// //   }

// //   Future<void> _openBox() async {
// //     cartBox = await Hive.openBox<CartItem>('cart');
// //   }

// //   void _deleteCartItem(CartItem cartItem) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: const Text('Delete Cart Item'),
// //           content: const Text('Do you want to delete this cart item?'),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //               child: const Text('No'),
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 cartBox.delete(cartItem.key);
// //                 Navigator.of(context).pop();
// //               },
// //               child: const Text('Yes'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //  void _updateTotalPrice() {
// //   double newTotalPrice = 0.0;
// //   final cartItems = cartBox.values.toList();
// //   for (var item in cartItems) {
// //     final price = double.parse(item.productPrice) * item.quantity;
// //     newTotalPrice += price;
// //   }
// //   setState(() {
// //     totalPrice = newTotalPrice;
// //   });
// // }


// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.black,
// //         title: const Text('Cart'),
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: ValueListenableBuilder<Box<CartItem>>(
// //               valueListenable: cartBox.listenable(),
// //               builder: (context, cartBox, _) {
// //                 final cartItems = cartBox.values.toList();
// //                 return ListView.builder(
// //                   itemCount: cartItems.length,
// //                   itemBuilder: (context, index) {
// //                     final cartItem = cartItems[index];
// //                     final img = cartItem.imageUrl;
// //                     final imageReady = img != null ? base64Decode(img) : null;
// //                     return ProductCards(
// //                       imageUrl:
// //                           imageReady != null ? base64Encode(imageReady) : null,
// //                       productName: cartItem.productName,
// //                       productPrice: cartItem.productPrice,
// //                       quantity: cartItem.quantity.toInt(),
// //                       onDelete: () {
// //                         setState(() {
// //                           cartBox.deleteAt(index);
// //                           _updateTotalPrice();
// //                         });
// //                       },
// //                       onQuantityChanged: (newQuantity) {
// //                         setState(() {
// //                           cartItem.quantity = newQuantity;
// //                           cartBox.put(cartItem.key, cartItem);
// //                           _updateTotalPrice();
// //                         });
// //                       },
// //                     );
// //                   },
// //                 );
// //               },
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 const Text(
// //                   'Total Price: ',
// //                   style: TextStyle(
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 18,
// //                   ),
// //                 ),
// //                 Text(
// //                   '₹${totalPrice.toStringAsFixed(2)}',
// //                   style: const TextStyle(
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 18,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           ElevatedButton(
// //             onPressed: () {
// //               showDialog(
// //                 context: context,
// //                 builder: (BuildContext context) {
// //                   return AlertDialog(
// //                     title: const Text('Payment Successful'),
// //                     actions: [
// //                       TextButton(
// //                         onPressed: () {
// //                           Navigator.of(context).pop();
// //                         },
// //                         child: const Text('OK'),
// //                       ),
// //                     ],
// //                   );
// //                 },
// //               );
// //             },
// //             child: const Text('Pay Now'),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class ProductCards extends StatelessWidget {
// //   final String? imageUrl;
// //   final String productName;
// //   final String productPrice;
// //   final int quantity;
// //   final VoidCallback onDelete;
// //   final Function(int) onQuantityChanged;

// //   const ProductCards({
// //     Key? key,
// //     required this.imageUrl,
// //     required this.productName,
// //     required this.productPrice,
// //     required this.quantity,
// //     required this.onDelete,
// //     required this.onQuantityChanged,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.only(left: 8, right: 8),
// //       child: Card(
// //         child: Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: Column(
// //             children: [
// //               Row(
// //                 children: [
// //                   ClipRRect(
// //                     borderRadius: BorderRadius.circular(10),
// //                     child: SizedBox(
// //                       width: 90,
// //                       height: 90,
// //                       child: imageUrl != null
// //                           ? Image.memory(
// //                               base64Decode(imageUrl!),
// //                               fit: BoxFit.cover,
// //                             )
// //                           : Container(),
// //                     ),
// //                   ),
// //                   const SizedBox(width: 10),
// //                   Expanded(
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text(
// //                           productName,
// //                           style: const TextStyle(
// //                             fontSize: 18,
// //                             fontWeight: FontWeight.w600,
// //                           ),
// //                           maxLines: 1,
// //                           overflow: TextOverflow.ellipsis,
// //                         ),
// //                         const Text('1 piece', style: TextStyle(fontSize: 10)),
// //                         const SizedBox(height: 8),
// //                         Text(
// //                           '₹${(double.parse(productPrice) * quantity).toStringAsFixed(2)}',
// //                           style: const TextStyle(
// //                             fontWeight: FontWeight.w600,
// //                             fontSize: 17,
// //                           ),
// //                         ),
// //                         const Text(
// //                           'In stock',
// //                           style: TextStyle(color: Colors.green),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   Column(
// //                     children: [
// //                       IconButton(
// //                         onPressed: onDelete,
// //                         icon: const Icon(Icons.delete),
// //                       ),
// //                       QuantityButton(
// //                         quantity: quantity,
// //                         onQuantityChanged: onQuantityChanged,
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class QuantityButton extends StatefulWidget {
// //   final int quantity;
// //   final Function(int) onQuantityChanged;

// //   const QuantityButton({
// //     Key? key,
// //     required this.quantity,
// //     required this.onQuantityChanged,
// //   }) : super(key: key);

// //   @override
// //   _QuantityButtonState createState() => _QuantityButtonState();
// // }

// // class _QuantityButtonState extends State<QuantityButton> {
// //   void incrementQuantity() {
// //     setState(() {
// //       widget.onQuantityChanged(widget.quantity + 1);
// //     });
// //   }

// //   void decrementQuantity() {
// //     setState(() {
// //       if (widget.quantity > 1) {
// //         widget.onQuantityChanged(widget.quantity - 1);
// //       }
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: 110,
// //       height: 40,
// //       decoration: BoxDecoration(
// //         color: Colors.blue,
// //         borderRadius: BorderRadius.circular(10),
// //         boxShadow: const [
// //           BoxShadow(
// //             color: Colors.grey,
// //             offset: Offset(0, 1),
// //             blurRadius: 4,
// //           ),
// //         ],
// //       ),
// //       child: Row(
// //         children: [
// //           IconButton(
// //             icon: const Icon(Icons.remove),
// //             color: Colors.white,
// //             onPressed: decrementQuantity,
// //           ),
// //           const SizedBox(width: 2),
// //           Text(
// //             widget.quantity.toString(),
// //             style: const TextStyle(fontSize: 15, color: Colors.white),
// //           ),
// //           const SizedBox(width: 2),
// //           IconButton(
// //             icon: const Icon(Icons.add),
// //             color: Colors.white,
// //             onPressed: incrementQuantity,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }