import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils.dart';
import '../../core/config/app_colors.dart';
import '../../core/widgets/texts/text_r.dart';
import '../cafe/bloc/cafe_bloc.dart';
import '../inventory/bloc/inventory_bloc.dart';
import '../news/bloc/news_bloc.dart';
import '../revenue/bloc/revenue_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double loading = 0;

  void load() async {
    context.read<CafeBloc>().add(GetCafesEvent());
    context.read<InventoryBloc>().add(GetInventoriesEvent());
    context.read<RevenueBloc>().add(GetRevenuesEvent());
    context.read<NewsBloc>().add(GetNewsEvent());

    await getData().then((value) {
      setState(() {
        loading = 124;
      });
      Future.delayed(const Duration(seconds: 2), () {
        if (onboard) {
          context.go('/onboard');
        } else {
          context.go('/home');
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6130B6),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Stack(
              children: [
                Container(
                  height: 124,
                  width: 124,
                  decoration: BoxDecoration(
                    color: AppColors.pink1,
                    borderRadius: BorderRadius.circular(124 / 2),
                  ),
                ),
                SizedBox(
                  width: 124,
                  child: SvgPicture.asset('assets/logo.svg'),
                ),
              ],
            ),
            const SizedBox(height: 72),
            Stack(
              children: [
                Container(
                  height: 2,
                  width: 124,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: const Color(0xff7B44DC),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1500),
                  height: 2,
                  width: loading,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            CupertinoButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              minSize: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextR(
                    'Terms of Service',
                    fontSize: 12,
                    color: AppColors.white50,
                  ),
                  const SizedBox(width: 10),
                  const TextR(
                    '|',
                    fontSize: 12,
                    color: Color(0xffFC3CFF),
                  ),
                  const SizedBox(width: 10),
                  TextR(
                    'Privacy Policy',
                    fontSize: 12,
                    color: AppColors.white50,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10 + getBottom(context)),
          ],
        ),
      ),
    );
  }
}
