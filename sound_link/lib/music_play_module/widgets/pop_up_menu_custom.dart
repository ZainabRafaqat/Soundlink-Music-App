import 'package:flutter/material.dart';

class PopUpMenuCustom extends StatelessWidget {
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;
  const PopUpMenuCustom({
    Key? key,
    required this.onPressed1,
    required this.onPressed2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      color: Theme.of(context).backgroundColor,
      icon: Icon(
        Icons.more_horiz_rounded,
        color: Theme.of(context)
            .copyWith(
              primaryColor: Colors.black,
            )
            .primaryColor,
        size: 45,
      ),
      iconSize: 45,
      itemBuilder: (ctx) {
        return [
          PopupMenuItem(
            child: TextButton.icon(
              icon: const Icon(Icons.favorite_border_outlined),
              label: const Text('Add to Favourties'),
              onPressed: onPressed1,
            ),
          ),
          PopupMenuItem(
            child: TextButton.icon(
              icon: const Icon(Icons.comment_bank_rounded),
              label: const Text('Comment'),
              onPressed: onPressed2,
            ),
          ),
        ];
      },
    );
  }
}
