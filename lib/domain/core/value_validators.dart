import 'package:notes/domain/core/failures.dart';
import 'package:oxidized/oxidized.dart';

Result<String, ValueFailure<String>> validateEmailAddress(String input) {
  // Maybe not the most robust way of email validation but it's good enough
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return Ok(input);
  } else {
    return Err(ValueFailure.invalidEmail(failedValue: input));
  }
}

Result<String, ValueFailure<String>> validatePassword(String input) {
  // You can also add some advanced password checks (uppercase/lowercase, at least 1 number, ...)
  if (input.length >= 6) {
    return Ok(input);
  } else {
    return Err(ValueFailure.shortPassword(failedValue: input));
  }
}

Result<String, ValueFailure<String>> validateSingleLine(String input) {
  if (input.contains('\n')) {
    return Err(ValueFailure.multiline(failedValue: input));
  } else {
    return Ok(input);
  }
}

Result<String, ValueFailure<String>> validateMultiLine(String input) {
  return Ok(input);
}

Result<DateTime, ValueFailure<DateTime>> validateDate(DateTime input) {
  return Ok(input);
}
