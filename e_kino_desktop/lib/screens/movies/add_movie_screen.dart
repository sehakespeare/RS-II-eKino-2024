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
  final int? id;
  final String? title;
  final String? description;
  final String? photo;
  final String? runningTime;
  final int? directorId;
  final String? directorFullName;
  final int? year;
  final List<int>? movieGenreIdList;
  AddMovieScreen(
      {required this.data,
      required this.genre,
      this.id,
      this.title,
      this.description,
      this.photo,
      this.runningTime,
      this.directorId,
      this.directorFullName,
      this.year,
      this.movieGenreIdList,
      super.key});
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
    if (widget.id != null) {
      userData = {
        "id": widget.id,
        "title": widget.title,
        "description": widget.description,
        "photo": base64Decode(widget.photo!),
        "movieGenreIdList": widget.movieGenreIdList,
        "directorId": widget.directorId,
        "runningTime": widget.runningTime,
        'year': widget.year
      };
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  var _image;
  String? _imageError;

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
  void _validateImage() {
    setState(() {
      if (_image == null &&
          (userData['photo'] == null || userData['photo'].isEmpty)) {
        _imageError = 'Image is required'; // Postavite poruku o grešci
      } else {
        _imageError = null; // Ako je slika odabrana, nema greške
      }
    });
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
                          _validateImage();
                          if (_imageError == null) {
                            if (isValid) {
                              if (widget.id != null) {
                                var request =
                                    Map.from(_formKey.currentState!.value);
                                if (_image != null) {
                                  var imagePath = _image?.path;

                                  List<int> imageBytes =
                                      await File(imagePath!).readAsBytes();

                                  String base64Image = base64Encode(imageBytes);
                                  request['photo'] = base64Image;
                                } else {
                                  request['photo'] = widget.photo;
                                }

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
                                try {
                                  await _moviesProvider.update(
                                      userData['id'], movieData);

                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const MoviesScreen(),
                                  ));

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
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                                movieData = {};
                              } else {
                                var request =
                                    Map.from(_formKey.currentState!.value);
                                if (_image != null) {
                                  var imagePath = _image?.path;
                                  List<int> imageBytes =
                                      await File(imagePath!).readAsBytes();

                                  String base64Image = base64Encode(imageBytes);
                                  request['photo'] = base64Image;
                                }

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
                                    "movieGenreIdList": _formKey.currentState
                                        ?.value['movieGenreIdList'],
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
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
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
                  if (_imageError != null) // Prikaz greške ispod slike
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _imageError!,
                        style: const TextStyle(color: Colors.red),
                      ),
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
                  FormBuilderTextField(
                    decoration: const InputDecoration(
                        labelText: "Godina",
                        labelStyle: TextStyle(color: Colors.black)),
                    initialValue:
                        userData.isNotEmpty ? userData['year'].toString() : '',
                    name: "year",
                    style: const TextStyle(color: Colors.black),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: "Polje ne smije biti prazno."),
                      FormBuilderValidators.integer(
                          errorText: "Unesite validan broj."),
                      FormBuilderValidators.min(1900,
                          errorText: "Godina ne smije biti manja 1900."),
                      FormBuilderValidators.max(DateTime.now().year,
                          errorText: "Godina ne smije biti veća od trenutne."),
                    ]),
                  ),
                  FormBuilderTextField(
                    initialValue: userData.isNotEmpty
                        ? userData['runningTime'].toString()
                        : '',
                    decoration: const InputDecoration(
                        labelText: "Trajanje",
                        labelStyle: TextStyle(color: Colors.black)),
                    name: "runningTime",
                    style: const TextStyle(color: Colors.black),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: "Polje ne smije biti prazno."),
                      FormBuilderValidators.integer(
                          errorText: "Unesite validan broj."),
                      FormBuilderValidators.min(1,
                          errorText:
                              "Trajanje filma ne može biti kraće od 1 min "),
                      FormBuilderValidators.max(500,
                          errorText:
                              "Trajanje filma ne može biti duže od 500 min "),
                    ]),
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
                        name: 'movieGenreIdList',
                        options: fetchedOptions,
                        validator: (List<dynamic>? values) {
                          if (values == null || values.isEmpty) {
                            return 'Morate izabrati najmanje jedan žanr!';
                          }
                          return null;
                        },
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
