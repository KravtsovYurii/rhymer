import 'package:example/ui/ui.dart';
import 'package:flutter/material.dart';

class RhymeHistoryCard extends StatelessWidget {
  const RhymeHistoryCard({
    super.key,
    required this.rhymes,
    required this.word,
  });

  final String word;
  final List<String> rhymes;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseContainer(
      padding: const EdgeInsets.all(16),
      width: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            word,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          Flexible(
            child: Text(
              rhymes.asMap().entries.map((e) {
                final sb = StringBuffer();
                sb.write(e.value);
                if (e.key != rhymes.length - 1) {
                  sb.write(",  ");
                }
                return sb.toString();
              }).join(),
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 13,
                color: theme.hintColor.withOpacity(0.4),
              ),
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
