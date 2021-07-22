import 'package:reactive_forms/reactive_forms.dart';

class DataFilterForm extends FormGroup {
  DataFilterForm()
      : super({
          startDateControlName: new FormControl<DateTime>(
            // set start date to last 7 days
            value: DateTime.fromMillisecondsSinceEpoch(
              DateTime.now().millisecondsSinceEpoch - (1000 * 60 * 60 * 24 * 7),
            ),
          ),
          endDateControlName: new FormControl<DateTime>(
            value: DateTime.now(),
          ),
        });

  static const String startDateControlName = "startDate";
  static const String endDateControlName = "endDate";
  static final DateTime minDate = DateTime(2021, 7, 1);
}
