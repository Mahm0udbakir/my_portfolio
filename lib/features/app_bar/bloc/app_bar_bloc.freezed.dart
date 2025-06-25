// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bar_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AppBarEvent {
  int get index => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) sectionChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? sectionChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? sectionChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SectionChanged value) sectionChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SectionChanged value)? sectionChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SectionChanged value)? sectionChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of AppBarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppBarEventCopyWith<AppBarEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppBarEventCopyWith<$Res> {
  factory $AppBarEventCopyWith(
    AppBarEvent value,
    $Res Function(AppBarEvent) then,
  ) = _$AppBarEventCopyWithImpl<$Res, AppBarEvent>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class _$AppBarEventCopyWithImpl<$Res, $Val extends AppBarEvent>
    implements $AppBarEventCopyWith<$Res> {
  _$AppBarEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppBarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? index = null}) {
    return _then(
      _value.copyWith(
            index:
                null == index
                    ? _value.index
                    : index // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SectionChangedImplCopyWith<$Res>
    implements $AppBarEventCopyWith<$Res> {
  factory _$$SectionChangedImplCopyWith(
    _$SectionChangedImpl value,
    $Res Function(_$SectionChangedImpl) then,
  ) = __$$SectionChangedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$SectionChangedImplCopyWithImpl<$Res>
    extends _$AppBarEventCopyWithImpl<$Res, _$SectionChangedImpl>
    implements _$$SectionChangedImplCopyWith<$Res> {
  __$$SectionChangedImplCopyWithImpl(
    _$SectionChangedImpl _value,
    $Res Function(_$SectionChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? index = null}) {
    return _then(
      _$SectionChangedImpl(
        null == index
            ? _value.index
            : index // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$SectionChangedImpl implements SectionChanged {
  const _$SectionChangedImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'AppBarEvent.sectionChanged(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SectionChangedImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of AppBarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SectionChangedImplCopyWith<_$SectionChangedImpl> get copyWith =>
      __$$SectionChangedImplCopyWithImpl<_$SectionChangedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) sectionChanged,
  }) {
    return sectionChanged(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? sectionChanged,
  }) {
    return sectionChanged?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? sectionChanged,
    required TResult orElse(),
  }) {
    if (sectionChanged != null) {
      return sectionChanged(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SectionChanged value) sectionChanged,
  }) {
    return sectionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SectionChanged value)? sectionChanged,
  }) {
    return sectionChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SectionChanged value)? sectionChanged,
    required TResult orElse(),
  }) {
    if (sectionChanged != null) {
      return sectionChanged(this);
    }
    return orElse();
  }
}

abstract class SectionChanged implements AppBarEvent {
  const factory SectionChanged(final int index) = _$SectionChangedImpl;

  @override
  int get index;

  /// Create a copy of AppBarEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SectionChangedImplCopyWith<_$SectionChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppBarState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index) section,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index)? section,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index)? section,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Section value) section,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Section value)? section,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Section value)? section,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppBarStateCopyWith<$Res> {
  factory $AppBarStateCopyWith(
    AppBarState value,
    $Res Function(AppBarState) then,
  ) = _$AppBarStateCopyWithImpl<$Res, AppBarState>;
}

/// @nodoc
class _$AppBarStateCopyWithImpl<$Res, $Val extends AppBarState>
    implements $AppBarStateCopyWith<$Res> {
  _$AppBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppBarState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AppBarStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBarState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AppBarState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index) section,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index)? section,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index)? section,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Section value) section,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Section value)? section,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Section value)? section,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AppBarState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SectionImplCopyWith<$Res> {
  factory _$$SectionImplCopyWith(
    _$SectionImpl value,
    $Res Function(_$SectionImpl) then,
  ) = __$$SectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$SectionImplCopyWithImpl<$Res>
    extends _$AppBarStateCopyWithImpl<$Res, _$SectionImpl>
    implements _$$SectionImplCopyWith<$Res> {
  __$$SectionImplCopyWithImpl(
    _$SectionImpl _value,
    $Res Function(_$SectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? index = null}) {
    return _then(
      _$SectionImpl(
        null == index
            ? _value.index
            : index // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$SectionImpl implements _Section {
  const _$SectionImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'AppBarState.section(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SectionImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of AppBarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SectionImplCopyWith<_$SectionImpl> get copyWith =>
      __$$SectionImplCopyWithImpl<_$SectionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index) section,
  }) {
    return section(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index)? section,
  }) {
    return section?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index)? section,
    required TResult orElse(),
  }) {
    if (section != null) {
      return section(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Section value) section,
  }) {
    return section(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Section value)? section,
  }) {
    return section?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Section value)? section,
    required TResult orElse(),
  }) {
    if (section != null) {
      return section(this);
    }
    return orElse();
  }
}

abstract class _Section implements AppBarState {
  const factory _Section(final int index) = _$SectionImpl;

  int get index;

  /// Create a copy of AppBarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SectionImplCopyWith<_$SectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
