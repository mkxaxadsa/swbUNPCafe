import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_b.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.asset,
  });

  final String category;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: CupertinoButton(
        onPressed: () {
          context.push('/inventory', extra: category);
        },
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            SizedBox(
              height: 72,
              width: 64,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                        color: AppColors.pink2,
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset('assets/$asset.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: TextB(
                category,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 14),
            SvgPicture.asset('assets/arrow-right.svg'),
          ],
        ),
      ),
    );
  }
}
