// Portions of this work are Copyright 2018 The Time Machine Authors. All rights reserved.
// Portions of this work are Copyright 2018 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0, as found in the LICENSE.txt file.

/// Exception thrown when data read by Time Machine (such as serialized time zone data) is invalid. This includes
/// data which is truncated, i.e. we expect more data than we can read.
///
/// This type only exists as `InvalidDataException` didn't exist in Portable Class Libraries.
/// That does exist in netstandard1.3, but as we shipped 2.0 without realizing this, we're stuck with the
/// new exception type.
/// Unfortunately, `InvalidDataException` itself is sealed, so we can't derive from it for the sake
/// of backward compatibility.
///
/// <threadsafety>Any public static members of this type are thread safe. Any instance members are not guaranteed to be thread safe.
/// See the thread safety section of the user guide for more information.
/// </threadsafety>
/*sealed*/ class InvalidTimeDataError extends Error
{
  final String message;
  final Error error;

  /// Creates an instance with the given message.
  ///
  /// [message]: The message for the exception.
  InvalidTimeDataError(this.message, [this.error = null]);

  @override String toString() => error == null ? '$message' : '$message\n$error';
}
