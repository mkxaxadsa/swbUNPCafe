import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/revenue.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/texts/text_b.dart';
import '../bloc/revenue_bloc.dart';
import '../widgets/category_select.dart';
import '../widgets/date_field.dart';
import '../widgets/price_field.dart';
import '../widgets/tab_widget.dart';

class RevenueAddPage extends StatefulWidget {
  const RevenueAddPage({super.key});

  @override
  State<RevenueAddPage> createState() => _RevenueAddPageState();
}

class _RevenueAddPageState extends State<RevenueAddPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  bool revenue = true;
  bool active = false;

  void changeTab(bool value) {
    if (value != revenue) {
      setState(() {
        revenue = value;
      });
    }
  }

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
        controller3,
      ]);
    });
  }

  void onSelectCategory(String value) {
    controller2.text = value;
    checkActive();
  }

  void onDate(String value) {
    controller3.text = value;
    checkActive();
  }

  void onSave() {
    context.read<RevenueBloc>().add(
          AddRevenueEvent(
            revenue: Revenue(
              id: getCurrentTimestamp(),
              price: int.tryParse(controller1.text) ?? 0,
              category: controller2.text,
              date: controller3.text,
              revenue: revenue,
            ),
          ),
        );
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    controller2.text = 'Coffee';
    controller3.text = formatDateTime(DateTime.now());
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(title: 'Revenue & Expenses'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 12),
                Row(
                  children: [
                    TabWidget(
                      title: 'Revenue',
                      active: revenue,
                      value: true,
                      onPressed: changeTab,
                    ),
                    const SizedBox(width: 4),
                    TabWidget(
                      title: 'Expenses',
                      active: !revenue,
                      value: false,
                      onPressed: changeTab,
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PriceField(
                        controller: controller1,
                        onChanged: checkActive,
                      ),
                      const SizedBox(height: 24),
                      const TextB('Select a category', fontSize: 14),
                      const SizedBox(height: 10),
                      CategorySelect(
                        onSelect: onSelectCategory,
                      ),
                      const SizedBox(height: 24),
                      const TextB('Select a date', fontSize: 14),
                      const SizedBox(height: 10),
                      DateField(
                        controller: controller3,
                        onDate: onDate,
                      ),
                      const SizedBox(height: 24),
                      PrimaryButton(
                        title: 'Save',
                        active: active,
                        onPressed: onSave,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
