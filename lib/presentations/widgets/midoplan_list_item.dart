import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_cub/logic/cubits/midoplan/midoplan_cubit.dart';
import '../../data/models/midoplan.dart';
import 'manage_midoplan.dart';

class MidoPlanListItem extends StatelessWidget {
  final MidoPlan midoplan;
  const MidoPlanListItem({Key? key, required this.midoplan}) : super(key: key);

  // void showModalBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     isDismissible: false,
  //     context: context,
  //     isScrollControlled: true,
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(
  //       top: Radius.circular(20),
  //     )),
  //     builder: (context) => ManageMiDoPlan(),
  //   );
  // }

  //void openModalManageMidoplan(BuildContext context) {
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      )),
      builder: ((context) => ManageMiDoPlan(
            midoplan: midoplan,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () =>
            context.read<MidoplanCubit>().midoplanToggle(midoplan.id),
        icon: Icon(midoplan.isDone
            ? Icons.check_circle_rounded
            : Icons.circle_outlined, color: midoplan.isDone ? Colors.green : Colors.grey,),
      ),
      title: Text(
        midoplan.title,
        style: TextStyle(
            decoration: midoplan.isDone
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: midoplan.isDone ? Colors.grey.shade600 : Colors.grey),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => _showModalBottomSheet(context),
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () => context.read<MidoplanCubit>().midoplanREmove(midoplan.id),
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
