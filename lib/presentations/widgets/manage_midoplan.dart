import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_cub/logic/cubit/midoplan_cubit.dart';

class ManageMiDoPlan extends StatelessWidget {
  ManageMiDoPlan({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  String _title = '';

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      BlocProvider.of<MidoplanCubit>(context).addMiDoPlan(_title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      maxChildSize: 0.9,
      minChildSize: 0.32,
      expand: false,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -15,
                child: Container(
                  width: 60,
                  height: 7,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                ),
              ),
              BlocListener<MidoplanCubit, MidoplanState>(
                listener: (context, state) {
                  if (state is MiDoPlanAdded) {
                    Navigator.of(context).pop();
                  } else if (state is MiDoPlanError) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        content: Text(state.message),
                        title: Text('Error'),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "title",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please, enter your task';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _title = value!;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () => _submit(context),
                          child: const Text("Add note"),
                          style: ElevatedButton.styleFrom(
                              elevation: 5,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: Size(double.infinity, 50)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("CANCEL"),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            minimumSize: Size(double.infinity, 50),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
