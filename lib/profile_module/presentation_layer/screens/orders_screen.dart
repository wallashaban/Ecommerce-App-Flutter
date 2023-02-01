import 'package:e_commerce_app/authentication_module/presentation_layer/widgets/main_button.dart';
import 'package:e_commerce_app/core/services/services_locator.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/get_order.dart';
import 'package:e_commerce_app/paymeny_module/presentation_layer/controllers/payment_cubit.dart';
import 'package:e_commerce_app/paymeny_module/presentation_layer/widgets/empty_cart.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/screens/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication_module/presentation_layer/widgets/text_widget.dart';
import '../../../core/utils/app_colors.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PaymentCubit>()..getOrders(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.primaryColor,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.textBodyMediumColor,
                ),
              ),
            ),
            title: const TextWidget(
              text: 'Orders',
              fontSize: 22,
              fontWeight: FontWeight.normal,
              lines: 1,
              textColor: AppColors.textBodyMediumColor,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
            child: BlocBuilder<PaymentCubit, PaymentState>(
              builder: (context, state) {
                var cubit = BlocProvider.of<PaymentCubit>(context);
                if (state is GetOrdersLoadingState) {
                  return circularProgress();
                }
                if (cubit.getOrdersModel.isEmpty) {
                  return const EmptyCart(
                    isOrder: true,
                  );
                } else {
                  return ListView.separated(
                    itemCount: cubit.getOrdersModel.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return ordersWidget(cubit.getOrdersModel[index], context);
                    },
                  );
                }
              },
            ),
          )),
    );
  }
}

Widget ordersWidget(GetOrder model, context) => InkWell(
      onTap: () {
        push(
          context: context,
          screen: BlocProvider(
            create: (context) =>
                sl<PaymentCubit>()..getOrderDetails(orderId: model.id),
            child: const OrderDetails(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
        decoration: BoxDecoration(
          color: AppColors.myWhite,
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  text: 'Date : ',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.textBodyMediumColor,
                ),
                TextWidget(
                  text: model.date,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.primaryColor,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  text: 'Status : ',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.textBodyMediumColor,
                ),
                TextWidget(
                  text: model.status,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.primaryColor,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  text: 'Total : ',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.textBodyMediumColor,
                ),
                TextWidget(
                  text: '${model.total.toInt()}LE',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.primaryColor,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            if (model.status == 'New')
              MainButton(
                text: 'Cansel Order',
                onClicked: () {
                  BlocProvider.of<PaymentCubit>(context)
                      .canselOrder(orderId: model.id);
                },
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 50,
                width: MediaQuery.of(context).size.width * 0.4,
                btnColor: AppColors.myWhite,
                textColor: AppColors.textBodyMediumColor,
              )
          ],
        ),
      ),
    );
