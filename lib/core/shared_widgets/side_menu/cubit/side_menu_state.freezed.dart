// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'side_menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SideMenuState {
  RiveAsset get selectedMenu => throw _privateConstructorUsedError;

  /// Create a copy of SideMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SideMenuStateCopyWith<SideMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SideMenuStateCopyWith<$Res> {
  factory $SideMenuStateCopyWith(
    SideMenuState value,
    $Res Function(SideMenuState) then,
  ) = _$SideMenuStateCopyWithImpl<$Res, SideMenuState>;
  @useResult
  $Res call({RiveAsset selectedMenu});
}

/// @nodoc
class _$SideMenuStateCopyWithImpl<$Res, $Val extends SideMenuState>
    implements $SideMenuStateCopyWith<$Res> {
  _$SideMenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SideMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? selectedMenu = null}) {
    return _then(
      _value.copyWith(
            selectedMenu:
                null == selectedMenu
                    ? _value.selectedMenu
                    : selectedMenu // ignore: cast_nullable_to_non_nullable
                        as RiveAsset,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SideMenuStateImplCopyWith<$Res>
    implements $SideMenuStateCopyWith<$Res> {
  factory _$$SideMenuStateImplCopyWith(
    _$SideMenuStateImpl value,
    $Res Function(_$SideMenuStateImpl) then,
  ) = __$$SideMenuStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RiveAsset selectedMenu});
}

/// @nodoc
class __$$SideMenuStateImplCopyWithImpl<$Res>
    extends _$SideMenuStateCopyWithImpl<$Res, _$SideMenuStateImpl>
    implements _$$SideMenuStateImplCopyWith<$Res> {
  __$$SideMenuStateImplCopyWithImpl(
    _$SideMenuStateImpl _value,
    $Res Function(_$SideMenuStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SideMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? selectedMenu = null}) {
    return _then(
      _$SideMenuStateImpl(
        selectedMenu:
            null == selectedMenu
                ? _value.selectedMenu
                : selectedMenu // ignore: cast_nullable_to_non_nullable
                    as RiveAsset,
      ),
    );
  }
}

/// @nodoc

class _$SideMenuStateImpl implements _SideMenuState {
  const _$SideMenuStateImpl({required this.selectedMenu});

  @override
  final RiveAsset selectedMenu;

  @override
  String toString() {
    return 'SideMenuState(selectedMenu: $selectedMenu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SideMenuStateImpl &&
            (identical(other.selectedMenu, selectedMenu) ||
                other.selectedMenu == selectedMenu));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedMenu);

  /// Create a copy of SideMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SideMenuStateImplCopyWith<_$SideMenuStateImpl> get copyWith =>
      __$$SideMenuStateImplCopyWithImpl<_$SideMenuStateImpl>(this, _$identity);
}

abstract class _SideMenuState implements SideMenuState {
  const factory _SideMenuState({required final RiveAsset selectedMenu}) =
      _$SideMenuStateImpl;

  @override
  RiveAsset get selectedMenu;

  /// Create a copy of SideMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SideMenuStateImplCopyWith<_$SideMenuStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
