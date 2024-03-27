import 'package:app_food/common/app_colors.dart';
import 'package:app_food/common/app_text_styles.dart';
import 'package:app_food/features/app/domain/entities/pizza_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardItemPizzaWidget extends StatelessWidget {
  const CardItemPizzaWidget({
    super.key,
    required this.pizzaEntity,
    required this.onTap,
  });
  final PizzaEntity pizzaEntity;
  final ValueChanged<PizzaEntity> onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(pizzaEntity);
      },
      child: Container(
        padding: EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 10,
                offset: const Offset(0, 5))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 100,
                width: 100,
                imageUrl: pizzaEntity.image!,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => const Center(
                    child: Icon(
                  Icons.error,
                  color: Colors.red,
                )),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${pizzaEntity.name}",
                      style: AppTextStyle.titleItemStyle),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "País: ",
                              style: AppTextStyle.detailItemStyle,
                            ),
                            Expanded(
                              child: Text(
                                pizzaEntity.countryOrigin!,
                                style: AppTextStyle.detailItemStyle
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Precio: ",
                            style: AppTextStyle.detailItemStyle,
                          ),
                          Text(pizzaEntity.price ?? "\$12.34",
                              style: AppTextStyle.detailItemStyle
                                  .copyWith(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.translucentOrange,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Center(
                      child: Text(
                        pizzaEntity.tags!,
                        style: AppTextStyle.titleItemStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
