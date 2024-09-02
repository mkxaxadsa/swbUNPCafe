import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_m.dart';
import '../../../core/widgets/texts/text_r.dart';

class CategorySelect extends StatefulWidget {
  const CategorySelect({super.key, required this.onSelect});

  final void Function(String) onSelect;

  @override
  State<CategorySelect> createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {
  final scroll = ScrollController();
  bool active = false;
  String category = 'Coffee';

  void onTap() {
    setState(() {
      active = !active;
    });
    print(active);
  }

  void selectCategory(String value) {
    setState(() {
      category = value;
      active = false;
    });
    widget.onSelect(category);
  }

  List<String> categories = [
    'Coffee',
    'Desserts',
    'Syrup for Coffee',
    'Sugar',
    'Coffee Cups',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: active ? AppColors.white : AppColors.textField,
            borderRadius: BorderRadius.circular(8),
            border: active
                ? Border.all(
                    width: 2,
                    color: AppColors.purple2,
                  )
                : null,
          ),
          child: CupertinoButton(
            onPressed: onTap,
            padding: EdgeInsets.zero,
            minSize: 50,
            child: Row(
              children: [
                const SizedBox(width: 14),
                TextM(
                  category,
                  fontSize: 15,
                  color: AppColors.grey1,
                ),
                const Spacer(),
                RotatedBox(
                  quarterTurns: active ? 2 : 4,
                  child: SvgPicture.asset(
                    'assets/chevron.svg',
                    color: active ? AppColors.black : AppColors.grey1,
                  ),
                ),
                const SizedBox(width: 14),
              ],
            ),
          ),
        ),
        if (active) ...[
          const SizedBox(height: 5),
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  blurRadius: 96,
                  color: const Color(0xff230B4E).withOpacity(0.5),
                  offset: const Offset(0, 36),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: RawScrollbar(
                controller: scroll,
                radius: const Radius.circular(2),
                padding: const EdgeInsets.only(right: 8),
                thumbColor: AppColors.pink1,
                thickness: 4,
                child: ListView.builder(
                  controller: scroll,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 30,
                      color: category == categories[index]
                          ? AppColors.purple2
                          : AppColors.white,
                      child: CupertinoButton(
                        onPressed: () {
                          selectCategory(categories[index]);
                        },
                        padding: EdgeInsets.zero,
                        minSize: 30,
                        child: Row(
                          children: [
                            const SizedBox(width: 24),
                            TextR(
                              categories[index],
                              fontSize: 15,
                              color: category == categories[index]
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
