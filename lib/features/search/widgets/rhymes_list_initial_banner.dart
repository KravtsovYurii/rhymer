import 'package:flutter/material.dart';

class RhymesListInitialBanner extends StatelessWidget {
  const RhymesListInitialBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Почни пошук",
            style: theme.textTheme.headlineLarge,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Text(
              "Введіть слово в строку пошука, \nщоб знайти рифми",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
