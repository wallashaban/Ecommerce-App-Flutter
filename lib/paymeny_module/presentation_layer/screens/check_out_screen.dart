// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/paymeny_module/presentation_layer/controllers/payment_cubit.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/screens/shipping_addresses_screnn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication_module/presentation_layer/widgets/main_button.dart';
import '../../../authentication_module/presentation_layer/widgets/text_widget.dart';
import '../../../core/utils/app_colors.dart';
import 'order_success_screen.dart';

class CheckOutScreen extends StatelessWidget {
  final addressId;
  const CheckOutScreen({super.key, this.addressId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          text: 'Check Out',
          fontSize: 22,
          fontWeight: FontWeight.normal,
          lines: 1,
          textColor: AppColors.textBodyMediumColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, state) {
            var cubit = BlocProvider.of<PaymentCubit>(context);
            return Column(
              children: [
                MainButton(
                  text: 'Choose address',
                  onClicked: () {
                    push(
                      context: context,
                      screen: const ShippingAddressesScreen(),
                    );
                  },
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  btnColor: AppColors.myWhite,
                  textColor: AppColors.textBodyMediumColor,
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                Row(
                  children: [
                    const TextWidget(
                      text: 'Payment Method : ',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      lines: 1,
                      textColor: AppColors.textBodyMediumColor,
                    ),
                    Radio(
                        value: 1,
                        groupValue: cubit.val,
                        onChanged: ((value) {
                          value = int.parse(value.toString());
                          cubit.changeRadioButtonValue(value);
                        })),
                    const TextWidget(
                      text: 'Cash',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      lines: 1,
                      textColor: AppColors.primaryColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Radio(
                        value: 2,
                        groupValue: cubit.val,
                        onChanged: ((value) {
                          value = int.parse(value.toString());
                          cubit.changeRadioButtonValue(value);
                        })),
                    const TextWidget(
                      text: 'Visa',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      lines: 1,
                      textColor: AppColors.primaryColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                MainButton(
                  text: 'Submit',
                  onClicked: () {
                    if (state is AddOrderErorrState) {
                      showMessage(
                        context: context,
                        text: state.error,
                      );
                    } else {
                      if (addressId != null) {
                        BlocProvider.of<PaymentCubit>(context).addOrder(
                          orderId: addressId,
                          paymentMethod: cubit.val,
                        );

                        push(
                          context: context,
                          screen: const OrderSuccessScreen(),
                        );
                      } else {
                        showMessage(
                            context: context, text: 'Please choose address');
                      }
                    }
                  },
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  btnColor: AppColors.myWhite,
                  textColor: AppColors.textBodyMediumColor,
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
