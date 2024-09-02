import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/models/inventory.dart';
import '../../../core/widgets/buttons/add_image_button.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/number_field.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_b.dart';
import '../bloc/inventory_bloc.dart';

class InventoryAddPage extends StatefulWidget {
  const InventoryAddPage({super.key, required this.category});

  final String category;

  @override
  State<InventoryAddPage> createState() => _InventoryAddPageState();
}

class _InventoryAddPageState extends State<InventoryAddPage> {
  final controller1 = TextEditingController(); // name
  final controller2 = TextEditingController(); // price
  final controller3 = TextEditingController(); // sale price
  final controller4 = TextEditingController(); // image path

  bool active = false;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
        controller3,
        controller4,
      ]);
    });
  }

  void onSave() {
    context.read<InventoryBloc>().add(
          AddInventoryEvent(
            inventory: Inventory(
              id: getCurrentTimestamp(),
              name: controller1.text,
              price: int.tryParse(controller2.text) ?? 0,
              salePrice: int.tryParse(controller3.text) ?? 0,
              image: controller4.text,
              category: widget.category,
            ),
          ),
        );
    context.pop();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(title: 'Add a New Product'),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextB('Product Photo', fontSize: 14),
                const SizedBox(height: 10),
                AddImageButton(
                  controller: controller4,
                  onPressed: checkActive,
                ),
                const SizedBox(height: 24),
                const TextB('Name of the Product', fontSize: 14),
                const SizedBox(height: 10),
                TxtField(
                  controller: controller1,
                  hintText: 'Product',
                  onChanged: checkActive,
                ),
                const SizedBox(height: 24),
                const TextB('Cost Price', fontSize: 14),
                const SizedBox(height: 10),
                NumberField(
                  controller: controller2,
                  hintText: 'Price',
                  onChanged: checkActive,
                ),
                const SizedBox(height: 24),
                const TextB('The Cost of the Sale', fontSize: 14),
                const SizedBox(height: 10),
                NumberField(
                  controller: controller3,
                  hintText: 'Sale Price',
                  onChanged: checkActive,
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
    );
  }
}
