import 'package:equatable/equatable.dart';

/// {@template core.data.models.modelOf}
/// A mixin that includes common methods to work with models, like converting
/// a model to an entity, parsing to JSON, parsing to map, etc.
/// {@endtemplate}
mixin ModelOf<E extends Equatable> on Equatable {
  /// {@template core.data.models.modelOf.toEntity}
  /// Converts this model to an entity of type [E].
  /// {@endtemplate}
  E toEntity();

  /// {@template core.data.models.modelOf.toMap}
  /// Converts this model to a map.
  /// {@endtemplate}
  Map<String, dynamic> toMap();

  /// {@template core.data.models.modelOf.toJson}
  /// Converts this model to a raw JSON string.
  /// {@endtemplate}
  String toJson();

  /// {@template core.data.models.modelOf.copyWith}
  /// Returns a copy of this model with replaced given parameters.
  /// {@endtemplate}
  ModelOf<E> copyWith();
}

/// An extension to transform a list of models to a list of entities of type
/// [E] that extend [Equatable].
extension ListOfModelsToListOfEntities<E extends Equatable>
    on List<ModelOf<E>> {
  /// Transforms this list of [ModelOf]s to a list of their entities.
  List<E> toListOfEntities() {
    return map<E>(
      (
        ModelOf<E> model,
      ) {
        return model.toEntity();
      },
    ).toList();
  }
}
