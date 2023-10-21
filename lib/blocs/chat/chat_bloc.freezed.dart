// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? shouldResetChat) reset,
    required TResult Function(UserEntity user) userSelected,
    required TResult Function() getChatMessage,
    required TResult Function() loadMoreChatMessage,
    required TResult Function(int chatId, ChatMessage message) sendMessage,
    required TResult Function(ChatEntity chat) chatSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool? shouldResetChat)? reset,
    TResult? Function(UserEntity user)? userSelected,
    TResult? Function()? getChatMessage,
    TResult? Function()? loadMoreChatMessage,
    TResult? Function(int chatId, ChatMessage message)? sendMessage,
    TResult? Function(ChatEntity chat)? chatSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? shouldResetChat)? reset,
    TResult Function(UserEntity user)? userSelected,
    TResult Function()? getChatMessage,
    TResult Function()? loadMoreChatMessage,
    TResult Function(int chatId, ChatMessage message)? sendMessage,
    TResult Function(ChatEntity chat)? chatSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatStarted value) started,
    required TResult Function(ChatReset value) reset,
    required TResult Function(UserSelected value) userSelected,
    required TResult Function(GetChatMessage value) getChatMessage,
    required TResult Function(LoadMoreChatMessage value) loadMoreChatMessage,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(ChatSelected value) chatSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatStarted value)? started,
    TResult? Function(ChatReset value)? reset,
    TResult? Function(UserSelected value)? userSelected,
    TResult? Function(GetChatMessage value)? getChatMessage,
    TResult? Function(LoadMoreChatMessage value)? loadMoreChatMessage,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(ChatSelected value)? chatSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatStarted value)? started,
    TResult Function(ChatReset value)? reset,
    TResult Function(UserSelected value)? userSelected,
    TResult Function(GetChatMessage value)? getChatMessage,
    TResult Function(LoadMoreChatMessage value)? loadMoreChatMessage,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(ChatSelected value)? chatSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChatStartedImplCopyWith<$Res> {
  factory _$$ChatStartedImplCopyWith(
          _$ChatStartedImpl value, $Res Function(_$ChatStartedImpl) then) =
      __$$ChatStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatStartedImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$ChatStartedImpl>
    implements _$$ChatStartedImplCopyWith<$Res> {
  __$$ChatStartedImplCopyWithImpl(
      _$ChatStartedImpl _value, $Res Function(_$ChatStartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChatStartedImpl with DiagnosticableTreeMixin implements ChatStarted {
  const _$ChatStartedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ChatEvent.started'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? shouldResetChat) reset,
    required TResult Function(UserEntity user) userSelected,
    required TResult Function() getChatMessage,
    required TResult Function() loadMoreChatMessage,
    required TResult Function(int chatId, ChatMessage message) sendMessage,
    required TResult Function(ChatEntity chat) chatSelected,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool? shouldResetChat)? reset,
    TResult? Function(UserEntity user)? userSelected,
    TResult? Function()? getChatMessage,
    TResult? Function()? loadMoreChatMessage,
    TResult? Function(int chatId, ChatMessage message)? sendMessage,
    TResult? Function(ChatEntity chat)? chatSelected,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? shouldResetChat)? reset,
    TResult Function(UserEntity user)? userSelected,
    TResult Function()? getChatMessage,
    TResult Function()? loadMoreChatMessage,
    TResult Function(int chatId, ChatMessage message)? sendMessage,
    TResult Function(ChatEntity chat)? chatSelected,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatStarted value) started,
    required TResult Function(ChatReset value) reset,
    required TResult Function(UserSelected value) userSelected,
    required TResult Function(GetChatMessage value) getChatMessage,
    required TResult Function(LoadMoreChatMessage value) loadMoreChatMessage,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(ChatSelected value) chatSelected,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatStarted value)? started,
    TResult? Function(ChatReset value)? reset,
    TResult? Function(UserSelected value)? userSelected,
    TResult? Function(GetChatMessage value)? getChatMessage,
    TResult? Function(LoadMoreChatMessage value)? loadMoreChatMessage,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(ChatSelected value)? chatSelected,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatStarted value)? started,
    TResult Function(ChatReset value)? reset,
    TResult Function(UserSelected value)? userSelected,
    TResult Function(GetChatMessage value)? getChatMessage,
    TResult Function(LoadMoreChatMessage value)? loadMoreChatMessage,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(ChatSelected value)? chatSelected,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class ChatStarted implements ChatEvent {
  const factory ChatStarted() = _$ChatStartedImpl;
}

/// @nodoc
abstract class _$$ChatResetImplCopyWith<$Res> {
  factory _$$ChatResetImplCopyWith(
          _$ChatResetImpl value, $Res Function(_$ChatResetImpl) then) =
      __$$ChatResetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool? shouldResetChat});
}

/// @nodoc
class __$$ChatResetImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$ChatResetImpl>
    implements _$$ChatResetImplCopyWith<$Res> {
  __$$ChatResetImplCopyWithImpl(
      _$ChatResetImpl _value, $Res Function(_$ChatResetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shouldResetChat = freezed,
  }) {
    return _then(_$ChatResetImpl(
      shouldResetChat: freezed == shouldResetChat
          ? _value.shouldResetChat
          : shouldResetChat // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$ChatResetImpl with DiagnosticableTreeMixin implements ChatReset {
  const _$ChatResetImpl({this.shouldResetChat});

  @override
  final bool? shouldResetChat;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatEvent.reset(shouldResetChat: $shouldResetChat)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatEvent.reset'))
      ..add(DiagnosticsProperty('shouldResetChat', shouldResetChat));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatResetImpl &&
            (identical(other.shouldResetChat, shouldResetChat) ||
                other.shouldResetChat == shouldResetChat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shouldResetChat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatResetImplCopyWith<_$ChatResetImpl> get copyWith =>
      __$$ChatResetImplCopyWithImpl<_$ChatResetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? shouldResetChat) reset,
    required TResult Function(UserEntity user) userSelected,
    required TResult Function() getChatMessage,
    required TResult Function() loadMoreChatMessage,
    required TResult Function(int chatId, ChatMessage message) sendMessage,
    required TResult Function(ChatEntity chat) chatSelected,
  }) {
    return reset(shouldResetChat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool? shouldResetChat)? reset,
    TResult? Function(UserEntity user)? userSelected,
    TResult? Function()? getChatMessage,
    TResult? Function()? loadMoreChatMessage,
    TResult? Function(int chatId, ChatMessage message)? sendMessage,
    TResult? Function(ChatEntity chat)? chatSelected,
  }) {
    return reset?.call(shouldResetChat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? shouldResetChat)? reset,
    TResult Function(UserEntity user)? userSelected,
    TResult Function()? getChatMessage,
    TResult Function()? loadMoreChatMessage,
    TResult Function(int chatId, ChatMessage message)? sendMessage,
    TResult Function(ChatEntity chat)? chatSelected,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(shouldResetChat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatStarted value) started,
    required TResult Function(ChatReset value) reset,
    required TResult Function(UserSelected value) userSelected,
    required TResult Function(GetChatMessage value) getChatMessage,
    required TResult Function(LoadMoreChatMessage value) loadMoreChatMessage,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(ChatSelected value) chatSelected,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatStarted value)? started,
    TResult? Function(ChatReset value)? reset,
    TResult? Function(UserSelected value)? userSelected,
    TResult? Function(GetChatMessage value)? getChatMessage,
    TResult? Function(LoadMoreChatMessage value)? loadMoreChatMessage,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(ChatSelected value)? chatSelected,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatStarted value)? started,
    TResult Function(ChatReset value)? reset,
    TResult Function(UserSelected value)? userSelected,
    TResult Function(GetChatMessage value)? getChatMessage,
    TResult Function(LoadMoreChatMessage value)? loadMoreChatMessage,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(ChatSelected value)? chatSelected,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class ChatReset implements ChatEvent {
  const factory ChatReset({final bool? shouldResetChat}) = _$ChatResetImpl;

  bool? get shouldResetChat;
  @JsonKey(ignore: true)
  _$$ChatResetImplCopyWith<_$ChatResetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserSelectedImplCopyWith<$Res> {
  factory _$$UserSelectedImplCopyWith(
          _$UserSelectedImpl value, $Res Function(_$UserSelectedImpl) then) =
      __$$UserSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity user});

  $UserEntityCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserSelectedImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$UserSelectedImpl>
    implements _$$UserSelectedImplCopyWith<$Res> {
  __$$UserSelectedImplCopyWithImpl(
      _$UserSelectedImpl _value, $Res Function(_$UserSelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$UserSelectedImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get user {
    return $UserEntityCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$UserSelectedImpl with DiagnosticableTreeMixin implements UserSelected {
  const _$UserSelectedImpl(this.user);

  @override
  final UserEntity user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatEvent.userSelected(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatEvent.userSelected'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSelectedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSelectedImplCopyWith<_$UserSelectedImpl> get copyWith =>
      __$$UserSelectedImplCopyWithImpl<_$UserSelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? shouldResetChat) reset,
    required TResult Function(UserEntity user) userSelected,
    required TResult Function() getChatMessage,
    required TResult Function() loadMoreChatMessage,
    required TResult Function(int chatId, ChatMessage message) sendMessage,
    required TResult Function(ChatEntity chat) chatSelected,
  }) {
    return userSelected(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool? shouldResetChat)? reset,
    TResult? Function(UserEntity user)? userSelected,
    TResult? Function()? getChatMessage,
    TResult? Function()? loadMoreChatMessage,
    TResult? Function(int chatId, ChatMessage message)? sendMessage,
    TResult? Function(ChatEntity chat)? chatSelected,
  }) {
    return userSelected?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? shouldResetChat)? reset,
    TResult Function(UserEntity user)? userSelected,
    TResult Function()? getChatMessage,
    TResult Function()? loadMoreChatMessage,
    TResult Function(int chatId, ChatMessage message)? sendMessage,
    TResult Function(ChatEntity chat)? chatSelected,
    required TResult orElse(),
  }) {
    if (userSelected != null) {
      return userSelected(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatStarted value) started,
    required TResult Function(ChatReset value) reset,
    required TResult Function(UserSelected value) userSelected,
    required TResult Function(GetChatMessage value) getChatMessage,
    required TResult Function(LoadMoreChatMessage value) loadMoreChatMessage,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(ChatSelected value) chatSelected,
  }) {
    return userSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatStarted value)? started,
    TResult? Function(ChatReset value)? reset,
    TResult? Function(UserSelected value)? userSelected,
    TResult? Function(GetChatMessage value)? getChatMessage,
    TResult? Function(LoadMoreChatMessage value)? loadMoreChatMessage,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(ChatSelected value)? chatSelected,
  }) {
    return userSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatStarted value)? started,
    TResult Function(ChatReset value)? reset,
    TResult Function(UserSelected value)? userSelected,
    TResult Function(GetChatMessage value)? getChatMessage,
    TResult Function(LoadMoreChatMessage value)? loadMoreChatMessage,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(ChatSelected value)? chatSelected,
    required TResult orElse(),
  }) {
    if (userSelected != null) {
      return userSelected(this);
    }
    return orElse();
  }
}

abstract class UserSelected implements ChatEvent {
  const factory UserSelected(final UserEntity user) = _$UserSelectedImpl;

  UserEntity get user;
  @JsonKey(ignore: true)
  _$$UserSelectedImplCopyWith<_$UserSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetChatMessageImplCopyWith<$Res> {
  factory _$$GetChatMessageImplCopyWith(_$GetChatMessageImpl value,
          $Res Function(_$GetChatMessageImpl) then) =
      __$$GetChatMessageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetChatMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$GetChatMessageImpl>
    implements _$$GetChatMessageImplCopyWith<$Res> {
  __$$GetChatMessageImplCopyWithImpl(
      _$GetChatMessageImpl _value, $Res Function(_$GetChatMessageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetChatMessageImpl
    with DiagnosticableTreeMixin
    implements GetChatMessage {
  const _$GetChatMessageImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatEvent.getChatMessage()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ChatEvent.getChatMessage'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetChatMessageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? shouldResetChat) reset,
    required TResult Function(UserEntity user) userSelected,
    required TResult Function() getChatMessage,
    required TResult Function() loadMoreChatMessage,
    required TResult Function(int chatId, ChatMessage message) sendMessage,
    required TResult Function(ChatEntity chat) chatSelected,
  }) {
    return getChatMessage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool? shouldResetChat)? reset,
    TResult? Function(UserEntity user)? userSelected,
    TResult? Function()? getChatMessage,
    TResult? Function()? loadMoreChatMessage,
    TResult? Function(int chatId, ChatMessage message)? sendMessage,
    TResult? Function(ChatEntity chat)? chatSelected,
  }) {
    return getChatMessage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? shouldResetChat)? reset,
    TResult Function(UserEntity user)? userSelected,
    TResult Function()? getChatMessage,
    TResult Function()? loadMoreChatMessage,
    TResult Function(int chatId, ChatMessage message)? sendMessage,
    TResult Function(ChatEntity chat)? chatSelected,
    required TResult orElse(),
  }) {
    if (getChatMessage != null) {
      return getChatMessage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatStarted value) started,
    required TResult Function(ChatReset value) reset,
    required TResult Function(UserSelected value) userSelected,
    required TResult Function(GetChatMessage value) getChatMessage,
    required TResult Function(LoadMoreChatMessage value) loadMoreChatMessage,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(ChatSelected value) chatSelected,
  }) {
    return getChatMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatStarted value)? started,
    TResult? Function(ChatReset value)? reset,
    TResult? Function(UserSelected value)? userSelected,
    TResult? Function(GetChatMessage value)? getChatMessage,
    TResult? Function(LoadMoreChatMessage value)? loadMoreChatMessage,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(ChatSelected value)? chatSelected,
  }) {
    return getChatMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatStarted value)? started,
    TResult Function(ChatReset value)? reset,
    TResult Function(UserSelected value)? userSelected,
    TResult Function(GetChatMessage value)? getChatMessage,
    TResult Function(LoadMoreChatMessage value)? loadMoreChatMessage,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(ChatSelected value)? chatSelected,
    required TResult orElse(),
  }) {
    if (getChatMessage != null) {
      return getChatMessage(this);
    }
    return orElse();
  }
}

abstract class GetChatMessage implements ChatEvent {
  const factory GetChatMessage() = _$GetChatMessageImpl;
}

/// @nodoc
abstract class _$$LoadMoreChatMessageImplCopyWith<$Res> {
  factory _$$LoadMoreChatMessageImplCopyWith(_$LoadMoreChatMessageImpl value,
          $Res Function(_$LoadMoreChatMessageImpl) then) =
      __$$LoadMoreChatMessageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreChatMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$LoadMoreChatMessageImpl>
    implements _$$LoadMoreChatMessageImplCopyWith<$Res> {
  __$$LoadMoreChatMessageImplCopyWithImpl(_$LoadMoreChatMessageImpl _value,
      $Res Function(_$LoadMoreChatMessageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMoreChatMessageImpl
    with DiagnosticableTreeMixin
    implements LoadMoreChatMessage {
  const _$LoadMoreChatMessageImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatEvent.loadMoreChatMessage()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'ChatEvent.loadMoreChatMessage'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreChatMessageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? shouldResetChat) reset,
    required TResult Function(UserEntity user) userSelected,
    required TResult Function() getChatMessage,
    required TResult Function() loadMoreChatMessage,
    required TResult Function(int chatId, ChatMessage message) sendMessage,
    required TResult Function(ChatEntity chat) chatSelected,
  }) {
    return loadMoreChatMessage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool? shouldResetChat)? reset,
    TResult? Function(UserEntity user)? userSelected,
    TResult? Function()? getChatMessage,
    TResult? Function()? loadMoreChatMessage,
    TResult? Function(int chatId, ChatMessage message)? sendMessage,
    TResult? Function(ChatEntity chat)? chatSelected,
  }) {
    return loadMoreChatMessage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? shouldResetChat)? reset,
    TResult Function(UserEntity user)? userSelected,
    TResult Function()? getChatMessage,
    TResult Function()? loadMoreChatMessage,
    TResult Function(int chatId, ChatMessage message)? sendMessage,
    TResult Function(ChatEntity chat)? chatSelected,
    required TResult orElse(),
  }) {
    if (loadMoreChatMessage != null) {
      return loadMoreChatMessage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatStarted value) started,
    required TResult Function(ChatReset value) reset,
    required TResult Function(UserSelected value) userSelected,
    required TResult Function(GetChatMessage value) getChatMessage,
    required TResult Function(LoadMoreChatMessage value) loadMoreChatMessage,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(ChatSelected value) chatSelected,
  }) {
    return loadMoreChatMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatStarted value)? started,
    TResult? Function(ChatReset value)? reset,
    TResult? Function(UserSelected value)? userSelected,
    TResult? Function(GetChatMessage value)? getChatMessage,
    TResult? Function(LoadMoreChatMessage value)? loadMoreChatMessage,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(ChatSelected value)? chatSelected,
  }) {
    return loadMoreChatMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatStarted value)? started,
    TResult Function(ChatReset value)? reset,
    TResult Function(UserSelected value)? userSelected,
    TResult Function(GetChatMessage value)? getChatMessage,
    TResult Function(LoadMoreChatMessage value)? loadMoreChatMessage,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(ChatSelected value)? chatSelected,
    required TResult orElse(),
  }) {
    if (loadMoreChatMessage != null) {
      return loadMoreChatMessage(this);
    }
    return orElse();
  }
}

abstract class LoadMoreChatMessage implements ChatEvent {
  const factory LoadMoreChatMessage() = _$LoadMoreChatMessageImpl;
}

/// @nodoc
abstract class _$$SendMessageImplCopyWith<$Res> {
  factory _$$SendMessageImplCopyWith(
          _$SendMessageImpl value, $Res Function(_$SendMessageImpl) then) =
      __$$SendMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int chatId, ChatMessage message});
}

/// @nodoc
class __$$SendMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SendMessageImpl>
    implements _$$SendMessageImplCopyWith<$Res> {
  __$$SendMessageImplCopyWithImpl(
      _$SendMessageImpl _value, $Res Function(_$SendMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? message = null,
  }) {
    return _then(_$SendMessageImpl(
      null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ChatMessage,
    ));
  }
}

/// @nodoc

class _$SendMessageImpl with DiagnosticableTreeMixin implements SendMessage {
  const _$SendMessageImpl(this.chatId, this.message);

  @override
  final int chatId;
  @override
  final ChatMessage message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatEvent.sendMessage(chatId: $chatId, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatEvent.sendMessage'))
      ..add(DiagnosticsProperty('chatId', chatId))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatId, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      __$$SendMessageImplCopyWithImpl<_$SendMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? shouldResetChat) reset,
    required TResult Function(UserEntity user) userSelected,
    required TResult Function() getChatMessage,
    required TResult Function() loadMoreChatMessage,
    required TResult Function(int chatId, ChatMessage message) sendMessage,
    required TResult Function(ChatEntity chat) chatSelected,
  }) {
    return sendMessage(chatId, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool? shouldResetChat)? reset,
    TResult? Function(UserEntity user)? userSelected,
    TResult? Function()? getChatMessage,
    TResult? Function()? loadMoreChatMessage,
    TResult? Function(int chatId, ChatMessage message)? sendMessage,
    TResult? Function(ChatEntity chat)? chatSelected,
  }) {
    return sendMessage?.call(chatId, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? shouldResetChat)? reset,
    TResult Function(UserEntity user)? userSelected,
    TResult Function()? getChatMessage,
    TResult Function()? loadMoreChatMessage,
    TResult Function(int chatId, ChatMessage message)? sendMessage,
    TResult Function(ChatEntity chat)? chatSelected,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(chatId, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatStarted value) started,
    required TResult Function(ChatReset value) reset,
    required TResult Function(UserSelected value) userSelected,
    required TResult Function(GetChatMessage value) getChatMessage,
    required TResult Function(LoadMoreChatMessage value) loadMoreChatMessage,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(ChatSelected value) chatSelected,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatStarted value)? started,
    TResult? Function(ChatReset value)? reset,
    TResult? Function(UserSelected value)? userSelected,
    TResult? Function(GetChatMessage value)? getChatMessage,
    TResult? Function(LoadMoreChatMessage value)? loadMoreChatMessage,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(ChatSelected value)? chatSelected,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatStarted value)? started,
    TResult Function(ChatReset value)? reset,
    TResult Function(UserSelected value)? userSelected,
    TResult Function(GetChatMessage value)? getChatMessage,
    TResult Function(LoadMoreChatMessage value)? loadMoreChatMessage,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(ChatSelected value)? chatSelected,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class SendMessage implements ChatEvent {
  const factory SendMessage(final int chatId, final ChatMessage message) =
      _$SendMessageImpl;

  int get chatId;
  ChatMessage get message;
  @JsonKey(ignore: true)
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatSelectedImplCopyWith<$Res> {
  factory _$$ChatSelectedImplCopyWith(
          _$ChatSelectedImpl value, $Res Function(_$ChatSelectedImpl) then) =
      __$$ChatSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChatEntity chat});

  $ChatEntityCopyWith<$Res> get chat;
}

/// @nodoc
class __$$ChatSelectedImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$ChatSelectedImpl>
    implements _$$ChatSelectedImplCopyWith<$Res> {
  __$$ChatSelectedImplCopyWithImpl(
      _$ChatSelectedImpl _value, $Res Function(_$ChatSelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chat = null,
  }) {
    return _then(_$ChatSelectedImpl(
      null == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as ChatEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatEntityCopyWith<$Res> get chat {
    return $ChatEntityCopyWith<$Res>(_value.chat, (value) {
      return _then(_value.copyWith(chat: value));
    });
  }
}

/// @nodoc

class _$ChatSelectedImpl with DiagnosticableTreeMixin implements ChatSelected {
  const _$ChatSelectedImpl(this.chat);

  @override
  final ChatEntity chat;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatEvent.chatSelected(chat: $chat)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatEvent.chatSelected'))
      ..add(DiagnosticsProperty('chat', chat));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatSelectedImpl &&
            (identical(other.chat, chat) || other.chat == chat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatSelectedImplCopyWith<_$ChatSelectedImpl> get copyWith =>
      __$$ChatSelectedImplCopyWithImpl<_$ChatSelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? shouldResetChat) reset,
    required TResult Function(UserEntity user) userSelected,
    required TResult Function() getChatMessage,
    required TResult Function() loadMoreChatMessage,
    required TResult Function(int chatId, ChatMessage message) sendMessage,
    required TResult Function(ChatEntity chat) chatSelected,
  }) {
    return chatSelected(chat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool? shouldResetChat)? reset,
    TResult? Function(UserEntity user)? userSelected,
    TResult? Function()? getChatMessage,
    TResult? Function()? loadMoreChatMessage,
    TResult? Function(int chatId, ChatMessage message)? sendMessage,
    TResult? Function(ChatEntity chat)? chatSelected,
  }) {
    return chatSelected?.call(chat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? shouldResetChat)? reset,
    TResult Function(UserEntity user)? userSelected,
    TResult Function()? getChatMessage,
    TResult Function()? loadMoreChatMessage,
    TResult Function(int chatId, ChatMessage message)? sendMessage,
    TResult Function(ChatEntity chat)? chatSelected,
    required TResult orElse(),
  }) {
    if (chatSelected != null) {
      return chatSelected(chat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatStarted value) started,
    required TResult Function(ChatReset value) reset,
    required TResult Function(UserSelected value) userSelected,
    required TResult Function(GetChatMessage value) getChatMessage,
    required TResult Function(LoadMoreChatMessage value) loadMoreChatMessage,
    required TResult Function(SendMessage value) sendMessage,
    required TResult Function(ChatSelected value) chatSelected,
  }) {
    return chatSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatStarted value)? started,
    TResult? Function(ChatReset value)? reset,
    TResult? Function(UserSelected value)? userSelected,
    TResult? Function(GetChatMessage value)? getChatMessage,
    TResult? Function(LoadMoreChatMessage value)? loadMoreChatMessage,
    TResult? Function(SendMessage value)? sendMessage,
    TResult? Function(ChatSelected value)? chatSelected,
  }) {
    return chatSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatStarted value)? started,
    TResult Function(ChatReset value)? reset,
    TResult Function(UserSelected value)? userSelected,
    TResult Function(GetChatMessage value)? getChatMessage,
    TResult Function(LoadMoreChatMessage value)? loadMoreChatMessage,
    TResult Function(SendMessage value)? sendMessage,
    TResult Function(ChatSelected value)? chatSelected,
    required TResult orElse(),
  }) {
    if (chatSelected != null) {
      return chatSelected(this);
    }
    return orElse();
  }
}

abstract class ChatSelected implements ChatEvent {
  const factory ChatSelected(final ChatEntity chat) = _$ChatSelectedImpl;

  ChatEntity get chat;
  @JsonKey(ignore: true)
  _$$ChatSelectedImplCopyWith<_$ChatSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatState {
  List<ChatEntity> get chats => throw _privateConstructorUsedError;
  List<ChatMessageEntity> get chatMessages =>
      throw _privateConstructorUsedError;
  ChatEntity? get selectedChat => throw _privateConstructorUsedError;
  DataStatus get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int? get otherUserId => throw _privateConstructorUsedError;
  bool get isLastPage => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call(
      {List<ChatEntity> chats,
      List<ChatMessageEntity> chatMessages,
      ChatEntity? selectedChat,
      DataStatus status,
      String message,
      int? otherUserId,
      bool isLastPage,
      int page});

  $ChatEntityCopyWith<$Res>? get selectedChat;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
    Object? chatMessages = null,
    Object? selectedChat = freezed,
    Object? status = null,
    Object? message = null,
    Object? otherUserId = freezed,
    Object? isLastPage = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      chats: null == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatEntity>,
      chatMessages: null == chatMessages
          ? _value.chatMessages
          : chatMessages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessageEntity>,
      selectedChat: freezed == selectedChat
          ? _value.selectedChat
          : selectedChat // ignore: cast_nullable_to_non_nullable
              as ChatEntity?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      otherUserId: freezed == otherUserId
          ? _value.otherUserId
          : otherUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatEntityCopyWith<$Res>? get selectedChat {
    if (_value.selectedChat == null) {
      return null;
    }

    return $ChatEntityCopyWith<$Res>(_value.selectedChat!, (value) {
      return _then(_value.copyWith(selectedChat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatStateImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateImplCopyWith(
          _$ChatStateImpl value, $Res Function(_$ChatStateImpl) then) =
      __$$ChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ChatEntity> chats,
      List<ChatMessageEntity> chatMessages,
      ChatEntity? selectedChat,
      DataStatus status,
      String message,
      int? otherUserId,
      bool isLastPage,
      int page});

  @override
  $ChatEntityCopyWith<$Res>? get selectedChat;
}

/// @nodoc
class __$$ChatStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateImpl>
    implements _$$ChatStateImplCopyWith<$Res> {
  __$$ChatStateImplCopyWithImpl(
      _$ChatStateImpl _value, $Res Function(_$ChatStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
    Object? chatMessages = null,
    Object? selectedChat = freezed,
    Object? status = null,
    Object? message = null,
    Object? otherUserId = freezed,
    Object? isLastPage = null,
    Object? page = null,
  }) {
    return _then(_$ChatStateImpl(
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatEntity>,
      chatMessages: null == chatMessages
          ? _value._chatMessages
          : chatMessages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessageEntity>,
      selectedChat: freezed == selectedChat
          ? _value.selectedChat
          : selectedChat // ignore: cast_nullable_to_non_nullable
              as ChatEntity?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      otherUserId: freezed == otherUserId
          ? _value.otherUserId
          : otherUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChatStateImpl extends _ChatState with DiagnosticableTreeMixin {
  const _$ChatStateImpl(
      {required final List<ChatEntity> chats,
      required final List<ChatMessageEntity> chatMessages,
      this.selectedChat,
      required this.status,
      required this.message,
      this.otherUserId,
      required this.isLastPage,
      required this.page})
      : _chats = chats,
        _chatMessages = chatMessages,
        super._();

  final List<ChatEntity> _chats;
  @override
  List<ChatEntity> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  final List<ChatMessageEntity> _chatMessages;
  @override
  List<ChatMessageEntity> get chatMessages {
    if (_chatMessages is EqualUnmodifiableListView) return _chatMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatMessages);
  }

  @override
  final ChatEntity? selectedChat;
  @override
  final DataStatus status;
  @override
  final String message;
  @override
  final int? otherUserId;
  @override
  final bool isLastPage;
  @override
  final int page;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatState(chats: $chats, chatMessages: $chatMessages, selectedChat: $selectedChat, status: $status, message: $message, otherUserId: $otherUserId, isLastPage: $isLastPage, page: $page)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatState'))
      ..add(DiagnosticsProperty('chats', chats))
      ..add(DiagnosticsProperty('chatMessages', chatMessages))
      ..add(DiagnosticsProperty('selectedChat', selectedChat))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('otherUserId', otherUserId))
      ..add(DiagnosticsProperty('isLastPage', isLastPage))
      ..add(DiagnosticsProperty('page', page));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            const DeepCollectionEquality().equals(other._chats, _chats) &&
            const DeepCollectionEquality()
                .equals(other._chatMessages, _chatMessages) &&
            (identical(other.selectedChat, selectedChat) ||
                other.selectedChat == selectedChat) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.otherUserId, otherUserId) ||
                other.otherUserId == otherUserId) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_chats),
      const DeepCollectionEquality().hash(_chatMessages),
      selectedChat,
      status,
      message,
      otherUserId,
      isLastPage,
      page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);
}

abstract class _ChatState extends ChatState {
  const factory _ChatState(
      {required final List<ChatEntity> chats,
      required final List<ChatMessageEntity> chatMessages,
      final ChatEntity? selectedChat,
      required final DataStatus status,
      required final String message,
      final int? otherUserId,
      required final bool isLastPage,
      required final int page}) = _$ChatStateImpl;
  const _ChatState._() : super._();

  @override
  List<ChatEntity> get chats;
  @override
  List<ChatMessageEntity> get chatMessages;
  @override
  ChatEntity? get selectedChat;
  @override
  DataStatus get status;
  @override
  String get message;
  @override
  int? get otherUserId;
  @override
  bool get isLastPage;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
