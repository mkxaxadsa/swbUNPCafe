import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_b.dart';

class HomeRevenueCard extends StatelessWidget {
  const HomeRevenueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.circular(24),
        ),
        child: CupertinoButton(
          onPressed: () {
            context.push('/revenue');
          },
          padding: EdgeInsets.zero,
          child: Stack(
            children: [
              const Positioned(
                top: 40,
                bottom: 40,
                left: 24,
                child: TextB('Revenue & Expenses', fontSize: 14),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                right: 40,
                child: SvgPicture.asset('assets/home3.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
