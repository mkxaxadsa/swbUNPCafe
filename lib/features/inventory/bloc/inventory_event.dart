part of 'inventory_bloc.dart';

abstract class InventoryEvent {}

class GetInventoriesEvent extends InventoryEvent {}

class AddInventoryEvent extends InventoryEvent {
  final Inventory inventory;
  AddInventoryEvent({required this.inventory});
}

class EditInventoryEvent extends InventoryEvent {
  final Inventory inventory;
  EditInventoryEvent({required this.inventory});
}

class DeleteInventoryEvent extends InventoryEvent {
  final int id;
  DeleteInventoryEvent({required this.id});
}
