import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentations/screens/animated_fab.dart'; // dark mode
import '../screens/sign_in_options_screen.dart'; // keyin uchirilsin

import '../../logic/cubit/midoplan_cubit.dart';
import '../widgets/midoplan_list_item.dart';

class MiDoPlan extends StatelessWidget {
  const MiDoPlan({
    super.key,
    required this.isDarkMode,
    required this.toggleDarkMode,
  });

  final bool isDarkMode;
  final Function() toggleDarkMode;

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      )),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.4,
          maxChildSize: 0.9,
          minChildSize: 0.32,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: const SignInOptionsScreen(),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text('MI DO PLAN'),
        actions: [IconButton(onPressed: () {
          _showModalBottomSheet(context);
        }, icon: Icon(Icons.add))],
      ),
      body: BlocBuilder<MidoplanCubit, MidoplanState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.midoplans.length,
            itemBuilder: (context, index) =>
                MidoPlanListItem(midoplan: state.midoplans[index]),
          );
        },
      ),
      floatingActionButton: AnimatedFAB(
        onPressed: toggleDarkMode,
        foregroundColor: isDarkMode ? Colors.black : Colors.white,
        backgroundColor: isDarkMode ? Colors.white : Colors.black,
        child: isDarkMode
            ? const Icon(Icons.light_mode)
            : const Icon(Icons.dark_mode),
      ),
    );
  }
}
