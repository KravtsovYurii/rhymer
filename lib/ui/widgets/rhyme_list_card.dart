import 'package:example/ui/ui.dart';
import 'package:flutter/material.dart';

class RhymeListCard extends StatelessWidget {
  const RhymeListCard({
    super.key,
    this.isFavorite = false,
    required this.rhyme,
    this.sourceWord,
  });

  final String rhyme;
  final String? sourceWord;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseContainer(
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (sourceWord != null) ...[
                Text(
                  sourceWord!,
                  style: theme.textTheme.bodyLarge,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: theme.hintColor.withOpacity(0.4),
                  ),
                ),
              ],
              SizedBox(
                width: 200,
                child: Text(
                  rhyme,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: isFavorite
                  ? theme.primaryColor
                  : theme.hintColor.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}
