import 'package:e_commerce_app/authentication_module/presentation_layer/screens/sign_up_screen.dart';
import 'package:e_commerce_app/authentication_module/presentation_layer/widgets/text_widget.dart';
import 'package:e_commerce_app/core/services/services_locator.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/controllers/settings_cubit.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/controllers/settings_states.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/screens/about_screen.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/screens/choose_language_screen.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/screens/feedback_screen.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/screens/orders_screen.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/screens/profile_screen.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/screens/shipping_addresses_screnn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: const [
              TextWidget(
                text: 'Account',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                lines: 1,
              ),
              Spacer(),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return settingsWidget(
                context,
                icon: Icons.abc,
                isAccount: true,
                text: '',
                widget: ProfileScreen(),
              );
            },
          ),
          Container(
            height: 2,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              TextWidget(
                text: 'Settings',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                lines: 1,
              ),
              Spacer(),
            ],
          ),
          // orders
          settingsWidget(
            context,
            icon: Icons.add_shopping_cart_outlined,
            text: 'Your Orders',
            widget: const OrdersScreen(),
          ),
          //language
          settingsWidget(
            context,
            icon: Icons.language_sharp,
            text: 'Language',
            widget: const LanguageScreen(),
          ),
          //addresses
          settingsWidget(
            context,
            icon: Icons.location_on,
            text: 'Shipping Addresses',
            isAddress: true,
            widget: const ShippingAddressesScreen(),
          ),
          //feedback
          settingsWidget(
            context,
            icon: Icons.feedback_sharp,
            text: 'Feedback',
            widget: FeedbackScreen(),
          ),
          // about us
          settingsWidget(
            context,
            icon: Icons.info,
            text: 'About Us',
            widget: const AboutUsScreen(),
          ),
          //sign Out
          settingsWidget(
            context,
            icon: Icons.logout_outlined,
            isLogOut: true,
            text: 'Sign Out',
            widget: SignUpScreen(),
          ),
        ],
      ),
    );
  }
}

Widget settingsWidget(
  context, {
  required IconData icon,
  required String text,
  bool isAccount = false,
  bool isLogOut = false,
  bool isAddress = false,
  required Widget widget,
}) =>
    InkWell(
      onTap: (() {
        isLogOut?signOutDialog(context):
        push(
          context: context,
          screen: BlocProvider(
            create: (context) => sl<SettingsCubit>(),
            child: widget,
          ),
        );
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor:
                  isAccount ? Colors.transparent : AppColors.primaryColor,
              radius: 25,
              child: isAccount
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25,
                        ),
                      ),
                      child: Image(
                        image: NetworkImage(
                            BlocProvider.of<SettingsCubit>(context)
                                .getProfileModel
                                .image),
                        fit: BoxFit.contain,
                      ),
                    )
                  : Icon(
                      icon,
                      color: AppColors.myWhite,
                    ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  children: [
                    TextWidget(
                      text: isAccount
                          ? BlocProvider.of<SettingsCubit>(context)
                              .getProfileModel
                              .name
                          : text,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      lines: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (isAccount)
                      TextWidget(
                        text: BlocProvider.of<SettingsCubit>(context)
                            .getProfileModel
                            .email,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        lines: 1,
                        textColor: AppColors.primaryColor,
                      ),
                  ],
                )),
            const Spacer(),
            if (!isLogOut)
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.textBodyMediumColor,
                ),
              ),
          ],
        ),
      ),
    );
