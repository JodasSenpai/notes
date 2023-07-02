import 'package:flutter/material.dart';
import 'package:notes/domain/core/common_interfaces.dart';
import 'package:notes/domain/core/failures.dart';
import 'package:notes/domain/core/value_validators.dart';
import 'package:oxidized/oxidized.dart';

import 'errors.dart';

@immutable
abstract class ValueObject<T extends Object> implements IValidatable {
  const ValueObject();

  Result<T, ValueFailure<T>> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    final result =
    value.fold((ok) => ok, (error) => throw UnexpectedValueError(error));
    return result.expect("UnexpectedValueError");
  }

  T getOrElse(T dflt) {
    return value.unwrapOr(dflt);
  }

  Result<Unit, ValueFailure<T>> get failureOrUnit {
    return value.fold((ok) => unit, (error) => error);
  }

  @override
  bool isValid() {
    return value.isOk();
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class UniqueStringId extends ValueObject<String> {
  @override
  final Result<String, ValueFailure<String>> value;

  const UniqueStringId._(this.value);

  /// Used with strings we trust are unique, such as database IDs.
  factory UniqueStringId.fromUniqueString(String uniqueIdStr) {
    return UniqueStringId._(
      Ok(uniqueIdStr),
    );
  }
}

class UniqueIntId extends ValueObject<int> {
  @override
  final Result<int, ValueFailure<int>> value;

  const UniqueIntId._(this.value);

  /// Used with strings we trust are unique, such as database IDs.
  factory UniqueIntId.fromUniqueInt(int uniqueIdInt) {
    return UniqueIntId._(
      Ok(uniqueIdInt),
    );
  }
}

class StringSingleLine extends ValueObject<String> {
  @override
  final Result<String, ValueFailure<String>> value;

  factory StringSingleLine(String input) {
    return StringSingleLine._(
      validateSingleLine(input),
    );
  }

  const StringSingleLine._(this.value);
}

class StringMultiLine extends ValueObject<String> {
  @override
  final Result<String, ValueFailure<String>> value;

  factory StringMultiLine(String input) {
    return StringMultiLine._(
      validateMultiLine(input),
    );
  }

  const StringMultiLine._(this.value);
}

class Date extends ValueObject<DateTime> {
  @override
  final Result<DateTime, ValueFailure<DateTime>> value;

  factory Date(DateTime input){
    return Date._(
      validateDate(input),
    );
  }

  const Date._(this.value);
}