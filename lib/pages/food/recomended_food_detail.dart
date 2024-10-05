import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RecomendedFoodDetail extends StatelessWidget {
  const RecomendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 90,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.clear),
                ),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  child: Center(
                      child: BigText(
                    size: Dimensions.font26,
                    text: "Jare akbar",
                  )),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20))),
                )),
            pinned: true,
            backgroundColor: Colors.greenAccent,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/sapi01.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisl diam, maximus sed nisl nec, ultricies finibus lacus. In lacinia diam sit amet auctor volutpat. Duis sem turpis, finibus nec vestibulum sit amet, egestas gravida felis. Morbi vel libero rhoncus mauris elementum rhoncus quis quis purus. Quisque vitae mi purus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisl diam, maximus sed nisl nec, ultricies finibus lacus. In lacinia diam sit amet auctor volutpat. Duis sem turpis, finibus nec vestibulum sit amet, egestas gravida felis. Morbi vel libero rhoncus mauris elementum rhoncus quis quis purus. Quisque vitae mi purus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisl diam, maximus sed nisl nec, ultricies finibus lacus. In lacinia diam sit amet auctor volutpat. Duis sem turpis, finibus nec vestibulum sit amet, egestas gravida felis. Morbi vel libero rhoncus mauris elementum rhoncus quis quis purus. Quisque vitae mi purus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisl diam, maximus sed nisl nec, ultricies finibus lacus. In lacinia diam sit amet auctor volutpat. Duis sem turpis, finibus nec vestibulum sit amet, egestas gravida felis. Morbi vel libero rhoncus mauris elementum rhoncus quis quis purus. Quisque vitae mi purus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nisl diam, maximus sed nisl nec, ultricies finibus lacus. In lacinia diam sit amet auctor volutpat. Duis sem turpis, finibus nec vestibulum sit amet, egestas gravida felis. Morbi vel libero rhoncus mauris elementum rhoncus quis quis purus. Quisque vitae mi purus."),
                  margin: EdgeInsets.only(
                      left: Dimensions.widht20, right: Dimensions.widht20),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.widht20 * 2.5,
                right: Dimensions.widht20 * 2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: Colors.greenAccent,
                    icon: Icons.remove),
                BigText(
                  text: "Rp10 juta" + " x " + " 0 ",
                  size: Dimensions.font26,
                ),
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: Colors.greenAccent,
                    icon: Icons.add),
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.widht20,
                right: Dimensions.widht20),
            decoration: BoxDecoration(
                color: const Color.fromARGB(31, 106, 91, 91),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.widht20,
                      right: Dimensions.widht20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Icon(Icons.favorite),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.widht20,
                      right: Dimensions.widht20),
                  child: BigText(
                    text: "Rp10 juta | Add to cart",
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.greenAccent),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
