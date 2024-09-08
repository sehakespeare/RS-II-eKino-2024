import 'dart:convert';
import 'dart:io';

import 'package:e_kino_desktop/models/genre.dart';
import 'package:e_kino_desktop/providers/movies_provider.dart';
import 'package:e_kino_desktop/screens/movies/movies_screen.dart';
import 'package:e_kino_desktop/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../models/direktor.dart';

class AddMovieScreen extends StatefulWidget {
  final List<Direktor> data;
  final List<Genre> genre;
  const AddMovieScreen({required this.data, required this.genre, super.key});
  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late Map<String, dynamic> userData = {};
  late MoviesProvider _moviesProvider;

  @override
  void initState() {
    super.initState();
    _moviesProvider = context.read<MoviesProvider>();
    if (MovieData.id != null) {
      userData = {
        "id": MovieData.id,
        "title": MovieData.title,
        "description": MovieData.description,
        "photo": base64Decode(MovieData.photo!),
        "movieGenreIdList": MovieData.movieGenreIdList,
        "directorId": MovieData.directorId,
        "runningTime": MovieData.runningTime,
        'year': MovieData.year
      };
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  var _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  int selectedYear = 2024;
  List<int> years = List.generate(1000, (index) => 1900 + index);

  int selectedRunningTime = 120;
  List<int> time = List.generate(60, (index) => 10 + (index * 10));

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
            MovieData.id = null;
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
                            if (MovieData.id != null) {
                              var request =
                                  Map.from(_formKey.currentState!.value);
                              if (_image != null) {
                                var imagePath = _image?.path;

                                List<int> imageBytes =
                                    await File(imagePath!).readAsBytes();

                                String base64Image = base64Encode(imageBytes);
                                request['photo'] = base64Image;
                              } else {
                                request['photo'] = MovieData.photo;
                              }

                              Map movieData = {
                                "title": _formKey.currentState?.value['title'],
                                "description":
                                    _formKey.currentState?.value['description'],
                                "photo": request['photo'],
                                "runningTime": int.tryParse(_formKey
                                    .currentState?.value['runningTime']),
                                "year": int.tryParse(
                                    _formKey.currentState?.value['year']),
                                "directorId":
                                    _formKey.currentState?.value['directorId'],
                                "movieGenreIdList": _formKey
                                    .currentState?.value['movieGenreIdList'],
                              };
                              try {
                                await _moviesProvider.update(
                                    userData['id'], movieData);

                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const MoviesScreen(),
                                ));
                                MovieData.id = null;
                                MovieData.title = null;
                                MovieData.description = null;
                                MovieData.photo = null;
                                MovieData.year = null;
                                MovieData.directorFullName = null;

                                MovieData.directorId = null;
                                MovieData.runningTime = null;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Uspješno ste editovali film",
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
                              movieData = {};
                            } else {
                              var request =
                                  Map.from(_formKey.currentState!.value);
                              var imagePath = _image?.path;List<int> imageBytes =
                                  await File(imagePath!).readAsBytes();

                              String base64Image = base64Encode(imageBytes);
                              request['photo'] = base64Image;
                              try {
                                Map movieData = {
                                  "title":
                                      _formKey.currentState?.value['title'],
                                  "description": _formKey
                                      .currentState?.value['description'],
                                  "photo": request['photo'],
                                  "runningTime": int.tryParse(_formKey
                                      .currentState?.value['runningTime']),
                                  "year": int.tryParse(
                                      _formKey.currentState?.value['year']),
                                  "directorId": _formKey
                                      .currentState?.value['directorId'],
                                  "movieGenreIdList": _formKey
                                      .currentState?.value['movieGenreIdList'],
                                };
                                await _moviesProvider.insert(movieData);

                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const MoviesScreen(),
                                ));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Uspješno ste dodali film",
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
    List<FormBuilderFieldOption> fetchedOptions = widget.genre.map((item) {
      return FormBuilderFieldOption(
          value: item.genreId, child: Text(item.name!));
    }).toList();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: _formKey,
        initialValue: userData,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: userData['photo'] != null &&
                              userData['photo'].isNotEmpty &&
                              _image == null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.memory(userData['photo'],
                                  fit: BoxFit.cover),
                            )
                          : _image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(_image!, fit: BoxFit.cover),
                                )
                              : const Center(
                                  child: Text('No image selected'),
                                )),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: getImage,
                    child: const Text('Pick Image'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FormBuilderTextField(
                    decoration: const InputDecoration(
                        labelText: "Naslov",
                        labelStyle: TextStyle(color: Colors.black)),
                    name: "title",
                    style: const TextStyle(color: Colors.black),
                    validator: FormBuilderValidators.required(
                        errorText: "Polje ne smije biti prazno."),
                  ),
                  FormBuilderTextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 4,
                    maxLines: 10,
                    decoration: const InputDecoration(
                        labelText: "Opis",
                        labelStyle: TextStyle(color: Colors.black)),
                    name: "description",
                    style: const TextStyle(color: Colors.black),
                    validator: FormBuilderValidators.required(
                        errorText: "Polje ne smije biti prazno."),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: FormBuilderDropdown<String>(
                        initialValue: userData.isNotEmpty
                            ? userData['year'].toString()
                            : null,
                        name: 'year',
                        validator: FormBuilderValidators.required(
                            errorText: "Polje ne smije biti prazno."),
                        decoration: const InputDecoration(labelText: "Godina"),
                        items: years
                                .map(
                                  (year) => DropdownMenuItem(
                                    value: year.toString(),
                                    child: Text(year.toString()),
                                  ),
                                )
                                .toList() ??
                            [],
                        enabled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: FormBuilderDropdown<String>(
                        initialValue: userData.isNotEmpty
                            ? userData['runningTime']
                            : null,
                        name: 'runningTime',
                        validator: FormBuilderValidators.required(
                            errorText: "Polje ne smije biti prazno."),
                        decoration:
                            const InputDecoration(labelText: "Trajanje"),
                        items: time
                                .map(
                                  (year) => DropdownMenuItem(
                                    value: year.toString(),
                                    child: Text(year.toString()),
                                  ),
                                )
                                .toList() ??
                            [],
                        enabled: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 120,
                    child: FormBuilderDropdown<String>(
                      validator: FormBuilderValidators.required(
                          errorText: "Polje ne smije biti prazno."),
                      name: 'directorId',
                      initialValue: userData.isNotEmpty
                          ? userData['directorId'].toString()
                          : null,
                      decoration: const InputDecoration(labelText: "Director"),
                      items: widget.data
                              .map(
                                (projection) => DropdownMenuItem(
                                  value: projection.directorId.toString(),
                                  child:
                                      Text(projection.fullName?.trim() ?? ''),
                                ),
                              )
                              .toList() ??
                          [],
                      enabled: true,
                    ),
                  ),
                  SizedBox(
                      height: 200,
                      width: 120,
                      child: FormBuilderCheckboxGroup(
                          name: 'movieGenreIdList', options: fetchedOptions)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}