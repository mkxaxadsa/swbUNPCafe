import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/revenue.dart';
import '../../../core/widgets/texts/text_e.dart';
import '../../../core/widgets/texts/text_r.dart';

class RevenueCard extends StatelessWidget {
  const RevenueCard({super.key, required this.revenue});

  final Revenue revenue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: CupertinoButton(
        onPressed: () {
          context.push('/revenue/edit', extra: revenue);
        },
        padding: EdgeInsets.zero,
        minSize: 46,
        child: Row(
          children: [
            Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                color: getCategoryColor(revenue.category),
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            const SizedBox(width: 14),
            TextR(revenue.category, fontSize: 14),
            const Spacer(),
            TextE('\$${revenue.price}', fontSize: 15),
          ],
        ),
      ),
    );
  }
}
