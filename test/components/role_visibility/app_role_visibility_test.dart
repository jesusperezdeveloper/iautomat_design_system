import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSRoleVisibility', () {
    testWidgets('renders child when user has required role', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSRoleVisibility(
              config: const DSRoleVisibilityConfig(
                roles: [DSRolePredefined.user],
              ),
              userRoles: const [DSRolePredefined.user],
              child: const Text('Visible Content'),
            ),
          ),
        ),
      );

      expect(find.text('Visible Content'), findsOneWidget);
    });

    testWidgets('hides child when user lacks required role', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSRoleVisibility(
              config: const DSRoleVisibilityConfig(
                roles: [DSRolePredefined.admin],
              ),
              userRoles: const [DSRolePredefined.user],
              child: const Text('Hidden Content'),
            ),
          ),
        ),
      );

      expect(find.text('Hidden Content'), findsNothing);
    });

    testWidgets('shows content for empty roles list', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSRoleVisibility(
              config: const DSRoleVisibilityConfig(
                roles: [],
              ),
              userRoles: const [DSRolePredefined.user],
              child: const Text('Public Content'),
            ),
          ),
        ),
      );

      expect(find.text('Public Content'), findsOneWidget);
    });

    testWidgets('respects evaluationMode.any', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSRoleVisibility(
              config: const DSRoleVisibilityConfig(
                roles: [DSRolePredefined.admin, DSRolePredefined.editor],
                evaluationMode: DSRoleEvaluationMode.any,
              ),
              userRoles: const [DSRolePredefined.editor],
              child: const Text('Editor Content'),
            ),
          ),
        ),
      );

      expect(find.text('Editor Content'), findsOneWidget);
    });

    testWidgets('respects evaluationMode.all', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSRoleVisibility(
              config: const DSRoleVisibilityConfig(
                roles: [DSRolePredefined.admin, DSRolePredefined.editor],
                evaluationMode: DSRoleEvaluationMode.all,
              ),
              userRoles: const [DSRolePredefined.editor],
              child: const Text('Restricted Content'),
            ),
          ),
        ),
      );

      expect(find.text('Restricted Content'), findsNothing);
    });

    testWidgets('shows error builder when access denied', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSRoleVisibility(
              config: const DSRoleVisibilityConfig(
                roles: [DSRolePredefined.admin],
                behavior: DSRoleVisibilityBehavior(
                  showErrorMessages: true,
                ),
              ),
              userRoles: const [DSRolePredefined.user],
              errorBuilder: (context, error, config) {
                return const Text('Access Denied');
              },
              child: const Text('Admin Content'),
            ),
          ),
        ),
      );

      expect(find.text('Access Denied'), findsOneWidget);
      expect(find.text('Admin Content'), findsNothing);
    });

    testWidgets('shows loading state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSRoleVisibility(
              config: const DSRoleVisibilityConfig(
                roles: [DSRolePredefined.admin],
                state: DSRoleState.loading,
              ),
              userRoles: const [DSRolePredefined.admin],
              loadingBuilder: (context, config) {
                return const CircularProgressIndicator();
              },
              child: const Text('Content'),
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Content'), findsNothing);
    });

    testWidgets('respects disabled state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSRoleVisibility(
              config: const DSRoleVisibilityConfig(
                roles: [DSRolePredefined.user],
                state: DSRoleState.disabled,
              ),
              userRoles: const [DSRolePredefined.user],
              child: const Text('Disabled Content'),
            ),
          ),
        ),
      );

      expect(find.text('Disabled Content'), findsNothing);
    });

    testWidgets('calls onVisibilityChanged callback', (tester) async {
      DSRoleEvaluationResult? result;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSRoleVisibility(
              config: const DSRoleVisibilityConfig(
                roles: [DSRolePredefined.user],
              ),
              userRoles: const [DSRolePredefined.user],
              onVisibilityChanged: (evaluationResult) {
                result = evaluationResult;
              },
              child: const Text('Content'),
            ),
          ),
        ),
      );

      await tester.pump();

      expect(result, isNotNull);
      expect(result!.hasAccess, isTrue);
    });

    testWidgets('preserves space when configured', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSRoleVisibility(
              config: const DSRoleVisibilityConfig(
                roles: [DSRolePredefined.admin],
                behavior: DSRoleVisibilityBehavior(
                  preserveSpaceWhenHidden: true,
                ),
              ),
              userRoles: const [DSRolePredefined.user],
              child: const SizedBox(
                height: 100,
                child: Text('Hidden Content'),
              ),
            ),
          ),
        ),
      );

      final opacityWidget = find.byType(Opacity);
      expect(opacityWidget, findsOneWidget);

      final opacity = tester.widget<Opacity>(opacityWidget);
      expect(opacity.opacity, equals(0.0));
    });

    testWidgets('handles role expiration', (tester) async {
      final expiredRole = DSRole(
        id: 'expired_user',
        type: DSRoleType.user,
        name: 'Expired User',
        expiresAt: DateTime.now().subtract(const Duration(days: 1)),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSRoleVisibility(
              config: const DSRoleVisibilityConfig(
                roles: [DSRolePredefined.user],
              ),
              userRoles: [expiredRole],
              child: const Text('Expired Content'),
            ),
          ),
        ),
      );

      expect(find.text('Expired Content'), findsNothing);
    });

    testWidgets('supports custom role hierarchy', (tester) async {
      final customRole = DSRole(
        id: 'custom_admin',
        type: DSRoleType.admin,
        name: 'Custom Admin',
        level: 10,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSRoleVisibility(
              config: const DSRoleVisibilityConfig(
                roles: [DSRolePredefined.admin],
                hierarchyConfig: DSRoleHierarchyConfig(
                  minimumLevel: 5,
                ),
              ),
              userRoles: [customRole],
              child: const Text('Hierarchy Content'),
            ),
          ),
        ),
      );

      expect(find.text('Hierarchy Content'), findsOneWidget);
    });
  });

  group('DSRoleVisibilityConfig', () {
    test('creates instance with default values', () {
      const config = DSRoleVisibilityConfig();

      expect(config.variant, DSRoleVariant.helpers);
      expect(config.roles, isEmpty);
      expect(config.state, DSRoleState.defaultState);
      expect(config.evaluationMode, DSRoleEvaluationMode.any);
    });

    test('creates instance with custom values', () {
      const config = DSRoleVisibilityConfig(
        variant: DSRoleVariant.helpers,
        roles: [DSRolePredefined.admin],
        state: DSRoleState.loading,
        evaluationMode: DSRoleEvaluationMode.all,
        showDebugHelpers: true,
      );

      expect(config.variant, DSRoleVariant.helpers);
      expect(config.roles.length, 1);
      expect(config.state, DSRoleState.loading);
      expect(config.evaluationMode, DSRoleEvaluationMode.all);
      expect(config.showDebugHelpers, true);
    });
  });

  group('DSRole', () {
    test('creates instance with required values', () {
      const role = DSRole(
        id: 'test_role',
        type: DSRoleType.user,
        name: 'Test Role',
      );

      expect(role.id, 'test_role');
      expect(role.type, DSRoleType.user);
      expect(role.name, 'Test Role');
      expect(role.isActive, true);
      expect(role.enabled, true);
      expect(role.permissions, isEmpty);
    });

    test('supports custom properties', () {
      final now = DateTime.now();
      final role = DSRole(
        id: 'custom_role',
        type: DSRoleType.admin,
        name: 'Custom Role',
        description: 'A custom role for testing',
        permissions: const ['read', 'write'],
        level: 5,
        expiresAt: now,
      );

      expect(role.id, 'custom_role');
      expect(role.description, 'A custom role for testing');
      expect(role.permissions, ['read', 'write']);
      expect(role.level, 5);
      expect(role.expiresAt, now);
    });
  });

  group('DSRoleValidators', () {
    test('isValidRole works correctly', () {
      const validRole = DSRole(
        id: 'valid',
        type: DSRoleType.user,
        name: 'Valid Role',
        isActive: true,
      );

      const invalidRole = DSRole(
        id: '',
        type: DSRoleType.user,
        name: 'Invalid Role',
        isActive: false,
      );

      expect(DSRoleValidators.isValidRole(validRole), true);
      expect(DSRoleValidators.isValidRole(invalidRole), false);
    });

    test('hasPermission works correctly', () {
      const roles = [
        DSRole(
          id: 'admin',
          type: DSRoleType.admin,
          name: 'Admin',
          permissions: ['*'],
        ),
        DSRole(
          id: 'editor',
          type: DSRoleType.editor,
          name: 'Editor',
          permissions: ['content.edit', 'content.view'],
        ),
      ];

      expect(DSRoleValidators.hasPermission(roles, 'anything'), true); // Admin wildcard
      expect(DSRoleValidators.hasPermission(roles, 'content.edit'), true);
      expect(DSRoleValidators.hasPermission(roles, 'user.delete'), true); // Admin wildcard
      expect(DSRoleValidators.hasPermission([roles[1]], 'user.delete'), false);
    });

    test('evaluateRoles with ANY mode', () {
      const userRoles = [DSRolePredefined.user, DSRolePredefined.editor];
      const requiredRoles = [DSRolePredefined.admin, DSRolePredefined.editor];

      final result = DSRoleValidators.evaluateRoles(
        userRoles: userRoles,
        requiredRoles: requiredRoles,
        mode: DSRoleEvaluationMode.any,
      );

      expect(result.hasAccess, true);
      expect(result.matchedRoles.length, 1);
    });

    test('evaluateRoles with ALL mode', () {
      const userRoles = [DSRolePredefined.user];
      const requiredRoles = [DSRolePredefined.admin, DSRolePredefined.editor];

      final result = DSRoleValidators.evaluateRoles(
        userRoles: userRoles,
        requiredRoles: requiredRoles,
        mode: DSRoleEvaluationMode.all,
      );

      expect(result.hasAccess, false);
      expect(result.denialReason, isNotNull);
    });
  });

  group('Extension methods', () {
    test('DSRoleStateExtension works correctly', () {
      expect(DSRoleState.defaultState.displayName, 'Default');
      expect(DSRoleState.loading.displayName, 'Loading');
      expect(DSRoleState.disabled.displayName, 'Disabled');

      expect(DSRoleState.defaultState.isInteractive, true);
      expect(DSRoleState.disabled.isInteractive, false);
      expect(DSRoleState.loading.isInteractive, false);

      expect(DSRoleState.loading.isLoading, true);
      expect(DSRoleState.skeleton.isLoading, true);
      expect(DSRoleState.defaultState.isLoading, false);
    });

    test('DSRoleExtensions works correctly', () {
      final activeRole = DSRole(
        id: 'active',
        type: DSRoleType.user,
        name: 'Active Role',
        isActive: true,
      );

      final expiredRole = DSRole(
        id: 'expired',
        type: DSRoleType.user,
        name: 'Expired Role',
        expiresAt: DateTime.now().subtract(const Duration(days: 1)),
      );

      expect(activeRole.isExpired, false);
      expect(activeRole.isEffectivelyActive, true);

      expect(expiredRole.isExpired, true);
      expect(expiredRole.isEffectivelyActive, false);
    });

    test('DSRoleTypeExtensions works correctly', () {
      expect(DSRoleType.admin.accessLevel, 100);
      expect(DSRoleType.user.accessLevel, 50);
      expect(DSRoleType.guest.accessLevel, 25);

      expect(DSRoleType.admin.color, Colors.red);
      expect(DSRoleType.user.color, Colors.green);
      expect(DSRoleType.guest.color, Colors.grey);
    });
  });

  group('Predefined roles', () {
    test('admin role has correct configuration', () {
      const admin = DSRolePredefined.admin;

      expect(admin.id, 'admin');
      expect(admin.type, DSRoleType.admin);
      expect(admin.permissions, contains('*'));
      expect(admin.priority, DSRolePriority.critical);
    });

    test('all predefined roles are valid', () {
      for (final role in DSRolePredefined.all) {
        expect(DSRoleValidators.isValidRole(role), true);
      }
    });
  });

  group('Configuration defaults', () {
    test('standard config has correct defaults', () {
      const config = DSRoleVisibilityConfigDefaults.standard;

      expect(config.variant, DSRoleVariant.helpers);
      expect(config.roles, isEmpty);
      expect(config.showDebugHelpers, false);
    });

    test('debug config enables debugging', () {
      const config = DSRoleVisibilityConfigDefaults.debug;

      expect(config.showDebugHelpers, true);
      expect(config.behavior?.enableDebugMode, true);
      expect(config.behavior?.enableLogging, true);
    });

    test('production config optimizes for performance', () {
      const config = DSRoleVisibilityConfigDefaults.production;

      expect(config.showDebugHelpers, false);
      expect(config.behavior?.enableDebugMode, false);
      expect(config.behavior?.cacheResults, true);
    });
  });
}