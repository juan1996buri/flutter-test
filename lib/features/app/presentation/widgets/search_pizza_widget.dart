import 'package:app_food/common/app_colors.dart';
import 'package:app_food/common/app_text_styles.dart';
import 'package:flutter/material.dart';

class SearchPizzaWidget extends StatelessWidget {
  const SearchPizzaWidget({
    super.key,
    required this.onChanged,
  });
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.white),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: AppColors.mediumGray,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: TextFormField(
              onChanged: (value) {
                onChanged(value);
              },
              decoration: const InputDecoration(
                hintText: "Buscar",
                border: InputBorder.none,
              ),
              style: AppTextStyle.detailItemStyle.copyWith(
                  color: AppColors.mediumGray, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
