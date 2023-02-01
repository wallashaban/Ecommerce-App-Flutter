import 'package:e_commerce_app/paymeny_module/presentation_layer/controllers/payment_cubit.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/screens/shipping_addresses_screnn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication_module/presentation_layer/widgets/main_button.dart';
import '../../../authentication_module/presentation_layer/widgets/text_input.dart';
import '../../../authentication_module/presentation_layer/widgets/text_widget.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_constants.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({super.key});
  final nameController = TextEditingController();
  final cityController = TextEditingController();
  final notesController = TextEditingController();
  final regoinController = TextEditingController();
  final detailsController = TextEditingController();
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
          text: 'Add Address',
          fontSize: 22,
          fontWeight: FontWeight.normal,
          lines: 1,
          textColor: AppColors.textBodyMediumColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 35),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: const [
                    TextWidget(
                      text: 'Name',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      lines: 1,
                      textColor: AppColors.textBodyMediumColor,
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextInputWidget(
                    verticalPadding: 0,
                    text: '',
                    controller: nameController,
                    isPassword: false,
                    action: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter name to add the address.';
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),

                //Email
                Row(
                  children: const [
                    TextWidget(
                      text: 'City',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      lines: 1,
                      textColor: AppColors.textBodyMediumColor,
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextInputWidget(
                    verticalPadding: 0,
                    text: '',
                    controller: cityController,
                    isPassword: false,
                    action: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter city to add the address.';
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),

                //phone

                Row(
                  children: const [
                    TextWidget(
                      text: 'Regoin',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      lines: 1,
                      textColor: AppColors.textBodyMediumColor,
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextInputWidget(
                    verticalPadding: 0,
                    text: '',
                    controller: regoinController,
                    isPassword: false,
                    action: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter regoin to add the address.';
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),

                Row(
                  children: const [
                    TextWidget(
                      text: 'Details',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      lines: 1,
                      textColor: AppColors.textBodyMediumColor,
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextInputWidget(
                    verticalPadding: 0,
                    text: '',
                    controller: detailsController,
                    isPassword: false,
                    action: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter details to add the address.';
                      }
                    }),
                Row(
                  children: const [
                    TextWidget(
                      text: 'Notes',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      lines: 1,
                      textColor: AppColors.textBodyMediumColor,
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                textAreaWidget(notesController),
                const SizedBox(
                  height: 50,
                ),

                BlocBuilder<PaymentCubit, PaymentState>(
                  builder: (context, state) {
                    if (state is PostAddressLoadingState) {
                      return circularProgress();
                    }
                    return MainButton(
                      text: 'Add',
                      onClicked: () {
                        BlocProvider.of<PaymentCubit>(context).addAddress(
                          name: nameController.text,
                          city: cityController.text,
                          details: detailsController.text,
                          latitude: 0.0,
                          longitude: 0.0,
                          notes: notesController.text,
                          regoin: regoinController.text,
                        );
                        if (state is PostAddressErorrState) {
                          showMessage(
                            context: context,
                            text: state.error,
                          );
                        } else {
                          push(
                            context: context,
                            screen: const ShippingAddressesScreen(),
                          );
                        }
                      },
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 60,
                      btnColor: AppColors.shadowSearchHomeColor,
                      textColor: AppColors.textBodyMediumColor,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
