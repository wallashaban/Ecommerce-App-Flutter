import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_commerce_app/core/services/services_locator.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/home_module/presentation_layer/controllers/home_cubit.dart';
import 'package:e_commerce_app/home_module/presentation_layer/screens/search_screen.dart';
import 'package:e_commerce_app/profile_module/presentation_layer/screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_colors.dart';
import '../../../paymeny_module/presentation_layer/controllers/payment_cubit.dart';
import '../../../profile_module/presentation_layer/controllers/settings_cubit.dart';

class BottomNavigationbarScreen extends StatelessWidget {
  const BottomNavigationbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<HomeCubit>()
            ..getHomeData()
            ..getCategories()
            ..getFavourites(),
        ),
        BlocProvider(
          create: (context) => sl<PaymentCubit>()
            ..getCarts()
            ..getOrders(),
        ),
        BlocProvider(
          create: (context) => sl<SettingsCubit>()
            ..getSettings()
            ..getNotifications()..getProfile(),
        ),
      ],
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<HomeCubit>(context);
          return Scaffold(
            appBar: AppBar(
                backgroundColor: AppColors.scaffoldColor,
                title: Text(
                  cubit.titles[cubit.index],
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        push(
                          context: context,
                          screen: BlocProvider(
                            create: (context) => sl<HomeCubit>(),
                            child: const SearchScreen(),
                          ),
                        );
                      },
                      icon: const CircleAvatar(
                        backgroundColor: AppColors.myWhite,
                        radius: 25,
                        child: Icon(
                          Icons.search_outlined,
                          color: AppColors.textBodyMediumColor,
                        ),
                      )),
                  IconButton(
                      onPressed: () {
                        push(
                          context: context,
                          screen: BlocProvider(
                            create: (context) =>
                                sl<SettingsCubit>()..getNotifications(),
                            child: const NotificationScreen(),
                          ),
                        );
                      },
                      icon: const CircleAvatar(
                        backgroundColor: AppColors.myWhite,
                        radius: 25,
                        child: Icon(
                          Icons.notifications,
                          color: AppColors.textBodyMediumColor,
                        ),
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                ]),
            body: cubit.screens[cubit.index],
            bottomNavigationBar: BottomNavyBar(
              //backgroundColor: AppColors.primaryColor,

                selectedIndex: cubit.index,
                onItemSelected: (index) {
                  cubit.changeBottomNavigationbar(index);
                },
                curve: Curves.easeInOut,

               
                items:  [
                  BottomNavyBarItem(
                    activeColor: AppColors.textBodyMediumColor,
                    inactiveColor: AppColors.primaryColor,
                      icon:const Icon(Icons.apps), title: const Text('Home')),
                  BottomNavyBarItem(
                     activeColor: AppColors.textBodyMediumColor,
                    inactiveColor: AppColors.primaryColor,
                      icon:const Icon(Icons.favorite_border), title: const Text('Favourite')),
                  BottomNavyBarItem(
                     activeColor: AppColors.textBodyMediumColor,
                    inactiveColor: AppColors.primaryColor,
                      icon: const Icon(Icons.shopping_cart), title:const Text('Basket') ),
                  BottomNavyBarItem(
                     activeColor: AppColors.textBodyMediumColor,
                    inactiveColor: AppColors.primaryColor,
                      icon: const Icon(Icons.settings), title: const Text('Settings')),
                ]),
          );
        },
      ),
    );
  }
}
