// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/src/dart/error/syntactic_errors.dart';

import 'partial_code_support.dart';

main() {
  new LocalVariableTest().buildAll();
}

class LocalVariableTest extends PartialCodeTest {
  buildAll() {
    List<bool> exceptAtEof = [
      false,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true
    ];
    buildTests(
        'local_variable',
        [
          new TestDescriptor(
              'const',
              'const',
              [
                ParserErrorCode.MISSING_IDENTIFIER,
                ParserErrorCode.EXPECTED_TOKEN
              ],
              "const _s_;",
              allFailing: true),
          new TestDescriptor('constName', 'const a',
              [ParserErrorCode.EXPECTED_TOKEN], "const a;",
              allFailing: true),
          new TestDescriptor('constTypeName', 'const int a',
              [ParserErrorCode.EXPECTED_TOKEN], "const int a;",
              allFailing: true),
          new TestDescriptor(
              'constNameComma',
              'const a,',
              [
                ParserErrorCode.MISSING_IDENTIFIER,
                ParserErrorCode.EXPECTED_TOKEN
              ],
              "const a, _s_;",
              failing: [
                true,
                true,
                true,
                true,
                true,
                false,
                false,
                true,
                true,
                true,
                true,
                false,
                false,
                false,
                true,
                false
              ]),
          new TestDescriptor(
              'constTypeNameComma',
              'const int a,',
              [
                ParserErrorCode.MISSING_IDENTIFIER,
                ParserErrorCode.EXPECTED_TOKEN
              ],
              "const int a, _s_;",
              failing: [
                true,
                true,
                true,
                true,
                true,
                false,
                false,
                true,
                true,
                true,
                true,
                false,
                false,
                false,
                true,
                false
              ]),
          new TestDescriptor('constNameCommaName', 'const a, b',
              [ParserErrorCode.EXPECTED_TOKEN], "const a, b;"),
          new TestDescriptor('constTypeNameCommaName', 'const int a, b',
              [ParserErrorCode.EXPECTED_TOKEN], "const int a, b;"),
          new TestDescriptor(
              'final',
              'final',
              [
                ParserErrorCode.MISSING_IDENTIFIER,
                ParserErrorCode.EXPECTED_TOKEN
              ],
              "final _s_;",
              failing: [
                true,
                true,
                true,
                true,
                true,
                false,
                false,
                true,
                true,
                true,
                true,
                true,
                false,
                false,
                true,
                false
              ]),
          new TestDescriptor('finalName', 'final a',
              [ParserErrorCode.EXPECTED_TOKEN], "final a;",
              failing: [
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                true,
                true,
                false,
                false,
                false,
                false,
                false,
                false
              ]),
          new TestDescriptor('finalTypeName', 'final int a',
              [ParserErrorCode.EXPECTED_TOKEN], "final int a;"),
          new TestDescriptor(
              'type',
              'int',
              [
                ParserErrorCode.MISSING_IDENTIFIER,
                ParserErrorCode.EXPECTED_TOKEN
              ],
              "int _s_;",
              allFailing: true),
          new TestDescriptor(
              'typeName', 'int a', [ParserErrorCode.EXPECTED_TOKEN], "int a;",
              allFailing: true),
          new TestDescriptor(
              'var',
              'var',
              [
                ParserErrorCode.MISSING_IDENTIFIER,
                ParserErrorCode.EXPECTED_TOKEN
              ],
              "var _s_;",
              failing: [
                true,
                true,
                true,
                true,
                true,
                false,
                false,
                true,
                true,
                true,
                true,
                true,
                false,
                false,
                true,
                false
              ]),
          new TestDescriptor(
              'varName', 'var a', [ParserErrorCode.EXPECTED_TOKEN], "var a;",
              failing: [
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                true,
                true,
                false,
                false,
                false,
                false,
                false,
                false
              ]),
          new TestDescriptor(
              'varNameEquals',
              'var a =',
              [
                ParserErrorCode.MISSING_IDENTIFIER,
                ParserErrorCode.EXPECTED_TOKEN
              ],
              "var a = _s_;",
              failing: exceptAtEof),
          new TestDescriptor(
              'varNameEqualsExpression',
              'var a = b',
              [
                ParserErrorCode.MISSING_IDENTIFIER,
                ParserErrorCode.EXPECTED_TOKEN
              ],
              "var a = b;",
              allFailing: true),
        ],
        PartialCodeTest.statementSuffixes,
        head: 'f() { ',
        tail: ' }');
  }
}
