import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_b.dart';

class HomeInventory extends StatelessWidget {
  const HomeInventory({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          color: AppColors.pink1,
          borderRadius: BorderRadius.circular(24),
        ),
        child: CupertinoButton(
          onPressed: () {
            context.push('/category');
          },
          padding: EdgeInsets.zero,
          child: Stack(
            children: [
              const Positioned(
                top: 20,
                left: 20,
                right: 20,
                child: TextB('Inventory', fontSize: 14),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: SvgPicture.asset('assets/home2.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
