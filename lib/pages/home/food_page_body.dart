import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/repository/recomended_product_repo.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return popularProducts.isLoaded
                ? Container(
                    //color: Colors.redAccent,
                    height: Dimensions.pageView,
                    child: PageView.builder(
                        controller: pageController,
                        itemCount: popularProducts.PopularProductList.length,
                        itemBuilder: (context, position) {
                          return _buildPageItem(position,
                              popularProducts.PopularProductList[position]);
                        }),
                  )
                : CircularProgressIndicator(
                    color: Colors.greenAccent,
                  );
          },
        ),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.PopularProductList.length <= 0
                ? 1
                : popularProducts.PopularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
                activeColor: Colors.blueAccent,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          );
        }),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.widht30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recomended"),
              SizedBox(
                width: Dimensions.widht10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black12,
                ),
              ),
              SizedBox(
                width: Dimensions.widht10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: SmallText(text: "Animals pairing"),
              )
            ],
          ),
        ),
        // list of food and images
        GetBuilder<RecomendedProductController>(builder: (recomendedProduct) {
          return recomendedProduct.isLoaded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recomendedProduct.recomendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecomendedFood());
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.widht20,
                            right: Dimensions.widht20,
                            bottom: Dimensions.height10),
                        child: Row(
                          children: [
                            // image section
                            Container(
                              width: Dimensions.listViewImgSize,
                              height: Dimensions.listViewImgSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.white38,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(recomendedProduct
                                          .recomendedProductList[index].img!))),
                            ),
                            Expanded(
                                child: Container(
                                    height: Dimensions.listViewTextContSize,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(
                                                Dimensions.radius20),
                                            bottomRight: Radius.circular(
                                                Dimensions.radius20)),
                                        color: Colors.white),
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: Dimensions.widht10,
                                            right: Dimensions.widht10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            BigText(
                                                text: recomendedProduct
                                                    .recomendedProductList[
                                                        index]
                                                    .name!),
                                            SizedBox(
                                              height: Dimensions.height10,
                                            ),
                                            SmallText(
                                                text:
                                                    "Hewan yang sehat siap disembelih"),
                                            SizedBox(
                                              height: Dimensions.height10,
                                            ),
                                            Row(
                                              children: [
                                                IconAndTextWidget(
                                                    icon: Icons.circle_sharp,
                                                    text: "Sehat",
                                                    iconColor:
                                                        Colors.orangeAccent),
                                                SizedBox(
                                                  width: Dimensions.widht20,
                                                ),
                                                IconAndTextWidget(
                                                    icon: Icons.location_on,
                                                    text: "1.5km",
                                                    iconColor:
                                                        Colors.lightBlueAccent)
                                              ],
                                            )
                                          ],
                                        ))))
                          ],
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator(
                  color: Colors.greenAccent,
                );
        }),
        // navbar tampilan awal
        //BottomNavigationBar(items: items)
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    return GestureDetector(
        onTap: () {
          Get.to(() => PopularFoodDetail(
                pageId: index,
              ));
        },
        child: Stack(children: [
          Container(
            height: Dimensions.pageViewController,
            margin: EdgeInsets.only(
                left: Dimensions.widht10, right: Dimensions.widht10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0xff69c5df) : Color(0xff9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(popularProduct.img!))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.widht30,
                  right: Dimensions.widht30,
                  bottom: Dimensions.height25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(5, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: Dimensions.widht15,
                    right: Dimensions.widht15),
                child: AppColumn(text: popularProduct.name!),
              ),
            ),
          )
        ]));
  }
}
