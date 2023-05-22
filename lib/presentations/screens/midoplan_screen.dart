import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_cub/logic/blocs/active_midoplan/active_midoplans_bloc.dart';
import 'package:to_do_cub/logic/blocs/completed/completed_midoplans_bloc.dart';
import 'package:to_do_cub/logic/blocs/midoplan/midoplan_bloc.dart';

import '../../presentations/widgets/manage_midoplan.dart';
import 'floating_button.dart'; // dark mode
import '../widgets/midoplan_list_item.dart';
import '../widgets/search_bar.dart';
import '../../data/constants/tab_title_constants.dart';

class MidoPlanScreen extends StatefulWidget {
  const MidoPlanScreen({
    super.key,
    required this.isDarkMode,
    required this.toggleDarkMode,
  });

  final bool isDarkMode;
  final Function() toggleDarkMode;

  @override
  State<MidoPlanScreen> createState() => _MidoPlanScreenState();
}

class _MidoPlanScreenState extends State<MidoPlanScreen> {
  var _init = false;

  @override
  void didChangeDependencies() {
    if (!_init) {
      context.read<MidoplanBloc>().add(LoadMidoplanEvent());
      // context.read<MidoplanCubit>().getMidoplans();
      context.read<ActiveMidoplansBloc>().add(LoadActiveMidoplansEvent());
      context.read<CompletedMidoplansBloc>().add(LoadCompletedMidoplansEvent());
    }
    _init = true;
    super.didChangeDependencies();
  }

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
    showSearch(
        context: context,
        delegate: CearchBar()); //Cearchbar its actually SearchBar))
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TabTitlesConstants.tabs.length,
      child: Scaffold(
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
          bottom: TabBar(
              tabs: TabTitlesConstants.tabs
                  .map((tab) => Tab(
                        text: tab,
                      ))
                  .toList()),
        ),
        body: BlocListener<MidoplanBloc, MidoplanState>(
          listener: (context, state) {
            context.read<ActiveMidoplansBloc>().add(LoadActiveMidoplansEvent());
            context.read<CompletedMidoplansBloc>().add(LoadCompletedMidoplansEvent());
          },
          child: TabBarView(
            children: [
              BlocBuilder<MidoplanBloc, MidoplanState>(
                builder: (context, state) {
                  if (state is MidoplanLoaded) {
                    return state.midoplans.isEmpty
                        ? const Center(
                            child: Text("No have tasks yet"),
                          )
                        : ListView.builder(
                            itemCount: state.midoplans.length,
                            itemBuilder: (context, index) => MidoPlanListItem(
                              midoplan: state.midoplans[index],
                            ),
                          );
                  }
                  return const Center(
                    child: Text("No have tasks yet"),
                  );
                },
              ),
              BlocBuilder<ActiveMidoplansBloc, ActiveMidoplansState>(
                builder: (context, state) {
                  if (state is ActiveMidoplansLoaded) {
                    return state.midoplans.isEmpty
                        ? const Center(
                            child: Text("No have tasks yet"),
                          )
                        : ListView.builder(
                            itemCount: state.midoplans.length,
                            itemBuilder: (context, index) => MidoPlanListItem(
                              midoplan: state.midoplans[index],
                            ),
                          );
                  }
                  return const Center(
                    child: Text("No have tasks yet"),
                  );
                },
              ),
              BlocBuilder<CompletedMidoplansBloc, CompletedMidoplansState>(
                builder: (context, state) {
                  if (state is CompletedMidoplansLoaded) {
                    return state.midoplans.isEmpty
                        ? const Center(
                            child: Text("No have tasks yet"),
                          )
                        : ListView.builder(
                            itemCount: state.midoplans.length,
                            itemBuilder: (context, index) => MidoPlanListItem(
                              midoplan: state.midoplans[index],
                            ),
                          );
                  }
                  return const Center(
                    child: Text("No have tasks yet"),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: AnimatedFAB(
          onPressed: widget.toggleDarkMode,
          foregroundColor: widget.isDarkMode ? Colors.black : Colors.white,
          backgroundColor: widget.isDarkMode ? Colors.white : Colors.black,
          child: widget.isDarkMode
              ? const Icon(Icons.light_mode)
              : const Icon(Icons.dark_mode),
        ),
      ),
    );
  }
}
