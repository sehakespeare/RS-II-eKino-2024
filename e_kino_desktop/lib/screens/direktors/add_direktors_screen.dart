import 'dart:convert';

import 'package:e_kino_desktop/providers/direktor_provider.dart';

import 'package:e_kino_desktop/screens/direktors/direktors_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class AddDirektorsScreen extends StatefulWidget {
  const AddDirektorsScreen({super.key});
  @override
  State<AddDirektorsScreen> createState() => _AddDirektorsScreenState();
}

class _AddDirektorsScreenState extends State<AddDirektorsScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final Map<String, dynamic> _initialValue = {};
  late DirektorProvider _direktorProvider;

  @override
  void initState() {
    super.initState();
    _direktorProvider = context.read<DirektorProvider>();
  }

  File? _image;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Directors",
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
                            var imagePath = _image?.path;
                            // Read image file as bytes
                            List<int> imageBytes =
                                await File(imagePath!).readAsBytes();

                            // Encode image bytes to base64 string
                            String base64Image = base64Encode(imageBytes);
                            request['photo'] = base64Image;
                            try {
                              await _direktorProvider.insert(request);

                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const DirektorsScreen(),
                              ));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Uspješno ste dodali režisera",
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FormBuilderTextField(
                    decoration: const InputDecoration(
                        labelText: "Full name",
                        labelStyle: TextStyle(color: Colors.black)),
                    name: "fullName",
                    style: const TextStyle(color: Colors.black),
                    validator: FormBuilderValidators.required(
                        errorText: "Polje ne smije biti prazno."),
                  ),
                  FormBuilderTextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 4, //Normal textInputField will be displayed
                    maxLines: 10, //   enabled: true,
                    decoration: const InputDecoration(
                        labelText: "Biography",
                        labelStyle: TextStyle(color: Colors.black)),
                    name: "biography",
                    style: const TextStyle(color: Colors.black),
                    validator: FormBuilderValidators.required(
                        errorText: "Polje ne smije biti prazno."),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 80,
            ),
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
                    child: _image == null
                        ? Center(child: Text('No image selected.'))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(_image!, fit: BoxFit.cover),
                          ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: getImage,
                    child: Text('Pick Image'),
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
