import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentations/widgets/manage_midoplan.dart';
import 'floating_button.dart'; // dark mode
import '../../logic/midoplan/midoplan_cubit.dart';
import '../widgets/midoplan_list_item.dart';
import '../widgets/search_bar.dart';

class MidoPlanScreen extends StatelessWidget {
  const MidoPlanScreen({
    super.key,
    required this.isDarkMode,
    required this.toggleDarkMode,
  });

  final bool isDarkMode;
  final Function() toggleDarkMode;

  void manageshowModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      )),
      builder: (context) => ManageMiDoPlan(),
    );
  }

  void openSearchBar(BuildContext context) {
    showSearch(context: context, delegate: CearchBar());  //Cearchbar its actually SearchBar))
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text('MI DO PLAN'),
        actions: [
          IconButton(
            onPressed: () => openSearchBar(context),
            icon: const Icon(Icons.search),
          ),
          IconButton(
              onPressed: () {
                manageshowModalBottomSheet(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<MidoplanCubit, MidoplanState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.midoplans!.length,
            itemBuilder: (context, index) =>
                MidoPlanListItem(midoplan: state.midoplans![index]),
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
