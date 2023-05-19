import 'package:flutter/material.dart';
import 'package:to_do_cub/data/models/midoplan.dart';

class MidoPlanListItem extends StatelessWidget {
  final MidoPlan midoplan;
  const MidoPlanListItem({super.key, required this.midoplan});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(midoplan.isDone
            ? Icons.check_circle_rounded
            : Icons.circle_outlined),
      ),
      title: Text(midoplan.title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
