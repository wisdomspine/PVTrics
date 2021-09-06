import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:vptrics/modules/core/enums/gender.enum.dart';
import 'package:vptrics/modules/core/validation/app_validation_message.dart';
import 'package:vptrics/modules/notifications/services/snackbar.service.dart';
import 'package:vptrics/modules/patients/forms/patient.form.dart';
import 'package:vptrics/modules/patients/models/patient.model.dart';
import 'package:vptrics/modules/patients/patients.service.dart';
import 'package:vptrics/modules/patients/widgets/stateful/patient_dashboard_screen.dart';
import 'package:vptrics/shared_widgets/stateless/loading_screen.dart';
import 'package:vptrics/styles/app_icons.dart';

class CreatePatientScreen extends StatefulWidget {
  static const String route = "CreatePatientScreen";
  final CreatePatientScreenData? data;
  const CreatePatientScreen({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  _CreatePatientScreenState createState() => _CreatePatientScreenState();
}

class _CreatePatientScreenState extends State<CreatePatientScreen> {
  PatientForm _form = new PatientForm();
  ImageProvider? _imageProvider;
  bool _processing = false;

  @override
  void initState() {
    _form = new PatientForm(patient: widget.data?.patient);
    if (widget.data?.patient != null) {
      _imageProvider = new NetworkImage(widget.data?.patient?.photo ?? "");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Color formFillColor = Theme.of(context).cardColor.withOpacity(.8);
    return LoadingScreen(
      loading: _processing,
      child: Scaffold(
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
                                          image:
                                              _imageProvider as ImageProvider),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ReactiveFormConsumer(
                          builder: (context, formgroup, _) {
                            return formgroup
                                        .controls[PatientForm.photoControlName]
                                        ?.hasError(
                                            ValidationMessage.required) ??
                                    false
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Please select a photo",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .inputDecorationTheme
                                            .errorStyle,
                                      )
                                    ],
                                  )
                                : Column(
                                    children: [],
                                  );
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ReactiveTextField(
                          formControlName: PatientForm.firstnameControlName,
                          validationMessages: (conrol) => {
                            ValidationMessage.required: "Firstname is require",
                            AppValidationMessage.notEmpty:
                                "Firstname is require",
                          },
                          textInputAction: TextInputAction.next,
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
                          textInputAction: TextInputAction.next,
                          validationMessages: (conrol) => {
                            ValidationMessage.required: "Lastname is require",
                            AppValidationMessage.notEmpty:
                                "Lastnames is require",
                          },
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
                            validationMessages: (conrol) => {
                              ValidationMessage.required:
                                  "Date of birth is require",
                            },
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
                          validationMessages: (conrol) => {
                            ValidationMessage.required: "Gender is require",
                          },
                          items: Gender.values
                              .map(
                                (gender) => DropdownMenuItem(
                                  child: Text(
                                    genderLabel(gender) ?? '',
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
                          textInputAction: TextInputAction.next,
                          validationMessages: (conrol) => {
                            ValidationMessage.required:
                                "Phone number is require",
                            AppValidationMessage.notEmpty:
                                "Phone number is require",
                            AppValidationMessage.phone: "Invalid phone number"
                          },
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
                          textInputAction: TextInputAction.next,
                          validationMessages: (conrol) => {
                            ValidationMessage.required:
                                "Email address is require",
                            ValidationMessage.email: "Invalid email address",
                          },
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
                          textInputAction: TextInputAction.done,
                          validationMessages: (conrol) => {
                            ValidationMessage.required: "Address is require",
                            AppValidationMessage.notEmpty: "Address is require",
                          },
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
                            done();
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
                        SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
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

  done() async {
    _form.markAllAsTouched();
    if (!_form.valid) {
      SnackbarService.errorText(
          context: context, message: "Please provide all fields");
      return;
    }

    setState(() {
      _processing = true;
    });
    try {
      dynamic value = _form.controls[PatientForm.photoControlName]?.value;
      XFile? file = (value is XFile) ? value : null;
      final ref = await GetIt.I<PatientsService>().writePatient(
        patient: _form.asPatient.copyWith(ref: widget.data?.patient?.ref),
        photo: await file?.readAsBytes(),
      );

      SnackbarService.showText(
        context: context,
        message: widget.data?.patient != null
            ? "Patient records updated"
            : "New Patient added",
      );

      Navigator.pushReplacementNamed(
        context,
        PatientDashboardScreen.route,
        arguments: PatientDashboardScreenData(ref: ref),
      );
    } catch (e) {
      log("$e");
      _processing = false;
      setState(() {});
      String message = widget.data?.patient != null
          ? "Error updating patient's records"
          : "Patient's record not created";
      if (e is FirebaseException) {
        message = e.message ?? message;
      }

      SnackbarService.errorText(context: context, message: message);
    }
  }
}

class CreatePatientScreenData {
  final Patient? patient;

  CreatePatientScreenData({this.patient});

  CreatePatientScreenData copyWith({
    Patient? patient,
  }) {
    return CreatePatientScreenData(
      patient: patient ?? this.patient,
    );
  }
}
