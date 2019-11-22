import 'package:meta/meta.dart';

@immutable
abstract class CategoriesBlocEvent {}

class LoadData extends CategoriesBlocEvent {}

class ItemClickedEvent extends CategoriesBlocEvent {
  final int index;

  ItemClickedEvent(this.index);
}
class ItemAgainClickedEvent extends CategoriesBlocEvent {
  final int index;

  ItemAgainClickedEvent(this.index);
}
