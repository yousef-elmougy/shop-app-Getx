// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import '../widgets/custom_favorite_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 15, left: 15),
      child: ListView.builder(
        itemBuilder: (context, index) => CustomFavoriteItem(),
        itemCount: 10,
      ),
    );
  }
}

