import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:vptrics/modules/core/enums/gender.enum.dart';
import 'package:vptrics/modules/patients/forms/patient.form.dart';
import 'package:vptrics/styles/app_icons.dart';

class CreatePatientScreen extends StatefulWidget {
  static const String route = "CreatePatientScreen";
  const CreatePatientScreen({Key? key}) : super(key: key);

  @override
  _CreatePatientScreenState createState() => _CreatePatientScreenState();
}

class _CreatePatientScreenState extends State<CreatePatientScreen> {
  final PatientForm _form = new PatientForm();
  ImageProvider? _imageProvider;
  @override
  Widget build(BuildContext context) {
    final Color formFillColor = Theme.of(context).cardColor.withOpacity(.8);
    return Scaffold(
      appBar: AppBar(
        title: Text("New Patient"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                child: ReactiveForm(
                  formGroup: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      CircleAvatar(
                        radius: 56,
                        backgroundColor:
                            Theme.of(context).primaryColor.withOpacity(.9),
                        child: Container(
                          height: 56 * 2,
                          width: 56 * 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                pickImage();
                              },
                              child: Center(
                                child: (_imageProvider == null)
                                    ? Icon(AppIcons.camera)
                                    : Image(
                                        image: _imageProvider as ImageProvider),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ReactiveTextField(
                        formControlName: PatientForm.firstnameControlName,
                        decoration: InputDecoration(
                          fillColor: formFillColor,
                          hintText: "Firstname",
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      ReactiveTextField(
                        formControlName: PatientForm.lastnameControlName,
                        decoration: InputDecoration(
                          fillColor: formFillColor,
                          hintText: "Lastname",
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      ReactiveFormConsumer(
                        builder: (context2, form, widget) =>
                            ReactiveDateTimePicker(
                          formControlName: PatientForm.dobControlName,
                          firstDate: DateTime(1890),
                          lastDate: DateTime.now(),
                          clearIcon: Icon(AppIcons.cancel),
                          fieldHintText: "Date of birth",
                          decoration: InputDecoration(
                            suffixIcon: Icon(AppIcons.calendar),
                            fillColor: formFillColor,
                            hintText: "Date of birth",
                            prefixText: _form
                                        .controls[PatientForm.dobControlName]
                                        ?.value ==
                                    null
                                ? "Date of birth"
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      ReactiveDropdownField<Gender>(
                        dropdownColor:
                            Theme.of(context).cardColor.withOpacity(.88),
                        elevation: 0,
                        items: Gender.values
                            .map(
                              (gender) => DropdownMenuItem(
                                child: Text(
                                  genderLabel(gender),
                                ),
                                value: gender,
                              ),
                            )
                            .toList(),
                        formControlName: PatientForm.genderControlName,
                        decoration: InputDecoration(
                          fillColor: formFillColor,
                          hintText: "Gender",
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      ReactiveTextField(
                        keyboardType: TextInputType.phone,
                        formControlName: PatientForm.phoneControlName,
                        decoration: InputDecoration(
                          fillColor: formFillColor,
                          hintText: "Phone number",
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      ReactiveTextField(
                        keyboardType: TextInputType.emailAddress,
                        formControlName: PatientForm.emailControlName,
                        decoration: InputDecoration(
                          fillColor: formFillColor,
                          hintText: "Email",
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      ReactiveTextField(
                        formControlName: PatientForm.addressControlName,
                        minLines: 2,
                        maxLines: 3,
                        decoration: InputDecoration(
                          fillColor: formFillColor,
                          hintText: "Address",
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Create Patient
                        },
                        child: Text(
                          "Done",
                          style: Theme.of(context)
                              .accentTextTheme
                              .subtitle1
                              ?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage() async {
    try {
      final picker = ImagePicker();
      XFile? file = await picker.pickImage(source: ImageSource.gallery);

      if (file != null) {
        // perform image file validation
        _form.controls[PatientForm.photoControlName]?.value = file;
        _updateImagePreview();
        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }

  _updateImagePreview() async {
    XFile? file = _form.controls[PatientForm.photoControlName]?.value as XFile;
    if (file != null) {
      _imageProvider = MemoryImage(await file.readAsBytes());
      setState(() {});
    }
  }
}
