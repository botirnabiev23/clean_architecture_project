// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'number_trivia_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NumberTriviaEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NumberTriviaEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NumberTriviaEvent()';
}


}

/// @nodoc
class $NumberTriviaEventCopyWith<$Res>  {
$NumberTriviaEventCopyWith(NumberTriviaEvent _, $Res Function(NumberTriviaEvent) __);
}


/// Adds pattern-matching-related methods to [NumberTriviaEvent].
extension NumberTriviaEventPatterns on NumberTriviaEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,}) {final _that = this;
switch (_that) {
case _Load():
return load();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _:
  return null;

}
}

}

/// @nodoc


class _Load implements NumberTriviaEvent {
  const _Load();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NumberTriviaEvent.load()';
}


}




/// @nodoc
mixin _$NumberTriviaState {

 NumberTrivia? get trivia; bool get isLoading; String? get errorMessage;
/// Create a copy of NumberTriviaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NumberTriviaStateCopyWith<NumberTriviaState> get copyWith => _$NumberTriviaStateCopyWithImpl<NumberTriviaState>(this as NumberTriviaState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NumberTriviaState&&(identical(other.trivia, trivia) || other.trivia == trivia)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,trivia,isLoading,errorMessage);

@override
String toString() {
  return 'NumberTriviaState(trivia: $trivia, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $NumberTriviaStateCopyWith<$Res>  {
  factory $NumberTriviaStateCopyWith(NumberTriviaState value, $Res Function(NumberTriviaState) _then) = _$NumberTriviaStateCopyWithImpl;
@useResult
$Res call({
 NumberTrivia? trivia, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$NumberTriviaStateCopyWithImpl<$Res>
    implements $NumberTriviaStateCopyWith<$Res> {
  _$NumberTriviaStateCopyWithImpl(this._self, this._then);

  final NumberTriviaState _self;
  final $Res Function(NumberTriviaState) _then;

/// Create a copy of NumberTriviaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trivia = freezed,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
trivia: freezed == trivia ? _self.trivia : trivia // ignore: cast_nullable_to_non_nullable
as NumberTrivia?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NumberTriviaState].
extension NumberTriviaStatePatterns on NumberTriviaState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NumberTriviaState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NumberTriviaState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NumberTriviaState value)  $default,){
final _that = this;
switch (_that) {
case _NumberTriviaState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NumberTriviaState value)?  $default,){
final _that = this;
switch (_that) {
case _NumberTriviaState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NumberTrivia? trivia,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NumberTriviaState() when $default != null:
return $default(_that.trivia,_that.isLoading,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NumberTrivia? trivia,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _NumberTriviaState():
return $default(_that.trivia,_that.isLoading,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NumberTrivia? trivia,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _NumberTriviaState() when $default != null:
return $default(_that.trivia,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _NumberTriviaState implements NumberTriviaState {
  const _NumberTriviaState({this.trivia, this.isLoading = false, this.errorMessage});
  

@override final  NumberTrivia? trivia;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of NumberTriviaState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NumberTriviaStateCopyWith<_NumberTriviaState> get copyWith => __$NumberTriviaStateCopyWithImpl<_NumberTriviaState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NumberTriviaState&&(identical(other.trivia, trivia) || other.trivia == trivia)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,trivia,isLoading,errorMessage);

@override
String toString() {
  return 'NumberTriviaState(trivia: $trivia, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$NumberTriviaStateCopyWith<$Res> implements $NumberTriviaStateCopyWith<$Res> {
  factory _$NumberTriviaStateCopyWith(_NumberTriviaState value, $Res Function(_NumberTriviaState) _then) = __$NumberTriviaStateCopyWithImpl;
@override @useResult
$Res call({
 NumberTrivia? trivia, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$NumberTriviaStateCopyWithImpl<$Res>
    implements _$NumberTriviaStateCopyWith<$Res> {
  __$NumberTriviaStateCopyWithImpl(this._self, this._then);

  final _NumberTriviaState _self;
  final $Res Function(_NumberTriviaState) _then;

/// Create a copy of NumberTriviaState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trivia = freezed,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_NumberTriviaState(
trivia: freezed == trivia ? _self.trivia : trivia // ignore: cast_nullable_to_non_nullable
as NumberTrivia?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
