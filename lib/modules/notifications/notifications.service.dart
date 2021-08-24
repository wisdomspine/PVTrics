import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vptrics/modules/metrics/metrics.service.dart';
import 'package:vptrics/modules/notifications/models/metrics_notification.model.dart';
import 'package:vptrics/modules/patients/patients.service.dart';

class MetricsNotificationService extends ChangeNotifier {
  final PatientsService _patientsService = GetIt.I<PatientsService>();
  final MetricsService _metricsService = GetIt.I<MetricsService>();

  List<MetricsNotification> _notifications = [];

  MetricsNotificationService() {
    _patientsService.addListener(() {
      _loadData();
    });

    _metricsService.addListener(() {
      _loadData();
    });
    _loadData();
  }

  _loadData() {
    _notifications = _metricsService.all
        .where((metrics) => !metrics.read)
        .map((metrics) => MetricsNotification(
            metrics: metrics,
            patient: _patientsService
                .getByRef(metrics.patientRef as DocumentReference)))
        .toList();

    notifyListeners();
  }

  List<MetricsNotification> get all => _notifications;

  Future markAsRead(MetricsNotification notification) {
    return _metricsService
        .markAsRead(ref: notification.metrics.ref as DocumentReference)
        .catchError((error) {});
  }
}
