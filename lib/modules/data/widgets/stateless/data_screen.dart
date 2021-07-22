import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vptrics/modules/data/enums/data_presentation_format.enum.dart'
    as data_format;
import 'package:vptrics/modules/data/forms/data_filter.form.dart';
import 'package:vptrics/modules/data/models/data_point.dart';
import 'package:vptrics/styles/app_icons.dart';
import 'package:vptrics/styles/styles.dart' as styles;
import 'package:intl/intl.dart';

class DataScreen extends StatefulWidget {
  static const String route = "DataScreen";
  const DataScreen({Key? key}) : super(key: key);

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  final DataFilterForm _filterForm = new DataFilterForm();
  data_format.DataPresentationFormat _format =
      data_format.DataPresentationFormat.chart;

  List<DataPoint> _temperatures = [];
  List<DataPoint> _heartBeats = [];

  @override
  void initState() {
    _initTempData();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _initTempData() {
    _temperatures = _heartBeats = [
      DataPoint(10, DateTime(2021, 7, 1)),
      DataPoint(12, DateTime(2021, 7, 2)),
      DataPoint(4, DateTime(2021, 7, 3)),
      DataPoint(20, DateTime(2021, 7, 4)),
      DataPoint(-30, DateTime(2021, 7, 5)),
      DataPoint(35, DateTime(2021, 7, 6)),
      DataPoint(30, DateTime(2021, 7, 7)),
      DataPoint(40, DateTime(2021, 7, 8)),
      DataPoint(25, DateTime(2021, 7, 9)),
      DataPoint(50, DateTime(2021, 7, 10)),
      DataPoint(35, DateTime(2021, 7, 11)),
      DataPoint(30, DateTime(2021, 7, 12)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await SystemChrome.setPreferredOrientations(
            styles.preferredOrientations);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Data: John Doe",
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
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          children: [
            SizedBox(height: 16),
            if (_format == data_format.DataPresentationFormat.chart)
              ...charts(),
            if (_format == data_format.DataPresentationFormat.table) ...[
              generateTable(
                _temperatures,
                "Temperature",
                (point) => "${point.value}°F",
              ),
              SizedBox(
                height: 16,
              ),
              generateTable(
                _heartBeats,
                "Pulse Rate",
                (point) => "${point.value} bpm",
              ),
            ],
          ],
        ),
      ),
    );
  }

  _updateData() {
    setState(() {});
  }

  List<Widget> charts() {
    final Map<String, List<DataPoint>> chartsData = {
      "Temperature (°F)": _temperatures,
      "Pulse rate (bpm)": _heartBeats,
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
      lastDate: end,
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
