// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

class CustomFavoriteItem extends StatelessWidget {
  const CustomFavoriteItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
              fit: BoxFit.cover,
              height: 90,
              width: 90,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'dfdfgdfg',
                  style: textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'dfdfgdfg',
                  style: textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
