import 'package:app_food/common/app_text_styles.dart';
import 'package:app_food/common/image_resources.dart';
import 'package:app_food/features/app/domain/entities/pizza_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

void handleModalDetailPizza(
    {required BuildContext context, required PizzaEntity pizzaEntity}) {
  const borderRadius = BorderRadius.only(
      topLeft: Radius.circular(10), topRight: Radius.circular(10));
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: borderRadius,
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          final size = MediaQuery.of(context).size;
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: borderRadius,
            ),
            height: size.height * 0.5,
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      fit: BoxFit.fill,
                      imageUrl: pizzaEntity.image!,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                      errorWidget: (context, url, error) => Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "${pizzaEntity.name}",
                  style: AppTextStyle.titleItemStyle,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "País: ",
                          style: AppTextStyle.detailItemStyle,
                        ),
                        Text(
                          "${pizzaEntity.countryOrigin}",
                          style: AppTextStyle.detailItemStyle
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Precio: ",
                          style: AppTextStyle.detailItemStyle,
                        ),
                        Text("${pizzaEntity.price}",
                            style: AppTextStyle.detailItemStyle
                                .copyWith(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
