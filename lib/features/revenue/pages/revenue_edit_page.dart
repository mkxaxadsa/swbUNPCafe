import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/revenue.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/dialogs/delete_dialog.dart';
import '../../../core/widgets/texts/text_b.dart';
import '../bloc/revenue_bloc.dart';
import '../widgets/category_select.dart';
import '../widgets/date_field.dart';
import '../widgets/price_field.dart';
import '../widgets/tab_widget.dart';

class RevenueEditPage extends StatefulWidget {
  const RevenueEditPage({super.key, required this.revenue});

  final Revenue revenue;

  @override
  State<RevenueEditPage> createState() => _RevenueEditPageState();
}

class _RevenueEditPageState extends State<RevenueEditPage> {
  final controller1 = TextEditingController(); // price
  final controller2 = TextEditingController(); // category
  final controller3 = TextEditingController(); // date

  bool revenue = true;
  bool active = true;

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
          EditRevenueEvent(
            revenue: Revenue(
              id: widget.revenue.id,
              price: int.tryParse(controller1.text) ?? 0,
              category: controller2.text,
              date: controller3.text,
              revenue: revenue,
            ),
          ),
        );
    context.pop();
  }

  void onDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDialog(
          title: widget.revenue.revenue ? 'Delete Revenue?' : 'Delete Expense?',
          onYes: () {
            context
                .read<RevenueBloc>()
                .add(DeleteRevenueEvent(id: widget.revenue.id));
            context.pop();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    controller1.text = widget.revenue.price.toString();
    controller2.text = widget.revenue.category;
    controller3.text = widget.revenue.date;
    revenue = widget.revenue.revenue;
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
                      const SizedBox(height: 10),
                      PrimaryButton(
                        title: 'Delete',
                        active: active,
                        onPressed: onDelete,
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
