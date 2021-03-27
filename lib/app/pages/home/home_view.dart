import 'package:flutter/material.dart';
import 'package:product_list/app/app.dart';
import 'package:get/get.dart';
import 'package:product_list/domain/entities/category_list.dart';

/// The home view which will show the home screen and perform the basic
/// ui work.
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Scaffold(
          backgroundColor: Get.theme.backgroundColor,
          appBar: _getAppBar(),
          bottomNavigationBar: _getBottomNavigationBar(),
          body: ListView(
            padding: Dimens.edgeInsets0_20_0_80,
            shrinkWrap: true,
            children: [
              Padding(
                padding: Dimens.edgeInsets15_0_15_0,
                child: Text(
                  StringConstants.category,
                  style: Styles.oppositeBoldl18,
                ),
              ),
              Dimens.boxHeight15,
              _getCategoryList(_controller.categoryList),
            ],
          ),
        ),
      );

  /// Get the bottom navigation bar widget for the home page.
  Widget _getBottomNavigationBar() => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              Dimens.fourty,
            ),
            topRight: Radius.circular(
              Dimens.fourty,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(
                0.0,
                1.0,
              ),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(
              Dimens.fourty,
            ),
            topRight: Radius.circular(
              Dimens.fourty,
            ),
          ),
          child: BottomNavigationBar(
            selectedItemColor: ColorsValue.primaryColor,
            unselectedItemColor: ColorsValue.darkBackgroundColor,
            backgroundColor: Get.theme.backgroundColor,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.home_rounded,
                ),
                label: StringConstants.home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.airport_shuttle_rounded,
                ),
                label: StringConstants.order,
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.shopping_cart_rounded,
                ),
                label: StringConstants.cart,
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.person_rounded,
                ),
                label: StringConstants.profile,
              )
            ],
          ),
        ),
      );

  /// Get app bar for the home page
  AppBar _getAppBar() => AppBar(
        backgroundColor: Get.theme.backgroundColor,
        elevation: Dimens.zero,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Styles.iconThemeData.color,
          ),
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Styles.iconThemeData.color,
            ),
            Dimens.boxWidth10,
            Text(
              StringConstants.addressExample.toUpperCase(),
              style: Styles.oppositeBoldl18,
            )
          ],
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
      );

  /// Get category list
  ///
  /// [categoryList] : Catgeory list
  Widget _getCategoryList(CategoryList categoryList) => GridView.builder(
        primary: false,
        padding: Dimens.edgeInsets15_0_15_80,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 2,
          childAspectRatio: 0.9,
        ),
        itemCount: categoryList?.data?.length ?? 0,
        itemBuilder: (_, position) {
          var category = categoryList.data[position];
          return _getSingleCatgeory(category);
        },
      );

  /// Get single catgeory widget
  ///
  /// [category] : Single categoryd details.
  Widget _getSingleCatgeory(Datum category) => Card(
        elevation: Dimens.five,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              Dimens.twenty,
            ),
          ),
        ),
        child: InkWell(
          onTap: () {
            RouteManagement.goToProducts(
              category.categoryId,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: NetworkImageWidget(
                  imageUrl: category.banner,
                  height: double.infinity,
                  width: double.infinity,
                  radiusTopLeft: Dimens.twenty,
                  radiusTopRight: Dimens.twenty,
                ),
              ),
              Expanded(
                child: Container(
                  margin: Dimens.edgeInsets5_5_5_5,
                  child: Text(
                    category.categoryName,
                    style: Styles.oppositeBoldl14,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
