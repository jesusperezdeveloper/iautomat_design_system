import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppRoleVisibility', () {
    testWidgets('renders child when user has required role', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppRoleVisibility(
              config: const AppRoleVisibilityConfig(
                roles: [AppRolePredefined.user],
              ),
              userRoles: const [AppRolePredefined.user],
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
            body: AppRoleVisibility(
              config: const AppRoleVisibilityConfig(
                roles: [AppRolePredefined.admin],
              ),
              userRoles: const [AppRolePredefined.user],
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
            body: AppRoleVisibility(
              config: const AppRoleVisibilityConfig(
                roles: [],
              ),
              userRoles: const [AppRolePredefined.user],
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
            body: AppRoleVisibility(
              config: const AppRoleVisibilityConfig(
                roles: [AppRolePredefined.admin, AppRolePredefined.editor],
                evaluationMode: AppRoleEvaluationMode.any,
              ),
              userRoles: const [AppRolePredefined.editor],
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
            body: AppRoleVisibility(
              config: const AppRoleVisibilityConfig(
                roles: [AppRolePredefined.admin, AppRolePredefined.editor],
                evaluationMode: AppRoleEvaluationMode.all,
              ),
              userRoles: const [AppRolePredefined.editor],
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
            body: AppRoleVisibility(
              config: const AppRoleVisibilityConfig(
                roles: [AppRolePredefined.admin],
                behavior: AppRoleVisibilityBehavior(
                  showErrorMessages: true,
                ),
              ),
              userRoles: const [AppRolePredefined.user],
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
            body: AppRoleVisibility(
              config: const AppRoleVisibilityConfig(
                roles: [AppRolePredefined.admin],
                state: AppRoleState.loading,
              ),
              userRoles: const [AppRolePredefined.admin],
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
            body: AppRoleVisibility(
              config: const AppRoleVisibilityConfig(
                roles: [AppRolePredefined.user],
                state: AppRoleState.disabled,
              ),
              userRoles: const [AppRolePredefined.user],
              child: const Text('Disabled Content'),
            ),
          ),
        ),
      );

      expect(find.text('Disabled Content'), findsNothing);
    });

    testWidgets('calls onVisibilityChanged callback', (tester) async {
      AppRoleEvaluationResult? result;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppRoleVisibility(
              config: const AppRoleVisibilityConfig(
                roles: [AppRolePredefined.user],
              ),
              userRoles: const [AppRolePredefined.user],
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
            body: AppRoleVisibility(
              config: const AppRoleVisibilityConfig(
                roles: [AppRolePredefined.admin],
                behavior: AppRoleVisibilityBehavior(
                  preserveSpaceWhenHidden: true,
                ),
              ),
              userRoles: const [AppRolePredefined.user],
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
      final expiredRole = AppRole(
        id: 'expired_user',
        type: AppRoleType.user,
        name: 'Expired User',
        expiresAt: DateTime.now().subtract(const Duration(days: 1)),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppRoleVisibility(
              config: const AppRoleVisibilityConfig(
                roles: [AppRolePredefined.user],
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
      final customRole = AppRole(
        id: 'custom_admin',
        type: AppRoleType.admin,
        name: 'Custom Admin',
        level: 10,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppRoleVisibility(
              config: const AppRoleVisibilityConfig(
                roles: [AppRolePredefined.admin],
                hierarchyConfig: AppRoleHierarchyConfig(
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

  group('AppRoleVisibilityConfig', () {
    test('creates instance with default values', () {
      const config = AppRoleVisibilityConfig();

      expect(config.variant, AppRoleVariant.helpers);
      expect(config.roles, isEmpty);
      expect(config.state, AppRoleState.defaultState);
      expect(config.evaluationMode, AppRoleEvaluationMode.any);
    });

    test('creates instance with custom values', () {
      const config = AppRoleVisibilityConfig(
        variant: AppRoleVariant.helpers,
        roles: [AppRolePredefined.admin],
        state: AppRoleState.loading,
        evaluationMode: AppRoleEvaluationMode.all,
        showDebugHelpers: true,
      );

      expect(config.variant, AppRoleVariant.helpers);
      expect(config.roles.length, 1);
      expect(config.state, AppRoleState.loading);
      expect(config.evaluationMode, AppRoleEvaluationMode.all);
      expect(config.showDebugHelpers, true);
    });
  });

  group('AppRole', () {
    test('creates instance with required values', () {
      const role = AppRole(
        id: 'test_role',
        type: AppRoleType.user,
        name: 'Test Role',
      );

      expect(role.id, 'test_role');
      expect(role.type, AppRoleType.user);
      expect(role.name, 'Test Role');
      expect(role.isActive, true);
      expect(role.enabled, true);
      expect(role.permissions, isEmpty);
    });

    test('supports custom properties', () {
      final now = DateTime.now();
      final role = AppRole(
        id: 'custom_role',
        type: AppRoleType.admin,
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

  group('AppRoleValidators', () {
    test('isValidRole works correctly', () {
      const validRole = AppRole(
        id: 'valid',
        type: AppRoleType.user,
        name: 'Valid Role',
        isActive: true,
      );

      const invalidRole = AppRole(
        id: '',
        type: AppRoleType.user,
        name: 'Invalid Role',
        isActive: false,
      );

      expect(AppRoleValidators.isValidRole(validRole), true);
      expect(AppRoleValidators.isValidRole(invalidRole), false);
    });

    test('hasPermission works correctly', () {
      const roles = [
        AppRole(
          id: 'admin',
          type: AppRoleType.admin,
          name: 'Admin',
          permissions: ['*'],
        ),
        AppRole(
          id: 'editor',
          type: AppRoleType.editor,
          name: 'Editor',
          permissions: ['content.edit', 'content.view'],
        ),
      ];

      expect(AppRoleValidators.hasPermission(roles, 'anything'), true); // Admin wildcard
      expect(AppRoleValidators.hasPermission(roles, 'content.edit'), true);
      expect(AppRoleValidators.hasPermission(roles, 'user.delete'), true); // Admin wildcard
      expect(AppRoleValidators.hasPermission([roles[1]], 'user.delete'), false);
    });

    test('evaluateRoles with ANY mode', () {
      const userRoles = [AppRolePredefined.user, AppRolePredefined.editor];
      const requiredRoles = [AppRolePredefined.admin, AppRolePredefined.editor];

      final result = AppRoleValidators.evaluateRoles(
        userRoles: userRoles,
        requiredRoles: requiredRoles,
        mode: AppRoleEvaluationMode.any,
      );

      expect(result.hasAccess, true);
      expect(result.matchedRoles.length, 1);
    });

    test('evaluateRoles with ALL mode', () {
      const userRoles = [AppRolePredefined.user];
      const requiredRoles = [AppRolePredefined.admin, AppRolePredefined.editor];

      final result = AppRoleValidators.evaluateRoles(
        userRoles: userRoles,
        requiredRoles: requiredRoles,
        mode: AppRoleEvaluationMode.all,
      );

      expect(result.hasAccess, false);
      expect(result.denialReason, isNotNull);
    });
  });

  group('Extension methods', () {
    test('AppRoleStateExtension works correctly', () {
      expect(AppRoleState.defaultState.displayName, 'Default');
      expect(AppRoleState.loading.displayName, 'Loading');
      expect(AppRoleState.disabled.displayName, 'Disabled');

      expect(AppRoleState.defaultState.isInteractive, true);
      expect(AppRoleState.disabled.isInteractive, false);
      expect(AppRoleState.loading.isInteractive, false);

      expect(AppRoleState.loading.isLoading, true);
      expect(AppRoleState.skeleton.isLoading, true);
      expect(AppRoleState.defaultState.isLoading, false);
    });

    test('AppRoleExtensions works correctly', () {
      final activeRole = AppRole(
        id: 'active',
        type: AppRoleType.user,
        name: 'Active Role',
        isActive: true,
      );

      final expiredRole = AppRole(
        id: 'expired',
        type: AppRoleType.user,
        name: 'Expired Role',
        expiresAt: DateTime.now().subtract(const Duration(days: 1)),
      );

      expect(activeRole.isExpired, false);
      expect(activeRole.isEffectivelyActive, true);

      expect(expiredRole.isExpired, true);
      expect(expiredRole.isEffectivelyActive, false);
    });

    test('AppRoleTypeExtensions works correctly', () {
      expect(AppRoleType.admin.accessLevel, 100);
      expect(AppRoleType.user.accessLevel, 50);
      expect(AppRoleType.guest.accessLevel, 25);

      expect(AppRoleType.admin.color, Colors.red);
      expect(AppRoleType.user.color, Colors.green);
      expect(AppRoleType.guest.color, Colors.grey);
    });
  });

  group('Predefined roles', () {
    test('admin role has correct configuration', () {
      const admin = AppRolePredefined.admin;

      expect(admin.id, 'admin');
      expect(admin.type, AppRoleType.admin);
      expect(admin.permissions, contains('*'));
      expect(admin.priority, AppRolePriority.critical);
    });

    test('all predefined roles are valid', () {
      for (final role in AppRolePredefined.all) {
        expect(AppRoleValidators.isValidRole(role), true);
      }
    });
  });

  group('Configuration defaults', () {
    test('standard config has correct defaults', () {
      const config = AppRoleVisibilityConfigDefaults.standard;

      expect(config.variant, AppRoleVariant.helpers);
      expect(config.roles, isEmpty);
      expect(config.showDebugHelpers, false);
    });

    test('debug config enables debugging', () {
      const config = AppRoleVisibilityConfigDefaults.debug;

      expect(config.showDebugHelpers, true);
      expect(config.behavior?.enableDebugMode, true);
      expect(config.behavior?.enableLogging, true);
    });

    test('production config optimizes for performance', () {
      const config = AppRoleVisibilityConfigDefaults.production;

      expect(config.showDebugHelpers, false);
      expect(config.behavior?.enableDebugMode, false);
      expect(config.behavior?.cacheResults, true);
    });
  });
}