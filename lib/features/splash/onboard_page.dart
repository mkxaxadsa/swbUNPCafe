import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils.dart';
import '../../core/config/app_colors.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/custom_scaffold.dart';
import '../../core/widgets/texts/text_e.dart';
import '../../core/widgets/texts/text_r.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 32 + getStatusBar(context)),
            SizedBox(
              height: 320,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color: AppColors.pink1,
                        borderRadius: BorderRadius.circular(300 / 2),
                      ),
                    ),
                  ),
                  Center(
                    child: SvgPicture.asset(
                      'assets/logo.svg',
                      height: 320,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const TextE2(
              'Welcome to\nSweet Helper Cafe',
              fontSize: 24,
              color: AppColors.purple1,
              center: true,
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: TextR(
                'Welcome to the world of sweets and fine establishments. Here you can find and share information about a variety of coffees and knowledge about sweets and baking!',
                fontSize: 13,
                center: true,
                color: AppColors.grey1,
              ),
            ),
            const SizedBox(height: 48),
            Padding(
              padding: EdgeInsets.only(bottom: 82 - getBottom(context)),
              child: PrimaryButton(
                title: 'Continue',
                width: 212,
                onPressed: () async {
                  await saveData().then((_) {
                    context.go('/home');
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
