import 'package:flutter/material.dart';
import 'package:infinity_box_assignment/controllers/all_products/all_produts_controller.dart';
import 'package:infinity_box_assignment/controllers/electronics/electronic_controller.dart';
import 'package:infinity_box_assignment/controllers/jewellery/jewelery_controller.dart';
import 'package:infinity_box_assignment/controllers/mens_clothings/mens_clothing_controller.dart';
import 'package:infinity_box_assignment/controllers/womens_cloth/womens_controller.dart';
import 'package:infinity_box_assignment/helpers/utils/loading_widget.dart';
import 'package:infinity_box_assignment/view/profile_drawer/profile_drawer.dart';
import 'package:infinity_box_assignment/view/widget/product_card_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final allProductController = Provider.of<AllProductsController>(context);
    final ScrollController scrollController = ScrollController();

    final jeweleryController = Provider.of<JeweleryController>(context);
    final mensController = Provider.of<MensController>(context);
    final womensController = Provider.of<WomensController>(context);
    final electronicsController = Provider.of<ElectronicsController>(context);

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   scrollController.addListener(
    //     () => homecontroller.scrollListener(
    //       scrollController,
    //     ),
    //   );
    // });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  allProductController.toSearchScreen(context);
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {
                  allProductController.toCartScreen(context);
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Wrap(
              children: [
                SizedBox(
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      height: 45,
                      child: FilterChip(
                        label: const Text("Jewellery"),
                        selected: jeweleryController.isSelected,
                        onSelected: (value) {
                          jeweleryController.isSelected = value;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      height: 45,
                      child: FilterChip(
                        label: const Text("Mens Clothings"),
                        selected: mensController.isSelected,
                        onSelected: (value) {
                          mensController.isSelected = value;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      height: 45,
                      child: FilterChip(
                        label: const Text("Womens Clothings"),
                        selected: womensController.isSelected,
                        onSelected: (value) {
                          womensController.isSelected = value;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      height: 45,
                      child: FilterChip(
                        label: const Text("Electronics"),
                        selected: electronicsController.isSelected,
                        onSelected: (value) {
                          electronicsController.isSelected = value;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Consumer<AllProductsController>(
                builder: (context, value, child){ 
                  return value.loading
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: double.infinity,
                        child: const Center(
                          child: LoadingWidget(),
                        ),
                      )
                    : jeweleryController.isSelected
                        ? GridView.builder(
                            controller: scrollController,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2.3 / 3.25,
                            ),
                            itemBuilder: (context, index) => ProductViewCard(
                              image:
                                  jeweleryController.jeweleryList[index].image,
                              title:
                                  jeweleryController.jeweleryList[index].title,
                              price:
                                  "Price: \$${jeweleryController.jeweleryList[index].price.toString()}",
                              onTap: () => value.toProductScreen(
                                  context, jeweleryController.jeweleryList[index].id),
                            ),
                            itemCount: jeweleryController.jeweleryList.length,
                          )
                        : mensController.isSelected
                            ? GridView.builder(
                                controller: scrollController,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2.3 / 3.25,
                                ),
                                itemBuilder: (context, index) =>
                                    ProductViewCard(
                                  image: mensController.mensList[index].image,
                                  title: mensController.mensList[index].title,
                                  price:
                                      "Price: \$${mensController.mensList[index].price.toString()}",
                                  onTap: () => value.toProductScreen(context,
                                      mensController.mensList[index].id),
                                ),
                                itemCount: mensController.mensList.length,
                              )
                            : womensController.isSelected
                                ? GridView.builder(
                                    controller: scrollController,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 2.3 / 3.25,
                                    ),
                                    itemBuilder: (context, index) =>
                                        ProductViewCard(
                                      image: womensController
                                          .womensList[index].image,
                                      title: womensController
                                          .womensList[index].title,
                                      price:
                                          "Price: \$${womensController.womensList[index].price.toString()}",
                                      onTap: () => value.toProductScreen(
                                          context,
                                          womensController
                                              .womensList[index].id),
                                    ),
                                    itemCount:
                                        womensController.womensList.length,
                                  )
                                : electronicsController.isSelected
                                    ? GridView.builder(
                                        controller: scrollController,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 2.3 / 3.25,
                                        ),
                                        itemBuilder: (context, index) =>
                                            ProductViewCard(
                                          image: electronicsController
                                              .electronicsList[index].image,
                                          title: electronicsController
                                              .electronicsList[index].title,
                                          price:
                                              "Price: \$${electronicsController.electronicsList[index].price.toString()}",
                                          onTap: () => value.toProductScreen(
                                              context,
                                              electronicsController
                                                  .electronicsList[index].id),
                                        ),
                                        itemCount: electronicsController
                                            .electronicsList.length,
                                      )
                                    : GridView.builder(
                                        controller: scrollController,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 2.3 / 3.25,
                                        ),
                                        itemBuilder: (context, index) =>
                                            ProductViewCard(
                                          image: allProductController
                                              .productsList[index].image,
                                          title: allProductController
                                              .productsList[index].title,
                                          price:
                                              "Price: \$${allProductController.productsList[index].price.toString()}",
                                          onTap: () => value.toProductScreen(
                                              context,
                                              allProductController
                                                  .productsList[index].id),
                                        ),
                                        itemCount: allProductController
                                            .productsList.length,
                                      );}
              ),
            ),
          ],
        ),
      ),
      drawer: const ProfilePage(),
    );
  }
}
