import 'package:flutter/material.dart';

import 'ds_role_visibility_config.dart';
import 'ds_role_visibility_platform_adapter.dart';
import 'ds_role_visibility_a11y_helper.dart';

class DSRoleVisibility extends StatefulWidget {
  final DSRoleVisibilityConfig config;
  final Widget child;
  final List<DSRole> userRoles;
  final DSRoleContext? roleContext;
  final DSRoleVisibilityCallback? onVisibilityChanged;
  final DSRoleValidationCallback? onValidationFailed;
  final DSRoleVisibilityErrorBuilder? errorBuilder;
  final DSRoleVisibilityLoadingBuilder? loadingBuilder;
  final bool enabled;
  final DSRoleVisibilityColors? colors;
  final DSRoleVisibilityAnimations? animations;

  const DSRoleVisibility({
    super.key,
    required this.config,
    required this.child,
    this.userRoles = const [],
    this.roleContext,
    this.onVisibilityChanged,
    this.onValidationFailed,
    this.errorBuilder,
    this.loadingBuilder,
    this.enabled = true,
    this.colors,
    this.animations,
  });

  @override
  State<DSRoleVisibility> createState() => _DSRoleVisibilityState();
}

class _DSRoleVisibilityState extends State<DSRoleVisibility>
    with TickerProviderStateMixin {
  late DSRoleVisibilityPlatformAdapter _platformAdapter;
  late DSRoleVisibilityA11yHelper _a11yHelper;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  bool _isVisible = false;
  bool _isEvaluating = false;
  DSRoleValidationError? _validationError;

  @override
  void initState() {
    super.initState();
    _initializePlatformAdapter();
    _initializeA11y();
    _initializeAnimations();
    _evaluateVisibility();
  }

  @override
  void didUpdateWidget(DSRoleVisibility oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.config != widget.config ||
        oldWidget.userRoles != widget.userRoles ||
        oldWidget.roleContext != widget.roleContext) {
      _evaluateVisibility();
    }

    if (oldWidget.enabled != widget.enabled) {
      _updateEnabledState();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initializePlatformAdapter() {
    _platformAdapter = DSRoleVisibilityPlatformAdapter();
  }

  void _initializeA11y() {
    _a11yHelper = DSRoleVisibilityA11yHelper(
      config: widget.config,
      onAnnouncementRequested: _announceToScreenReader,
    );
  }

  void _initializeAnimations() {
    final animationConfig = widget.animations ?? widget.config.animations;

    final duration = animationConfig?.duration ?? const Duration(milliseconds: 300);
    final curve = animationConfig?.curve ?? Curves.easeInOut;

    _animationController = AnimationController(
      duration: duration,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: curve,
    ));
  }

  Future<void> _evaluateVisibility() async {
    if (!mounted) return;

    setState(() {
      _isEvaluating = true;
      _validationError = null;
    });

    try {
      final evaluator = DSRoleEvaluator(
        config: widget.config,
        userRoles: widget.userRoles,
        context: widget.roleContext,
      );

      final result = await evaluator.evaluate();

      if (!mounted) return;

      setState(() {
        _isVisible = result.isVisible ?? result.hasAccess;
        _validationError = result.error;
        _isEvaluating = false;
      });

      _updateVisibilityAnimation();
      _handleVisibilityChange(result);

    } catch (error) {
      if (!mounted) return;

      setState(() {
        _isVisible = false;
        _validationError = DSRoleValidationError(
          type: DSRoleErrorType.evaluationError,
          message: 'Error evaluating role visibility: $error',
        );
        _isEvaluating = false;
      });
    }
  }

  void _updateVisibilityAnimation() {
    if (_isVisible) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  void _handleVisibilityChange(DSRoleEvaluationResult result) {
    widget.onVisibilityChanged?.call(result);

    final hasAccess = result.isVisible ?? result.hasAccess;
    if (!hasAccess && result.error != null) {
      widget.onValidationFailed?.call(result.error!);
    }

    _a11yHelper.announceVisibilityChange(result);
  }

  void _updateEnabledState() {
    if (!widget.enabled) {
      setState(() {
        _isVisible = false;
      });
      _animationController.reverse();
    } else {
      _evaluateVisibility();
    }
  }

  void _announceToScreenReader(String message) {
    if (_platformAdapter.supportsScreenReaderAnnouncements) {
      _platformAdapter.announceToScreenReader(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled || widget.config.state == DSRoleState.disabled) {
      return const SizedBox.shrink();
    }

    return _buildVisibilityContainer();
  }

  Widget _buildVisibilityContainer() {
    if (_isEvaluating && widget.config.state == DSRoleState.loading) {
      return _buildLoadingState();
    }

    if (_validationError != null && !_isVisible) {
      return _buildErrorState();
    }

    return _buildAnimatedVisibility();
  }

  Widget _buildLoadingState() {
    if (widget.loadingBuilder != null) {
      return widget.loadingBuilder!(context, widget.config);
    }

    final colors = widget.colors ?? widget.config.colors;
    final behavior = widget.config.behavior;

    return AnimatedContainer(
      duration: widget.config.animations?.duration ?? const Duration(milliseconds: 300),
      height: behavior?.preserveSpaceWhenHidden == true ? null : 0,
      child: Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              colors?.loadingColor ?? Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState() {
    if (widget.errorBuilder != null && _validationError != null) {
      return widget.errorBuilder!(context, _validationError!, widget.config);
    }

    if (widget.config.behavior?.showErrorMessages != true) {
      return const SizedBox.shrink();
    }

    final colors = widget.colors ?? widget.config.colors;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colors?.errorBackgroundColor ?? Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: colors?.errorBorderColor ?? Theme.of(context).colorScheme.error,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            size: 16,
            color: colors?.errorIconColor ?? Theme.of(context).colorScheme.error,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              _validationError?.message ?? 'Access denied',
              style: TextStyle(
                color: colors?.errorTextColor ?? Theme.of(context).colorScheme.onErrorContainer,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedVisibility() {
    final behavior = widget.config.behavior;

    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        final opacity = _fadeAnimation.value;

        if (!_isVisible && behavior?.preserveSpaceWhenHidden != true) {
          return const SizedBox.shrink();
        }

        return Opacity(
          opacity: _isVisible ? opacity : 0.0,
          child: IgnorePointer(
            ignoring: !_isVisible,
            child: Semantics(
              hidden: !_isVisible,
              child: widget.child,
            ),
          ),
        );
      },
    );
  }
}

class DSRoleEvaluator {
  final DSRoleVisibilityConfig config;
  final List<DSRole> userRoles;
  final DSRoleContext? context;

  const DSRoleEvaluator({
    required this.config,
    required this.userRoles,
    this.context,
  });

  Future<DSRoleEvaluationResult> evaluate() async {
    try {
      final requiredRoles = config.roles;

      if (requiredRoles.isEmpty) {
        return const DSRoleEvaluationResult(
          hasAccess: true,
          matchedRoles: [],
        );
      }

      final matchedRoles = <DSRole>[];
      bool hasAccess = false;

      switch (config.evaluationMode) {
        case DSRoleEvaluationMode.all:
          hasAccess = _evaluateRequireAll(requiredRoles, matchedRoles);
          break;
        case DSRoleEvaluationMode.any:
          hasAccess = _evaluateRequireAny(requiredRoles, matchedRoles);
          break;
        case DSRoleEvaluationMode.groups:
          hasAccess = _evaluateRequireNone(requiredRoles, matchedRoles);
          break;
        case DSRoleEvaluationMode.custom:
          hasAccess = await _evaluateCustom(requiredRoles, matchedRoles);
          break;
      }

      if (config.permissions.isNotEmpty) {
        hasAccess = hasAccess && _evaluatePermissions();
      }

      if (config.hierarchyConfig != null) {
        hasAccess = hasAccess && _evaluateHierarchy();
      }

      return DSRoleEvaluationResult(
        hasAccess: hasAccess,
        isVisible: hasAccess,
        matchedRoles: matchedRoles,
        error: hasAccess ? null : _createAccessDeniedError(),
      );

    } catch (error) {
      return DSRoleEvaluationResult(
        hasAccess: false,
        isVisible: false,
        matchedRoles: [],
        error: DSRoleValidationError(
          type: DSRoleErrorType.evaluationError,
          message: 'Evaluation failed: $error',
        ),
      );
    }
  }

  bool _evaluateRequireAll(List<DSRole> requiredRoles, List<DSRole> matchedRoles) {
    for (final requiredRole in requiredRoles) {
      bool found = false;
      for (final userRole in userRoles) {
        if (_rolesMatch(userRole, requiredRole)) {
          matchedRoles.add(userRole);
          found = true;
          break;
        }
      }
      if (!found) return false;
    }
    return true;
  }

  bool _evaluateRequireAny(List<DSRole> requiredRoles, List<DSRole> matchedRoles) {
    for (final requiredRole in requiredRoles) {
      for (final userRole in userRoles) {
        if (_rolesMatch(userRole, requiredRole)) {
          matchedRoles.add(userRole);
          return true;
        }
      }
    }
    return false;
  }

  bool _evaluateRequireNone(List<DSRole> requiredRoles, List<DSRole> matchedRoles) {
    for (final requiredRole in requiredRoles) {
      for (final userRole in userRoles) {
        if (_rolesMatch(userRole, requiredRole)) {
          return false;
        }
      }
    }
    return true;
  }

  Future<bool> _evaluateCustom(List<DSRole> requiredRoles, List<DSRole> matchedRoles) async {
    final customEvaluator = config.customEvaluator;
    if (customEvaluator == null) {
      return _evaluateRequireAny(requiredRoles, matchedRoles);
    }

    return await customEvaluator(userRoles, requiredRoles, context);
  }

  bool _rolesMatch(DSRole userRole, DSRole requiredRole) {
    if (userRole.name != requiredRole.name) return false;
    if (userRole.type != requiredRole.type) return false;

    if (requiredRole.level != null && userRole.level != null) {
      return userRole.level! >= requiredRole.level!;
    }

    return true;
  }

  bool _evaluatePermissions() {
    for (final permission in config.permissions) {
      bool hasPermission = false;

      for (final userRole in userRoles) {
        if (userRole.permissions.contains(permission)) {
          hasPermission = true;
          break;
        }
      }

      if (!hasPermission) return false;
    }

    return true;
  }

  bool _evaluateHierarchy() {
    final hierarchyConfig = config.hierarchyConfig;
    if (hierarchyConfig == null) return true;

    final userMaxLevel = userRoles.map((r) => r.level ?? 0).fold(0, (a, b) => a > b ? a : b);

    return userMaxLevel >= hierarchyConfig.minimumLevel;
  }

  DSRoleValidationError _createAccessDeniedError() {
    return DSRoleValidationError(
      type: DSRoleErrorType.accessDenied,
      message: config.accessDeniedMessage ?? 'Access denied: insufficient permissions',
      requiredRoles: config.roles,
      userRoles: userRoles,
    );
  }
}