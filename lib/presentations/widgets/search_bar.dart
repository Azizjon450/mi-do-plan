import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubits/midoplan/midoplan_cubit.dart';

class CearchBar extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () {
          query = '';
        },
        child: Text("Clear"),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, num);
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final midoplans = context.read<MidoplanCubit>().searchMidoPlans(query);
    return midoplans.isEmpty
        ? Center(
            child: Text('Can\'t find notes!'),
          )
        : ListView.builder(
            itemCount: midoplans.length,
            itemBuilder: (ctx, index) => ListTile(
              onTap: () {
                Navigator.of(context).pushNamed('/midoplan-details',
                    arguments: midoplans[index]);
              },
              title: Text(
                midoplans[index].title,
              ),
            ),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      final midoplans = context.read<MidoplanCubit>().searchMidoPlans(query);
      return midoplans.isEmpty
          ? Center(
              child: Text('Can\'t find notes!'),
            )
          : ListView.builder(
              itemCount: midoplans.length,
              itemBuilder: (ctx, index) => ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('/midoplan-details',
                      arguments: midoplans[index]);
                },
                title: Text(
                  midoplans[index].title,
                ),
              ),
            );
    }
    return Container();
  }
}
