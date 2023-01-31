import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinity_box_assignment/controllers/all_products/all_produts_controller.dart';
import 'package:infinity_box_assignment/helpers/constant/app_styles.dart';
import 'package:infinity_box_assignment/helpers/utils/loading_widget.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AllProductsController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.searchProducts('');
    });
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppSIzedBoxes.kHeight10,
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 28,
                      ),
                    ),
                    Expanded(
                      child: CupertinoSearchTextField(
                        autofocus: true,
                        backgroundColor: Colors.grey.withOpacity(.7),
                        style: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          CupertinoIcons.search,
                          color: Colors.white,
                        ),
                        suffixIcon: const Icon(
                          CupertinoIcons.xmark_circle_fill,
                          color: Colors.white,
                        ),
                        onChanged: ((value) => {
                              provider.debouncer.run(() {
                                provider.searchProducts(value);
                              })
                            }),
                      ),
                    ),
                  ],
                ),
                AppSIzedBoxes.kHeight15,
                Consumer<AllProductsController>(
                  builder: (context, values, _) {
                    return values.loading == true
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height / 1.3,
                            width: double.infinity,
                            child: const Center(
                              child: LoadingWidget(),
                            ),
                          )
                        : values.foundProducts.isEmpty
                            ? SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 1.3,
                                width: double.infinity,
                                child: const Center(
                                  child: Text('No products found'),
                                ),
                              )
                            : GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: values.foundProducts.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 2.3 / 3.25,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () => values.toProductScreen(
                                      context,
                                      values.foundProducts[index].id,
                                    ),
                                    child: Card(
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Image(
                                                //   height: 160,
                                                //   width: 270,
                                                //   fit: BoxFit.fill,
                                                //   image: NetworkImage(
                                                //     values.foundProducts[index]
                                                //         .image,
                                                //   ),
                                                // ),
                                                Container(
                                                  height: 160,
                                                  width: 270,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.redColor,
                                                    border: Border.all(
                                                        color: AppColors
                                                            .greyColor),
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                        values
                                                            .foundProducts[
                                                                index]
                                                            .image,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AppSIzedBoxes.kHeight10,
                                                Text(
                                                  values.foundProducts[index]
                                                      .title,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                AppSIzedBoxes.kHeight5,
                                                Text(
                                                  '\$${values.foundProducts[index].price}',
                                                  style: const TextStyle(
                                                    color: AppColors.greenColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
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
