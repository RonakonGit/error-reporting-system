class Logs {
  final int lid;
  final int aid;
  final String message;
  final String logType;
  final String reportBy;
  final String dateCreated;
  Logs(this.lid, this.logType, this.reportBy, this.message, this.aid,
      this.dateCreated);

  static Logs fromJson(Map<String, dynamic> json) {
    return Logs(json['lid'], json['log_type'], json['report_by'],
        json['message'], json['aid'], json['date_created']);
  }
}
