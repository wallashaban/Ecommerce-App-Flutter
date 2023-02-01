import 'package:flutter/cupertino.dart';

import '../../../authentication_module/presentation_layer/widgets/text_widget.dart';
import '../../../core/utils/app_colors.dart';

class EmptyCart extends StatelessWidget {
  final bool isOrder,isFav;
  const EmptyCart({super.key,this.isOrder=false,this.isFav=false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: 
            isOrder
                ? const AssetImage('assets/images/order.png')
                :isFav? const AssetImage('assets/images/fav.png'): const AssetImage('assets/images/basket.png'),
            fit: BoxFit.cover,
            height: 300,width: 500,
          ),
          const SizedBox(
            height: 40,
          ),
          TextWidget(
            text: isOrder ? 'Congratiolations 🤩' :isFav?'No Favourites' : 'Empty Cart',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            lines: 1,
            textColor: AppColors.textBodyMediumColor,
          ),
          const SizedBox(
            height: 30,
          ),
          TextWidget(
            text: isOrder
                ? 'Your order will be delivered soon Stay tunned😍'
                :isFav?'There is no products in your favourite,browse the attractive promos from only one'
                : 'Your cart is still empty,browse the attractive promos from only one',
            fontSize: 20,
            fontWeight: FontWeight.normal,
            lines: 3,
            textColor: AppColors.primaryColor,
          ),
          const SizedBox(
            height: 50,
          ),
          if (!isOrder)
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  color: AppColors.myWhite,
                ),
                child: const TextWidget(
                  text: 'Shopping Now',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  lines: 1,
                  textColor: AppColors.textBodyMediumColor,
                )),
        ],
      ),
    );
  }
}
