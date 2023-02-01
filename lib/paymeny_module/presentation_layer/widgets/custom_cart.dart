import 'package:e_commerce_app/paymeny_module/domain_layer/entities/cart.dart';
import 'package:e_commerce_app/paymeny_module/presentation_layer/controllers/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication_module/presentation_layer/widgets/text_widget.dart';
import '../../../core/utils/app_colors.dart';

class CustomCart extends StatelessWidget {
  final Cart model;
  const CustomCart({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 5, bottom: 10),
      child: Row(
        children: [
          Image(
            image: NetworkImage(
              model.product.image,
            ),
            width: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 15.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              children: [
                TextWidget(
                  text: model.product.name,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  lines: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            int quantity = model.quantity;
                            quantity--;
                            BlocProvider.of<PaymentCubit>(context).updateCart(
                              cartId: model.id,
                              quantity: quantity,
                            );
                          },
                          icon: const CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.myWhite,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Icon(
                                Icons.minimize_rounded,
                                color: AppColors.textBodyMediumColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextWidget(
                            text: model.quantity.toString(),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            lines: 1),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          onPressed: () {
                            int quantity = model.quantity;
                            quantity++;
                            BlocProvider.of<PaymentCubit>(context).updateCart(
                              cartId: model.id,
                              quantity: quantity,
                            );
                          },
                          icon: const CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.myWhite,
                            child: Icon(
                              Icons.add,
                              color: AppColors.textBodyMediumColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<PaymentCubit>(context)
                              .addOrDeleteFromCart(
                            productId: model.product.id,
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                        color: AppColors.textBodyMediumColor),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
