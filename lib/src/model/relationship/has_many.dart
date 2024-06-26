part of flutter_data;

/// A [Relationship] that models a to-many ownership.
///
/// Example: An author who has many books
/// ```
/// class Author with DataModel<Author> {
///  @override
///  final int id;
///  final String name;
///  final HasMany<Book> books;
///
///  Todo({this.id, this.name, this.books});
/// }
///```
class HasMany<E extends DataModelMixin<E>> extends Relationship<E, Set<E>> {
  /// Creates a [HasMany] relationship, with an optional initial [Set<E>].
  ///
  /// Example:
  /// ```
  /// final book = Book(title: 'Harry Potter');
  /// final author = Author(id: 1, name: 'JK Rowling', books: HasMany({book}));
  /// ```
  ///
  /// See also: [IterableRelationshipExtension<E>.asHasMany]
  HasMany([Set<E>? models]) : super(models);

  HasMany._(Set<String>? keys) : super._(keys);

  HasMany.remove() : super._remove();

  /// For internal use with `json_serializable`.
  factory HasMany.fromJson(final Map<String, dynamic> map) {
    if (map['_'] == null) return HasMany._(null);
    return HasMany._({...map['_']});
  }

  /// Add a [value] to this [Relationship]
  ///
  /// Attempting to add an existing [value] has no effect as this is a [Set]
  bool add(E value) {
    _addAll({value._key!});
    return true;
  }

  void addAll(Iterable<E> values) {
    db.execute('BEGIN');
    _addAll(values.map((e) => e._key!).toSet());
    db.execute('COMMIT');
  }

  bool contains(E element) {
    return _contains(element);
  }

  bool containsId(Object id) {
    final key = _adapter.core.getKeyForId(_internalType, id);
    return _keys.contains(key);
  }

  /// Removes a [value] from this [Relationship]
  bool remove(E value) {
    return _remove(value);
  }

  /// Returns keys in this relationship.
  Set<String> get keys => _keys;

  // iterable utils

  Set<E> toSet() => _iterable.toSet();

  List<E> toList() => _iterable.toList();

  E get first => _iterable.first;

  E? get firstOrNull => _iterable.firstOrNull;

  bool get isEmpty => length == 0;

  bool get isNotEmpty => length > 0;

  Iterable<E> where(bool Function(E) test) => _iterable.where(test);

  Iterable<T> map<T>(T Function(E) f) => _iterable.map(f);

  //

  /// Returns a [StateNotifier] which emits the latest [Set<E>] representing
  /// this [HasMany] relationship.
  @override
  DelayedStateNotifier<Set<E>> watch() {
    return _relationshipEventNotifier.map((e) => toSet());
  }

  @override
  String toString() => 'HasMany<$E>(${super.toString()})';
}

extension IterableRelationshipExtension<T extends DataModelMixin<T>> on Set<T> {
  /// Converts a [Set<T>] into a [HasMany<T>].
  ///
  /// Equivalent to using the constructor as `HasMany(set)`.
  HasMany<T> get asHasMany => HasMany<T>(this);
}
