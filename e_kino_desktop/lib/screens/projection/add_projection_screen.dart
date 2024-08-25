import 'dart:convert';
import 'dart:io';

import 'package:e_kino_desktop/models/auditorium.dart';
import 'package:e_kino_desktop/models/genre.dart';
import 'package:e_kino_desktop/models/movies.dart';
import 'package:e_kino_desktop/models/projection.dart';
import 'package:e_kino_desktop/providers/movies_provider.dart';
import 'package:e_kino_desktop/providers/projections_provider.dart';
import 'package:e_kino_desktop/screens/movies/movies_screen.dart';
import 'package:e_kino_desktop/screens/projection/projection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/direktor.dart';
import '../../providers/users_provider.dart';

class AddProjectionScreen extends StatefulWidget {
  final List<Movies> movies;
  final List<Auditorium> auditorium;
  const AddProjectionScreen(
      {required this.movies, required this.auditorium, super.key});
  @override
  State<AddProjectionScreen> createState() => _AddProjectionScreenState();
}

class _AddProjectionScreenState extends State<AddProjectionScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final Map<String, dynamic> _initialValue = {};
  late ProjectionsProvider _projectionsProvider;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _projectionsProvider = context.read<ProjectionsProvider>();
    _controller.addListener(_formatValue);
  }

  @override
  void dispose() {
    _controller.removeListener(_formatValue);
    _controller.dispose();
    super.dispose();
  }

  void _formatValue() {
    String currentValue = _controller.text;
    if (currentValue.isNotEmpty) {
      double? value = double.tryParse(currentValue);
      if (value != null) {
        String formattedValue = value.toStringAsFixed(2);
        if (formattedValue != currentValue) {
          _controller.value = _controller.value.copyWith(
            text: formattedValue,
            selection: TextSelection.collapsed(offset: formattedValue.length),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Filmovi",
        style: TextStyle(fontSize: 18),
      )),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 800,
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

                            // request['photo'] = base64Image;
                            try {
                              Map movieData = {
                                "dateOfProjection": _formKey
                                            .currentState
                                            ?.fields['DateOfProjection']
                                            ?.value !=
                                        null
                                    ? (_formKey.currentState
                                            ?.fields['DateOfProjection']?.value)
                                        .toIso8601String()
                                    : null,
                                "movieId":
                                    (_formKey.currentState?.value['movieId']),
                                "auditoriumId": (_formKey
                                    .currentState?.value['auditoriumId']),
                                "ticketPrice": double.parse(_formKey
                                    .currentState?.value['ticketPrice']),
                              };
                              await _projectionsProvider.insert(movieData);

                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ProjectionScreen(),
                              ));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Uspješno ste dodali projekciju",
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
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
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
        initialValue: _initialValue,
        child: Row(
          children: [
            const SizedBox(
              width: 80,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 80,
                    width: 120,
                    child: FormBuilderDropdown<String>(
                      validator: FormBuilderValidators.required(
                          errorText: "Polje ne smije biti prazno."),
                      name: 'movieId',
                      decoration: const InputDecoration(labelText: "Film"),
                      items: widget.movies
                              .map(
                                (projection) => DropdownMenuItem(
                                  value: projection.movieId.toString(),
                                  child: Text(projection.title ?? ''),
                                ),
                              )
                              .toList() ??
                          [],
                      enabled: true,
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 120,
                    child: FormBuilderDropdown<String>(
                      validator: FormBuilderValidators.required(
                          errorText: "Polje ne smije biti prazno."),
                      name: 'auditoriumId',
                      decoration: const InputDecoration(labelText: "Sala"),
                      items: widget.auditorium
                              .map(
                                (auditorium) => DropdownMenuItem(
                                  value: auditorium.auditoriumId.toString(),
                                  child: Text(auditorium.name ?? ''),
                                ),
                              )
                              .toList() ??
                          [],
                      enabled: true,
                    ),
                  ),
                  Container(
                    width: 200,
                    child: FormBuilderDateTimePicker(
                      name: 'DateOfProjection',
                      decoration:
                          const InputDecoration(labelText: "Datum projekcije"),
                      inputType: InputType.both,
                      format: DateFormat('yyyy-MM-dd HH:mm'),
                      enabled: true,
                    ),
                  ),
                  FormBuilderTextField(
                    keyboardType: TextInputType.number,
                    controller: _controller,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: const InputDecoration(
                        labelText: "Cijena",
                        labelStyle: TextStyle(color: Colors.black)),
                    name: "ticketPrice",
                    style: const TextStyle(color: Colors.black),
                    validator: FormBuilderValidators.required(
                        errorText: "Polje ne smije biti prazno."),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
