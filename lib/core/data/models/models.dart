import 'package:equatable/equatable.dart';

/// A mixin that includes common methods to work with models, like converting
/// a model to an entity, parsing to JSON, parsing to map, etc.
mixin ModelOf<E extends Equatable> {
  /// Converts this model to a map.
  Map<String, dynamic> toMap();

  /// Converts this model to a raw JSON string.
  String toJson();

  /// Returns a copy of this model with replaced given parameters.
  ModelOf<E> copyWith();

  /// Converts this model to an entity of type [E].
  E toEntity();
}
