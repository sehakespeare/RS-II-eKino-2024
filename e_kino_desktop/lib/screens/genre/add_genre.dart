import 'package:e_kino_desktop/providers/auditorium_provider.dart';
import 'package:e_kino_desktop/providers/genre_provider.dart';
import 'package:e_kino_desktop/screens/auditoriums/auditoriums_screen.dart';
import 'package:e_kino_desktop/screens/genre/genre_screen.dart';
import 'package:e_kino_desktop/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../../providers/users_provider.dart';

class AddGenreScreen extends StatefulWidget {
  final int? id;
  final String? name;
  const AddGenreScreen({this.id, this.name, super.key});
  @override
  State<AddGenreScreen> createState() => _AddGenreScreenState();
}

class _AddGenreScreenState extends State<AddGenreScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late Map<String, dynamic> userData;
  late GenreProvider _genreProvider;

  @override
  void initState() {
    super.initState();
    _genreProvider = context.read<GenreProvider>();
    if (widget.id != null) {
      userData = {
        "id": widget.id,
        "name": widget.name,
      };
    } else {
      userData = {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Genre",
          style: TextStyle(fontSize: 18),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Postavite ikonu back gumba
          onPressed: () {
            userData = {};
            _formKey.currentState?.reset();
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 300,
          child: Column(
            children: [
              _buildForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          var isValid =
                              _formKey.currentState?.saveAndValidate() ?? false;
                          if (isValid) {
                            var request =
                                Map.from(_formKey.currentState!.value);
                            if (widget.id != null) {
                              // _updateUserData(field, value);
                              try {
                                await _genreProvider.update(
                                    userData['id'], request);

                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const GenreScreen(),
                                ));

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Uspješno ste editovali žanr",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              } on Exception catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      e.toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            } else {
                              try {
                                await _genreProvider.insert(request);

                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const GenreScreen(),
                                ));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Uspješno ste dodali žanr",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              } on Exception catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      e.toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          }
                        },
                        child: const Text("Sačuvaj")),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _buildForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: _formKey,
        initialValue: userData,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FormBuilderTextField(
              initialValue: userData['name'],
              decoration: const InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.black)),
              name: "name",
              style: const TextStyle(color: Colors.black),
              validator: FormBuilderValidators.required(
                  errorText: "Polje ne smije biti prazno."),
            ),
          ],
        ),
      ),
    );
  }
}
