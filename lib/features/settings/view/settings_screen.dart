import 'package:auto_route/auto_route.dart';
import 'package:example/features/settings/widgets/widgets.dart';
import 'package:example/ui/ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            snap: true,
            floating: true,
            title: Center(
              child: Text("Налаштування"),
            ),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: "Темна тема",
              value: false,
              onChanged: (value) {},
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: "Повідомлення",
              value: true,
              onChanged: (value) {},
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: "Дозволити аналітику",
              value: true,
              onChanged: (value) {},
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: SettingsActionCard(
              title: "Очистити історію",
              iconData: Icons.delete_sweep_outlined,
              iconColor: Theme.of(context).primaryColor,
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsActionCard(
              title: "Підтримка",
              iconData: Icons.message_outlined,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsActionCard extends StatelessWidget {
  const SettingsActionCard({
    super.key,
    required this.title,
    this.onTap,
    required this.iconData,
    this.iconColor,
  });

  final String title;
  final VoidCallback? onTap;
  final IconData iconData;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
        child: BaseContainer(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: Icon(
                  iconData,
                  color: iconColor ?? theme.hintColor.withOpacity(0.3),
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
