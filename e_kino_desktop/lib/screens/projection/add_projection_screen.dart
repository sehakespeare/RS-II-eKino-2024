import 'package:e_kino_desktop/models/auditorium.dart';
import 'package:e_kino_desktop/models/movies.dart';
import 'package:e_kino_desktop/providers/projections_provider.dart';
import 'package:e_kino_desktop/screens/projection/projection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../utils/util.dart';

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
  Map<String, dynamic> userData = {};
  late ProjectionsProvider _projectionsProvider;
  late TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _projectionsProvider = context.read<ProjectionsProvider>();
    _controller.addListener(_formatValue);
    if (ProjectionData.id != null) {
      _controller =
          TextEditingController(text: ProjectionData.price.toString());

      userData = {
        "id": ProjectionData.id,
        "dateOfProjection": ProjectionData.dateOfProjection,
        "movieId": ProjectionData.movieId,
        "ticketPrice": ProjectionData.price,
        "auditoriumId": ProjectionData.auditoriumId
      };
    } else {
      userData = {};
    }
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
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ProjectionData.id = null;
            userData = {};
            _formKey.currentState?.reset();
            Navigator.pop(context);
          },
        ),
      ),
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
                            if (ProjectionData.id != null) {
                              // _updateUserData(field, value);
                              try {
                                Map movieData = {
                                  'projectionId': userData['id'],
                                  "dateOfProjection": _formKey
                                              .currentState
                                              ?.fields['dateOfProjection']
                                              ?.value !=
                                          null
                                      ? (_formKey
                                              .currentState
                                              ?.fields['dateOfProjection']
                                              ?.value)
                                          .toIso8601String()
                                      : userData['dateOfProjection']
                                          .toIso8601String(),
                                  "movieId":
                                      (_formKey.currentState?.value['movieId']),
                                  "auditoriumId": (_formKey
                                      .currentState?.value['auditoriumId']),
                                  "ticketPrice": double.parse(_formKey
                                      .currentState?.value['ticketPrice']),
                                };
                                await _projectionsProvider.update(
                                    userData['id'], movieData);
                                ProjectionData.id = null;
                                userData = {};

                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const ProjectionScreen(),
                                ));

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Uspješno ste editovali projekciju",
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
                                Map movieData = {
                                  "dateOfProjection": _formKey
                                              .currentState
                                              ?.fields['dateOfProjection']
                                              ?.value !=
                                          null
                                      ? (_formKey
                                              .currentState
                                              ?.fields['dateOfProjection']
                                              ?.value)
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
                                  builder: (context) =>
                                      const ProjectionScreen(),
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
        child: Row(
          children: [
            const SizedBox(
              width: 80,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 80,
                    width: 120,
                    child: FormBuilderDropdown<String>(
                      validator: FormBuilderValidators.required(
                          errorText: "Polje ne smije biti prazno."),
                      name: 'movieId',
                      initialValue: userData['movieId'].toString(),
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
                  SizedBox(
                    height: 80,
                    width: 120,
                    child: FormBuilderDropdown<String>(
                      validator: FormBuilderValidators.required(
                          errorText: "Polje ne smije biti prazno."),
                      name: 'auditoriumId',
                      initialValue: userData['auditoriumId'].toString(),
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
                  SizedBox(
                    width: 200,
                    child: FormBuilderDateTimePicker(
                      name: 'dateOfProjection',
                      initialValue: (userData['dateOfProjection']),
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
