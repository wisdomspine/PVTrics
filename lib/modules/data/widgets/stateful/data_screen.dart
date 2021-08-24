import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:recase/recase.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:vptrics/modules/auth/widgets/stateless/act_on_signout.dart';
import 'package:vptrics/modules/data/enums/data_presentation_format.enum.dart'
    as data_format;
import 'package:vptrics/modules/data/forms/data_filter.form.dart';
import 'package:vptrics/modules/data/models/data_point.dart';
import 'package:vptrics/modules/metrics/metrics.service.dart';
import 'package:vptrics/modules/metrics/models/patient_metrics.model.dart';
import 'package:vptrics/modules/patients/models/patient.model.dart';
import 'package:vptrics/modules/patients/patients.service.dart';
import 'package:vptrics/shared_widgets/stateless/not_found.dart';
import 'package:vptrics/shared_widgets/stateless/page_centered_not_found.dart';
import 'package:vptrics/styles/app_icons.dart';
import 'package:vptrics/styles/styles.dart' as styles;
import 'package:intl/intl.dart';

class DataScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  static const String route = "DataScreen";
  final DataScreenData data;
  DataScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> with GetItStateMixin {
  final DataFilterForm _filterForm = new DataFilterForm();
  data_format.DataPresentationFormat _format =
      data_format.DataPresentationFormat.chart;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    GetIt.I.pushNewScope();
    GetIt.I.registerSingleton<DataFilterForm>(_filterForm);
    super.initState();
  }

  @override
  void dispose() {
    GetIt.I.popScope();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object?> formValue =
        watchStream<DataFilterForm, Map<String, Object?>?>(
                (form) => form.valueChanges, {}).data ??
            {};
    List<PatientMetrics> metrics =
        watchOnly<MetricsService, List<PatientMetrics>>(
            (service) => service.forPatient(
                  widget.data.ref,
                  startDate: formValue[DataFilterForm.startDateControlName],
                  endDate: formValue[DataFilterForm.endDateControlName],
                ));
    Patient? patient = watchOnly<PatientsService, Patient?>(
        (service) => service.getByRef(widget.data.ref));
    return ActOnSignout(
      child: WillPopScope(
        onWillPop: () async {
          await SystemChrome.setPreferredOrientations(
              styles.preferredOrientations);
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Data: ${ReCase(patient?.name ?? 'Patient').titleCase}",
            ),
            actions: [
              DropdownButton(
                underline: SizedBox(),
                dropdownColor: Theme.of(context).cardColor.withOpacity(.85),
                elevation: 0,
                value: _format,
                onChanged: (data_format.DataPresentationFormat? newFormat) {
                  _format = newFormat ?? _format;
                  _updateData();
                },
                items: data_format.DataPresentationFormat.values
                    .map(
                      (format) => DropdownMenuItem(
                        child: Text(
                          data_format.formatLabel(format),
                        ),
                        value: format,
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                width: 16,
              ),
              IconButton(
                color: Theme.of(context).accentColor,
                onPressed: () {
                  _pickRange(context);
                },
                icon: Icon(
                  AppIcons.calendar,
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: metrics.length > 0
                ? ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    children: [
                      SizedBox(height: 16),
                      if (_format == data_format.DataPresentationFormat.chart)
                        ...charts(
                          metrics
                              .map((metric) =>
                                  DataPoint(metric.temp, metric.time))
                              .toList(),
                          metrics
                              .map((metric) =>
                                  DataPoint(metric.pulse, metric.time))
                              .toList(),
                        ),
                      if (_format ==
                          data_format.DataPresentationFormat.table) ...[
                        generateTable(
                          metrics
                              .map((metric) =>
                                  DataPoint(metric.temp, metric.time))
                              .toList(),
                          "Temperature",
                          (point) => "${point.value}°C",
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        generateTable(
                          metrics
                              .map((metric) =>
                                  DataPoint(metric.pulse, metric.time))
                              .toList(),
                          "Pulse Rate",
                          (point) => "${point.value} bpm",
                        ),
                      ],
                    ],
                  )
                : PageCenteredNotFound(
                    child: NotFound(
                      title: "No data within the specified period",
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  _updateData() {
    setState(() {});
  }

  List<Widget> charts(
    List<DataPoint> temperatures,
    List<DataPoint> pulses,
  ) {
    final Map<String, List<DataPoint>> chartsData = {
      "Temperature (°F)": temperatures,
      "Pulse rate (bpm)": pulses,
    };
    List<Widget> response = [];
    chartsData.entries.forEach((entry) {
      response.add(
        Card(
          color: Theme.of(context).cardColor.withOpacity(.8),
          child: SfCartesianChart(
            backgroundColor: Colors.transparent,
            primaryXAxis: DateTimeAxis(),
            primaryYAxis: NumericAxis(),
            title: ChartTitle(text: entry.key),
            plotAreaBorderColor: Colors.transparent,
            trackballBehavior: TrackballBehavior(
              activationMode: ActivationMode.singleTap,
              enable: true,
              shouldAlwaysShow: true,
            ),
            series: <SplineSeries<DataPoint, DateTime>>[
              SplineSeries(
                dataSource: entry.value,
                xValueMapper: (point, _) => point.label,
                yValueMapper: (point, _) => point.value,
                color: Theme.of(context).accentColor,
                width: 2,
                enableTooltip: true,
              )
            ],
          ),
        ),
      );

      response.add(
        SizedBox(
          height: 16,
        ),
      );
    });
    if (response.length > 0) {
      response.removeLast();
    }
    return response;
  }

  Widget generateTable(
      List<DataPoint> points, String title, String Function(DataPoint) label) {
    return Card(
      color: Theme.of(context).cardColor.withOpacity(.8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 8,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                defaultColumnWidth: FixedColumnWidth(100),
                border: TableBorder(
                  horizontalInside: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                  verticalInside: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                children: [
                  TableRow(
                    children: points
                        .map(
                          (point) => Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              label(point),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  TableRow(
                    children: points
                        .map(
                          (point) => Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              "${DateFormat.yMd().format(point.label)}\n@\n${DateFormat.Hms().format(point.label)}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                        .toList(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _pickRange(BuildContext context) {
    DateTime start = _filterForm
        .controls[DataFilterForm.startDateControlName]?.value as DateTime;
    DateTime end = _filterForm
        .controls[DataFilterForm.endDateControlName]?.value as DateTime;
    showDateRangePicker(
      context: context,
      firstDate: DataFilterForm.minDate,
      lastDate: DateTime.now(),
      initialDateRange: DateTimeRange(start: start, end: end),
      builder: (context2, child) => Theme(
        data: Theme.of(context).copyWith(
          timePickerTheme: Theme.of(context).timePickerTheme.copyWith(),
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        ),
        child: child ?? SizedBox(),
      ),
    ).then((range) {
      _filterForm.value = {
        DataFilterForm.startDateControlName: range?.start ?? start,
        DataFilterForm.endDateControlName: range?.end ?? end,
      };
      _updateData();
    });
  }
}

class DataScreenData {
  final DocumentReference ref;

  DataScreenData({required this.ref});

  DataScreenData copyWith({
    DocumentReference? ref,
  }) {
    return DataScreenData(
      ref: ref ?? this.ref,
    );
  }
}
