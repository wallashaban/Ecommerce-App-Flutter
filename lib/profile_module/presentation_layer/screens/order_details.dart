import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/get_order_details.dart';
import 'package:e_commerce_app/paymeny_module/presentation_layer/controllers/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication_module/presentation_layer/widgets/text_widget.dart';
import '../../../core/utils/app_colors.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: AppColors.primaryColor,
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
          text: 'Order Details',
          fontSize: 22,
          fontWeight: FontWeight.normal,
          lines: 1,
          textColor: AppColors.textBodyMediumColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30.0,
        ),
        child: BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, state) {
            var cubit = BlocProvider.of<PaymentCubit>(context);
            if (state is GetOrderDetailsLoadingState) {
              return circularProgress();
            }
            //debugPrint('model ${cubit.orderProducts.length}');
            if (BlocProvider.of<PaymentCubit>(context).orderProducts.isEmpty) {
              return const Center(
                child: TextWidget(
                  text: 'Your order is empty',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.textBodyMediumColor,
                ),
              );
            }
            return Column(
              children: [
                Expanded(child: ListView.builder(
                  itemCount: cubit.orderProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return orderDetailsWidget(
                      cubit.orderProducts[index],context,
                    );
                  },
                ),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:20.0,horizontal: 50),
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                      const  TextWidget(text: 'Total :', fontSize: 20, fontWeight: FontWeight.bold,
                      lines: 1,textColor: AppColors.textBodyMediumColor,),
                         TextWidget(text: '${cubit.getOrderDetailsModel.data.total}LE', fontSize: 20, fontWeight: FontWeight.normal,
                      lines: 1,textColor: AppColors.primaryColor,),
                   ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget orderDetailsWidget(OrderProducts model,context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25,),
        color: AppColors.myWhite,
      ),
      child: Row(
        children: [
          Image(
            image: NetworkImage(model.image),
            width: 100,
            height: 100,
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.4,
            child: Column(
              children: [
                TextWidget(
                  text: model.name,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.textBodyMediumColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget(
                  text: '${model.price}LE',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.textBodyMediumColor,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          TextWidget(
            text: model.quantity.toString(),
            fontSize: 25,
            fontWeight: FontWeight.bold,
            lines: 1,
            textColor: AppColors.textBodyMediumColor,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
