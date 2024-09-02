import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/models/inventory.dart';
import '../../../core/widgets/buttons/add_image_button.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/dialogs/delete_dialog.dart';
import '../../../core/widgets/textfields/number_field.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_b.dart';
import '../bloc/inventory_bloc.dart';

class InventoryEditPage extends StatefulWidget {
  const InventoryEditPage({super.key, required this.inventory});

  final Inventory inventory;

  @override
  State<InventoryEditPage> createState() => _InventoryEditPageState();
}

class _InventoryEditPageState extends State<InventoryEditPage> {
  final controller1 = TextEditingController(); // name
  final controller2 = TextEditingController(); // price
  final controller3 = TextEditingController(); // sale price
  final controller4 = TextEditingController(); // image path

  bool active = true;

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

  void onImageLink(String image) {
    log(image);
    controller4.text = image;
    checkActive();
  }

  void onImagePicked(String image) {
    log(image);
    controller4.text = image;
    checkActive();
  }

  void onEdit() {
    context.read<InventoryBloc>().add(
          EditInventoryEvent(
            inventory: Inventory(
              id: widget.inventory.id,
              name: controller1.text,
              price: int.tryParse(controller2.text) ?? 0,
              salePrice: int.tryParse(controller3.text) ?? 0,
              image: controller4.text,
              category: widget.inventory.category,
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
          title: 'Delete Product?',
          onYes: () {
            context
                .read<InventoryBloc>()
                .add(DeleteInventoryEvent(id: widget.inventory.id));
            context.pop();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    controller1.text = widget.inventory.name;
    controller2.text = widget.inventory.price.toString();
    controller3.text = widget.inventory.salePrice.toString();
    controller4.text = widget.inventory.image;
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
          const CustomAppbar(title: 'Edit Product'),
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
                  title: 'Edit',
                  active: active,
                  onPressed: onEdit,
                ),
                const SizedBox(height: 10),
                PrimaryButton(
                  title: 'Delete',
                  onPressed: onDelete,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
