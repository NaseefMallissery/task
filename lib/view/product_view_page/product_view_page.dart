import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:infinity_box_assignment/controllers/cart_page/cart_controller.dart';
import 'package:infinity_box_assignment/controllers/single_product/single_product.dart';
import 'package:infinity_box_assignment/helpers/constant/app_styles.dart';
import 'package:infinity_box_assignment/helpers/utils/loading_widget.dart';
import 'package:infinity_box_assignment/model/cart_model/cart_model.dart';
import 'package:provider/provider.dart';

class ProductViewPage extends StatelessWidget {
  const ProductViewPage({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<SingleProductController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.productDetails(productId);
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Consumer<SingleProductController>(
              builder: (context, value, _) {
                return value.loading == true
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: double.infinity,
                        child: const Center(
                          child: LoadingWidget(),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Card(
                            child: Container(
                              height: 320,
                              width: 400,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(provider.product!.image),
                                ),
                              ),
                            ),
                          ),
                          AppSIzedBoxes.kHeight20,
                          Text(
                            provider.product!.title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          AppSIzedBoxes.kHeight10,
                          Text(
                            'Price: \$'
                            '${provider.product!.price.toString()}',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.greenColor),
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          AppSIzedBoxes.kHeight10,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RatingBar.builder(
                                initialRating: value.product!.rating.rate,
                                minRating: 1,
                                itemSize: 40,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  // size: 12,
                                ),
                                onRatingUpdate: (rating) {
                                  log(rating.toString());
                                },
                              ),
                              AppSIzedBoxes.kWidth10,
                              Text(
                                  '${provider.product!.rating.count.toString()} Ratings')
                            ],
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          AppSIzedBoxes.kHeight15,
                          Text(
                            provider.product!.description,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          Consumer2<CartController, SingleProductController>(
                              builder: (context, value, value2, _) {
                            return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(500, 50)),
                                onPressed: () {
                                  final product = CartModel(
                                      name: value2.product!.title,
                                      price: value2.product!.price,
                                      description: value2.product!.description,
                                      image: value2.product!.image,
                                      id: value2.product!.id.toString());
                                  value.cartIds.contains(
                                          value2.product!.id.toString())
                                      ? value2.goToCart(context)
                                      : value.addToCart(product);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      value.cartIds.contains(
                                              value2.product!.id.toString())
                                          ? 'Go to Cart'
                                          : 'Add to Cart',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    AppSIzedBoxes.kWidth10,
                                    const Icon(Icons.add_shopping_cart)
                                  ],
                                ));
                          })
                        ],
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
