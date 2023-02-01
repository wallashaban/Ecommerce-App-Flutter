import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/paymeny_module/presentation_layer/controllers/payment_cubit.dart';
import 'package:e_commerce_app/paymeny_module/presentation_layer/widgets/custom_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication_module/presentation_layer/widgets/main_button.dart';
import '../../../authentication_module/presentation_layer/widgets/text_widget.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/app_colors.dart';
import '../screens/check_out_screen.dart';

class CartWidgetScreen extends StatelessWidget {
  const CartWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount:
                  BlocProvider.of<PaymentCubit>(context).getCart.cart.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return CustomCart(
                  model: BlocProvider.of<PaymentCubit>(context)
                      .getCart
                      .cart[index],
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            color: AppColors.textBodyMediumColor,
            height: 2,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  text: 'Total',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.textBodyMediumColor,
                ),
                TextWidget(
                  text:
                      '${BlocProvider.of<PaymentCubit>(context).getCart.total}LE',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.textBodyMediumColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
            child: MainButton(
              text: 'Check Out',
              onClicked: () {
                push(
                  context: context,
                  screen: BlocProvider(
                    create: (context) => sl<PaymentCubit>(),
                    child: const CheckOutScreen(),
                  ),
                );
              },
              fontSize: 20,
              fontWeight: FontWeight.bold,
              btnColor: AppColors.myWhite,
              textColor: AppColors.textBodyMediumColor,
              height: 60,
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ),
        ],
      ),
    );
  }
}
