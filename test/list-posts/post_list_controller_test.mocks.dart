// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_random_list/test/list_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/widgets.dart' as _i4;
import 'package:get/get_core/src/get_interface.dart' as _i2;
import 'package:get/get_core/src/log.dart' as _i5;
import 'package:get/get_core/src/smart_management.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [GetInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetInterface extends _i1.Mock implements _i2.GetInterface {
  MockGetInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.SmartManagement get smartManagement => (super.noSuchMethod(
        Invocation.getter(#smartManagement),
        returnValue: _i3.SmartManagement.full,
      ) as _i3.SmartManagement);

  @override
  set smartManagement(_i3.SmartManagement? _smartManagement) =>
      super.noSuchMethod(
        Invocation.setter(
          #smartManagement,
          _smartManagement,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set routerDelegate(_i4.RouterDelegate<dynamic>? _routerDelegate) =>
      super.noSuchMethod(
        Invocation.setter(
          #routerDelegate,
          _routerDelegate,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set routeInformationParser(
          _i4.RouteInformationParser<dynamic>? _routeInformationParser) =>
      super.noSuchMethod(
        Invocation.setter(
          #routeInformationParser,
          _routeInformationParser,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get isLogEnable => (super.noSuchMethod(
        Invocation.getter(#isLogEnable),
        returnValue: false,
      ) as bool);

  @override
  set isLogEnable(bool? _isLogEnable) => super.noSuchMethod(
        Invocation.setter(
          #isLogEnable,
          _isLogEnable,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.LogWriterCallback get log => (super.noSuchMethod(
        Invocation.getter(#log),
        returnValue: (
          String text, {
          bool? isError,
        }) {},
      ) as _i5.LogWriterCallback);

  @override
  set log(_i5.LogWriterCallback? _log) => super.noSuchMethod(
        Invocation.setter(
          #log,
          _log,
        ),
        returnValueForMissingStub: null,
      );
}