import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/paymeny_module/domain_layer/entities/address.dart';
import 'package:e_commerce_app/paymeny_module/presentation_layer/screens/check_out_screen.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/screens/add_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication_module/presentation_layer/widgets/main_button.dart';
import '../../../authentication_module/presentation_layer/widgets/text_widget.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/app_colors.dart';
import '../../../paymeny_module/presentation_layer/controllers/payment_cubit.dart';

class ShippingAddressesScreen extends StatelessWidget {
  const ShippingAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PaymentCubit>()..getAddress(),
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
              text: 'Shipping Addresses',
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
                if (state is GetAddressLoadingState) {
                  return circularProgress();
                } /* else if (cubit.getAddresses.isEmpty) {
                    return emptyCartWidget();
                  } */
                else {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: cubit.getAddresses.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return addressWidget(
                                cubit.getAddresses[index], context);
                          },
                        ),
                      ),
                      MainButton(
                        text: 'Add Address',
                        onClicked: () {
                          push(
                            context: context,
                            screen: BlocProvider(
                              create: (context) => sl<PaymentCubit>(),
                              child: AddAddressScreen(),
                            ),
                          );
                        },
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.4,
                        btnColor: AppColors.myWhite,
                        textColor: AppColors.textBodyMediumColor,
                      )
                    ],
                  );
                }
              },
            ),
          )),
    );
  }
}

Widget addressWidget(Address model, context) => InkWell(
      onTap: () {
        // int id = model.id;
        push(
          context: context,
          screen: BlocProvider(
            create: (context) => sl<PaymentCubit>(),
            child: CheckOutScreen(
              addressId: model.id,
            ),
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
                  text: 'Name : ',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.textBodyMediumColor,
                ),
                TextWidget(
                  text: model.name,
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
                  text: 'City : ',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.textBodyMediumColor,
                ),
                TextWidget(
                  text: model.city,
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
                  text: 'Regoin : ',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.textBodyMediumColor,
                ),
                TextWidget(
                  text: model.regoin,
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
                  text: 'Details : ',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.textBodyMediumColor,
                ),
                TextWidget(
                  text: model.details,
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
                  text: 'Notes : ',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.textBodyMediumColor,
                ),
                TextWidget(
                  text: model.notes,
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
            IconButton(
              onPressed: () {
                BlocProvider.of<PaymentCubit>(context).deleteAddress(
                  addressId: model.id,
                );
              },
              icon: const Icon(
                Icons.delete,
                color: AppColors.textBodyMediumColor,
              ),
            ),
          ],
        ),
      ),
    );
