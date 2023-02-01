import 'package:e_commerce_app/authentication_module/presentation_layer/widgets/text_widget.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/favourites.dart';
import 'package:e_commerce_app/home_module/presentation_layer/controllers/home_cubit.dart';
import 'package:e_commerce_app/paymeny_module/presentation_layer/widgets/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeCubit>(context);
        if (state is GetFavouriteLoadingState) {
          return circularProgress();
        } else if (cubit.favourites.isEmpty) {
          return const EmptyCart(isFav: true,);
        }
        return ListView.separated(
          itemCount: cubit.favourites.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return favouritesWidget(
                BlocProvider.of<HomeCubit>(context).favourites[index],
                context);
          },
        );
      },
    );
  }
}

Widget favouritesWidget(Favourites model, context) => Padding(
      padding: const EdgeInsets.only(left: 30, right: 5, bottom: 10),
      child: Row(
        children: [
          Image(
            image: NetworkImage(
              model.favProduct.image,
            ),
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 15.0,
          ),
          SizedBox(
            width: 250,
            child: Column(
              children: [
                TextWidget(
                  text: model.favProduct.name,
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
                    TextWidget(
                      text: '${model.favProduct.price}LE',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      lines: 1,
                    ),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<HomeCubit>(context)
                            .addOrDeleteFavourites(
                          productId: model.favProduct.id,
                        );
                      },
                      icon: const Icon(
                        Icons.favorite,
                      ),
                      color:  BlocProvider.of<HomeCubit>(context)
                              .inFavourites[model.favProduct.id]!
                          ? AppColors.textBodyMediumColor
                          : AppColors.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
