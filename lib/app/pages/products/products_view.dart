import 'package:flutter/material.dart';
import 'package:product_list/app/app.dart';
import 'package:get/get.dart';
import 'package:product_list/domain/domain.dart';

/// The splash view which will show the splash screen and perform the basic
/// ui work.
class ProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: Get.find<ProductsController>().getTabLength(),
        initialIndex: Get.find<ProductsController>().getInitialIndex(),
        child: Scaffold(
          backgroundColor: Get.theme.backgroundColor,
          appBar: _getAppBar(Get.find<ProductsController>().categoryList),
          body: GetBuilder<ProductsController>(
            builder: (_controller) => GridView.builder(
              primary: false,
              padding: Dimens.edgeInsets20_15_20_80,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 2,
                childAspectRatio: 0.9,
              ),
              itemCount: _controller.productList?.data?.length ?? 0,
              itemBuilder: (_, position) {
                var product = _controller.productList.data[position];
                return _getSingleProduct(product);
              },
            ),
          ),
        ),
      );

  /// Get app bar for the home page
  AppBar _getAppBar(CategoryList categoryList) => AppBar(
        backgroundColor: Get.theme.backgroundColor,
        elevation: Dimens.zero,
        centerTitle: true,
        iconTheme: Styles.iconThemeData,
        title: Text(
          StringConstants.prodcuts,
          style: Styles.oppositeBoldl18,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Styles.iconThemeData.color,
            ),
          ),
        ],
        bottom: TabBar(
          labelStyle: Styles.primaryBold20,
          indicatorColor: ColorsValue.accentColor,
          unselectedLabelStyle: Styles.subtitlel14,
          labelColor: ColorsValue.accentColor,
          unselectedLabelColor: ColorsValue.subtitleColor,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          onTap: (index) {
            Get.find<ProductsController>()
                .getProductList(categoryList.data[index].categoryId);
          },
          tabs: categoryList.data
              .map(
                (category) => Tab(
                  text: category.categoryName,
                ),
              )
              .toList(),
        ),
      );

  /// Get single product details widget
  Widget _getSingleProduct(ProductsDatum product) => Card(
        elevation: Dimens.five,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              Dimens.twenty,
            ),
          ),
        ),
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: NetworkImageWidget(
                  imageUrl: product.imageUrl,
                  height: double.infinity,
                  width: double.infinity,
                  radiusTopLeft: Dimens.twenty,
                  radiusTopRight: Dimens.twenty,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: Dimens.edgeInsets5_0_5_0,
                      child: Text(
                        product.title,
                        style: Styles.oppositeBoldl12,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: Dimens.edgeInsets5_0_5_0,
                      child: Text(
                        product.productVariant.toString(),
                        style: Styles.subtitlel10,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: Dimens.edgeInsets5_0_5_0,
                          child: Text(
                            '\$${product.purchasePrice.toString()}',
                            style: Styles.oppositeBoldl18,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: Dimens.edgeInsets5_5_5_5,
                          decoration: const BoxDecoration(
                            color: ColorsValue.accentColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                Dimens.ten,
                              ),
                              bottomRight: Radius.circular(
                                Dimens.twenty,
                              ),
                            ),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: Dimens.twenty,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
