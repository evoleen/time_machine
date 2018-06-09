// Portions of this work are Copyright 2018 The Time Machine Authors. All rights reserved.
// Portions of this work are Copyright 2018 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0, as found in the LICENSE.txt file.

import 'package:meta/meta.dart';

import 'package:time_machine/time_machine.dart';


/// Represents an era used in a calendar.
///
/// All the built-in calendars in Time Machine use the values specified by the static
/// read-only fields in this class. These may be compared for reference equality to check for specific
/// eras.
// sealed
@immutable
class Era {
  /// The "Common" era (CE), also known as Anno Domini (AD). This is used in the ISO, Gregorian and Julian calendars.
  static const Era Common = const Era("CE", "Eras_Common");

  /// The "before common" era (BCE), also known as Before Christ (BC). This is used in the ISO, Gregorian and Julian calendars.
  static const Era BeforeCommon = const Era("BCE", "Eras_BeforeCommon");

  /// The "Anno Martyrum" or "Era of the Martyrs". This is the sole era used in the Coptic calendar.
  static const Era AnnoMartyrum = const Era("AM", "Eras_AnnoMartyrum");

  /// The "Anno Hegira" era. This is the sole era used in the Hijri (Islamic) calendar.
  static const Era AnnoHegirae = const Era("EH", "Eras_AnnoHegirae");

  /// The "Anno Mundi" era. This is the sole era used in the Hebrew calendar.
  static const Era AnnoMundi = const Era("AM", "Eras_AnnoMundi");

  /// The "Anno Persico" era. This is the sole era used in the Persian calendar.
  static const Era AnnoPersico = const Era("AP", "Eras_AnnoPersico");

  /// The "Bahá'í" era. This is the sole era used in the Wondrous calendar.
  static const Era Bahai = const Era("BE", "Eras_Bahai");

  @internal final String resourceIdentifier;

  /// Returns the name of this era, e.g. "CE" or "BCE".
  final String name;

  @internal const Era(this.name, this.resourceIdentifier);

  
  /// Returns the name of this era.
  ///
  /// Returns: The name of this era.
  @override String toString() => name;
}
