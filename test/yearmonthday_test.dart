// https://github.com/nodatime/nodatime/blob/master/src/NodaTime.Test/YearMonthDayTest.cs
// 16aacad  on Aug 26, 2017

import 'dart:async';
import 'dart:math' as math;

import 'package:time_machine/time_machine.dart';
import 'package:time_machine/time_machine_calendars.dart';
import 'package:time_machine/time_machine_utilities.dart';

import 'package:test/test.dart';
import 'package:matcher/matcher.dart';
import 'package:time_machine/time_machine_timezones.dart';

import 'time_machine_testing.dart';

Future main() async {
  await runTests();
}

@Test()
void AllYears()
{
  // Range of years we actually care about. We support more, but that's okay.
  for (int year = -9999; year <= 9999; year++)
  {
    var ymd = new YearMonthDay(year, 5, 20);
    expect(year, ymd.year);
    expect(5, ymd.month);
    expect(20, ymd.day);
  }
}

@Test()
void AllMonths()
{
  // We'll never actually need 32 months, but we support that many...
  for (int month = 1; month < 32; month++)
  {
    var ymd = new YearMonthDay(-123, month, 20);
    expect(-123, ymd.year);
    expect(month, ymd.month);
    expect(20, ymd.day);
  }
}

@Test()
void AllDays()
{
  // We'll never actually need 64 days, but we support that many...
  for (int day = 1; day < 64; day++)
  {
    var ymd = new YearMonthDay(-123, 30, day);
    expect(-123, ymd.year);
    expect(30, ymd.month);
    expect(day, ymd.day);
  }
}

@Test()
@TestCase(const ["1000-01-01", "1000-01-02"])
@TestCase(const ["1000-01-01", "1000-02-01"])
@TestCase(const ["999-16-64", "1000-01-01"])
@TestCase(const ["-1-01-01", "-1-01-02"])
@TestCase(const ["-1-01-01", "-1-02-01"])
@TestCase(const ["-2-16-64", "-1-01-01"])
@TestCase(const ["-1-16-64", "0-01-01"])
@TestCase(const ["-1-16-64", "1-01-01"])
void Comparisons(String smallerText, String greaterText)
{
  var smaller = YearMonthDay.parse(smallerText);
  var smaller2 = YearMonthDay.parse(smallerText);
  var greater = YearMonthDay.parse(greaterText);
  TestHelper.TestCompareToStruct(smaller, smaller2, [greater]);
  TestHelper.TestOperatorComparisonEquality(smaller2, smaller, [greater]);
  TestHelper.TestEqualsStruct(smaller, smaller2, [greater]);
}

@Test()
void YearMonthDayToString()
{
  var ymd = new YearMonthDay(2017, 8, 25);
  expect("2017-08-25", ymd.toString());
}