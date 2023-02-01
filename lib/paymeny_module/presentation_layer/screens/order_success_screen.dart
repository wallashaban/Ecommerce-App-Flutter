import 'package:e_commerce_app/paymeny_module/presentation_layer/widgets/empty_cart.dart';
import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SingleChildScrollView(child: EmptyCart(isOrder: true))),
    );
  }
}