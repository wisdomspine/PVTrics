enum DataPresentationFormat {
  table,
  chart,
}

String formatLabel(DataPresentationFormat format) {
  if (format == DataPresentationFormat.chart) {
    return "Chart";
  } else {
    return "Table";
  }
}
