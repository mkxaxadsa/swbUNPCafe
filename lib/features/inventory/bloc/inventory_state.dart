part of 'inventory_bloc.dart';

abstract class InventoryState {}

class InventoryInitial extends InventoryState {}

class InventoryLoadedState extends InventoryState {
  final List<Inventory> inventories;
  InventoryLoadedState({required this.inventories});
}
