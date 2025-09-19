import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

/// DSTopAppBar con navegación de vuelta funcional para go_router
class DSAppBarWithBack extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final String? backRoute;

  const DSAppBarWithBack({
    super.key,
    required this.title,
    this.actions,
    this.backRoute,
  });

  @override
  Widget build(BuildContext context) {
    return DSTopAppBar(
      title: title,
      actions: actions,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          if (backRoute != null) {
            context.go(backRoute!);
          } else {
            // Try regular navigator first
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              // Fallback to home
              context.go('/');
            }
          }
        },
        tooltip: 'Volver',
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}