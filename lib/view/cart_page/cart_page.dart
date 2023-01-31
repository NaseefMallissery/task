import 'package:flutter/material.dart';
import 'package:infinity_box_assignment/controllers/all_products/all_produts_controller.dart';
import 'package:infinity_box_assignment/controllers/cart_page/cart_controller.dart';
import 'package:infinity_box_assignment/helpers/constant/app_styles.dart';
import 'package:infinity_box_assignment/helpers/utils/loading_widget.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final prodcutProvider =
        Provider.of<AllProductsController>(context, listen: false);
    final cartProvider = Provider.of<CartController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cartProvider.getCart();
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('My Cart'),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(8.0),
        child: Consumer<CartController>(
          builder: (context, values, _) {
            return values.loading
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 1.1,
                    width: double.infinity,
                    child: const Center(
                      child: LoadingWidget(),
                    ),
                  )
                : values.cartList.isEmpty
                    ? const Center(
                        child: Text('Cart is empty'),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: values.cartList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    //  prodcutProvider.toProductScreen(context, values.cartList[index].id);
                                  },
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(values
                                                    .cartList[index].image),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  values.cartList[index].name,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  values.cartList[index]
                                                      .description,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  '\$${values.cartList[index].price}',
                                                  style: const TextStyle(
                                                      color:
                                                          AppColors.greenColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () =>
                                                values.deleteFromCart(
                                                    values.cartList[index].id),
                                            icon: const Icon(
                                              Icons.delete_forever,
                                              color: Colors.red,
                                              size: 28,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepPurple,
                            ),
                            child: Center(
                              child: Text(
                                'Total Price: \$${values.price}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
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
