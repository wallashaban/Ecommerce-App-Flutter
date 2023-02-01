import 'package:e_commerce_app/core/services/services_locator.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/paymeny_module/presentation_layer/controllers/payment_cubit.dart';
import 'package:e_commerce_app/paymeny_module/presentation_layer/widgets/cart_widget_screen.dart';
import 'package:e_commerce_app/paymeny_module/presentation_layer/widgets/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PaymentCubit>()..getCarts(),
      child: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<PaymentCubit>(context);
          if (state is GetCartLoadingState) {
            return circularProgress();
          } else if (cubit.getCart.cart.isEmpty) {
            return const EmptyCart();
          } else {
            return const CartWidgetScreen();
          }
        },
      ),
    );
  }
}
