// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    id: json['id'] as int,
    title: json['title'] as String,
    body: json['body'] as String,
    comments: json['comments'] == null
        ? null
        : HasMany.fromJson(json['comments'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : BelongsTo.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'comments': instance.comments,
      'user': instance.user,
    };

// **************************************************************************
// RepositoryGenerator
// **************************************************************************

// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

mixin $PostLocalAdapter on LocalAdapter<Post> {
  @override
  Map<String, Map<String, Object>> relationshipsFor([Post model]) => {
        'comments': {
          'inverse': 'post',
          'type': 'comments',
          'kind': 'HasMany',
          'instance': model?.comments
        },
        'user': {'type': 'users', 'kind': 'BelongsTo', 'instance': model?.user}
      };

  @override
  Post deserialize(map) {
    for (final key in relationshipsFor().keys) {
      map[key] = {
        '_': [map[key], !map.containsKey(key)],
      };
    }
    return _$PostFromJson(map);
  }

  @override
  Map<String, dynamic> serialize(model) => _$PostToJson(model);
}

// ignore: must_be_immutable
class $PostHiveLocalAdapter = HiveLocalAdapter<Post> with $PostLocalAdapter;

class $PostRemoteAdapter = RemoteAdapter<Post> with JSONServerAdapter<Post>;

//

final postLocalAdapterProvider = Provider<LocalAdapter<Post>>((ref) =>
    $PostHiveLocalAdapter(
        ref.read(hiveLocalStorageProvider), ref.read(graphProvider)));

final postRemoteAdapterProvider = Provider<RemoteAdapter<Post>>(
    (ref) => $PostRemoteAdapter(ref.read(postLocalAdapterProvider)));

final postRepositoryProvider =
    Provider<Repository<Post>>((_) => Repository<Post>());

extension PostX on Post {
  Post init([owner]) {
    return internalLocatorFn(postRepositoryProvider, owner)
        .internalAdapter
        .initializeModel(this, save: true) as Post;
  }
}