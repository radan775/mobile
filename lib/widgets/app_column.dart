import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: Colors.yellow,
                      )),
            ),
            SizedBox(
              width: Dimensions.height10,
            ),
            SmallText(text: "4.5"),
            SizedBox(
              width: Dimensions.height10,
            ),
            SmallText(text: "1287"),
            SizedBox(
              width: Dimensions.height10,
            ),
            SmallText(text: "komentar")
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "Sehat",
                iconColor: Colors.orangeAccent),
            SizedBox(
              width: Dimensions.widht20,
            ),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: "1.5km",
                iconColor: Colors.lightBlueAccent)
          ],
        )
      ],
    );
  }
}
