import 'package:flutter/material.dart';
import 'package:infinity_box_assignment/helpers/constant/app_styles.dart';

class ProductViewCard extends StatelessWidget {
  const ProductViewCard({
    Key? key,
    required this.onTap,
    required this.image,
    required this.title,
    required this.price,
  }) : super(key: key);

  final Function() onTap;
  final String image;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 160,
                width: 270,
                decoration: BoxDecoration(
                  color: AppColors.redColor,
                  border: Border.all(color: AppColors.greyColor),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      image,
                    ),
                  ),
                ),
              ),
              AppSIzedBoxes.kHeight10,
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              AppSIzedBoxes.kHeight5,
              Text(
                price,
                style: const TextStyle(
                  color: AppColors.greenColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
