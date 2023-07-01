import 'package:notes/domain/core/failures.dart';
import 'package:notes/domain/core/value_objects.dart';
import 'package:notes/domain/core/value_validators.dart';
import 'package:oxidized/oxidized.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Result<String, ValueFailure<String>> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Result<String, ValueFailure<String>> value;

  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}
