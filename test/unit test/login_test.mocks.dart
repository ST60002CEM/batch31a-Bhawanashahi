// Mocks generated by Mockito 5.4.4 from annotations
// in online_pet_shop/test/unit%20test/login_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i2;
import 'package:flutter/foundation.dart' as _i4;
import 'package:flutter/src/widgets/framework.dart' as _i3;
import 'package:flutter/src/widgets/notification_listener.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;
import 'package:online_pet_shop/core/failure/failure.dart' as _i7;
import 'package:online_pet_shop/feature/auth/domain/entity/auth_entity.dart'
    as _i9;
import 'package:online_pet_shop/feature/auth/domain/use_case/login_usecase.dart'
    as _i5;
import 'package:online_pet_shop/feature/auth/domain/use_case/register_usecase.dart'
    as _i8;

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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWidget_1 extends _i1.SmartFake implements _i3.Widget {
  _FakeWidget_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i4.DiagnosticLevel? minLevel = _i4.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeInheritedWidget_2 extends _i1.SmartFake
    implements _i3.InheritedWidget {
  _FakeInheritedWidget_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i4.DiagnosticLevel? minLevel = _i4.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeDiagnosticsNode_3 extends _i1.SmartFake
    implements _i4.DiagnosticsNode {
  _FakeDiagnosticsNode_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({
    _i4.TextTreeConfiguration? parentConfiguration,
    _i4.DiagnosticLevel? minLevel = _i4.DiagnosticLevel.info,
  }) =>
      super.toString();
}

/// A class which mocks [LoginUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginUseCase extends _i1.Mock implements _i5.LoginUseCase {
  @override
  _i6.Future<_i2.Either<_i7.Failure, bool>> loginUser(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #loginUser,
          [
            email,
            password,
          ],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, bool>>.value(
            _FakeEither_0<_i7.Failure, bool>(
          this,
          Invocation.method(
            #loginUser,
            [
              email,
              password,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.Either<_i7.Failure, bool>>.value(
                _FakeEither_0<_i7.Failure, bool>(
          this,
          Invocation.method(
            #loginUser,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, bool>>);
}

/// A class which mocks [RegisterUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockRegisterUseCase extends _i1.Mock implements _i8.RegisterUseCase {
  @override
  _i6.Future<_i2.Either<_i7.Failure, bool>> createUser(
          _i9.AuthEntity? entity) =>
      (super.noSuchMethod(
        Invocation.method(
          #createUser,
          [entity],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, bool>>.value(
            _FakeEither_0<_i7.Failure, bool>(
          this,
          Invocation.method(
            #createUser,
            [entity],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.Either<_i7.Failure, bool>>.value(
                _FakeEither_0<_i7.Failure, bool>(
          this,
          Invocation.method(
            #createUser,
            [entity],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, bool>>);
}

/// A class which mocks [BuildContext].
///
/// See the documentation for Mockito's code generation for more information.
class MockBuildContext extends _i1.Mock implements _i3.BuildContext {
  @override
  _i3.Widget get widget => (super.noSuchMethod(
        Invocation.getter(#widget),
        returnValue: _FakeWidget_1(
          this,
          Invocation.getter(#widget),
        ),
        returnValueForMissingStub: _FakeWidget_1(
          this,
          Invocation.getter(#widget),
        ),
      ) as _i3.Widget);

  @override
  bool get mounted => (super.noSuchMethod(
        Invocation.getter(#mounted),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get debugDoingBuild => (super.noSuchMethod(
        Invocation.getter(#debugDoingBuild),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i3.InheritedWidget dependOnInheritedElement(
    _i3.InheritedElement? ancestor, {
    Object? aspect,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #dependOnInheritedElement,
          [ancestor],
          {#aspect: aspect},
        ),
        returnValue: _FakeInheritedWidget_2(
          this,
          Invocation.method(
            #dependOnInheritedElement,
            [ancestor],
            {#aspect: aspect},
          ),
        ),
        returnValueForMissingStub: _FakeInheritedWidget_2(
          this,
          Invocation.method(
            #dependOnInheritedElement,
            [ancestor],
            {#aspect: aspect},
          ),
        ),
      ) as _i3.InheritedWidget);

  @override
  void visitAncestorElements(_i3.ConditionalElementVisitor? visitor) =>
      super.noSuchMethod(
        Invocation.method(
          #visitAncestorElements,
          [visitor],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void visitChildElements(_i3.ElementVisitor? visitor) => super.noSuchMethod(
        Invocation.method(
          #visitChildElements,
          [visitor],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispatchNotification(_i10.Notification? notification) =>
      super.noSuchMethod(
        Invocation.method(
          #dispatchNotification,
          [notification],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.DiagnosticsNode describeElement(
    String? name, {
    _i4.DiagnosticsTreeStyle? style = _i4.DiagnosticsTreeStyle.errorProperty,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeElement,
          [name],
          {#style: style},
        ),
        returnValue: _FakeDiagnosticsNode_3(
          this,
          Invocation.method(
            #describeElement,
            [name],
            {#style: style},
          ),
        ),
        returnValueForMissingStub: _FakeDiagnosticsNode_3(
          this,
          Invocation.method(
            #describeElement,
            [name],
            {#style: style},
          ),
        ),
      ) as _i4.DiagnosticsNode);

  @override
  _i4.DiagnosticsNode describeWidget(
    String? name, {
    _i4.DiagnosticsTreeStyle? style = _i4.DiagnosticsTreeStyle.errorProperty,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeWidget,
          [name],
          {#style: style},
        ),
        returnValue: _FakeDiagnosticsNode_3(
          this,
          Invocation.method(
            #describeWidget,
            [name],
            {#style: style},
          ),
        ),
        returnValueForMissingStub: _FakeDiagnosticsNode_3(
          this,
          Invocation.method(
            #describeWidget,
            [name],
            {#style: style},
          ),
        ),
      ) as _i4.DiagnosticsNode);

  @override
  List<_i4.DiagnosticsNode> describeMissingAncestor(
          {required Type? expectedAncestorType}) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeMissingAncestor,
          [],
          {#expectedAncestorType: expectedAncestorType},
        ),
        returnValue: <_i4.DiagnosticsNode>[],
        returnValueForMissingStub: <_i4.DiagnosticsNode>[],
      ) as List<_i4.DiagnosticsNode>);

  @override
  _i4.DiagnosticsNode describeOwnershipChain(String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeOwnershipChain,
          [name],
        ),
        returnValue: _FakeDiagnosticsNode_3(
          this,
          Invocation.method(
            #describeOwnershipChain,
            [name],
          ),
        ),
        returnValueForMissingStub: _FakeDiagnosticsNode_3(
          this,
          Invocation.method(
            #describeOwnershipChain,
            [name],
          ),
        ),
      ) as _i4.DiagnosticsNode);
}
