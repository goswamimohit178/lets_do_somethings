import 'dart:ui';

class ChartData {
  var x;
  var y;

  ChartData(this.x, this.y, this.mobile, this.sale, [this.color]);

  final String mobile;
  final double sale;
  final Color? color;
}

class ChartDataInfo {
  ChartDataInfo(this.year, this.value, [this.color]);

  final String year;
  final double value;
  final Color? color;
}


final List<ChartDataInfo> indexChart = [
  ChartDataInfo('Mon', 900, Color(0xff096795)),
  ChartDataInfo('Tue', 400,  Color(0xff096795)),
  ChartDataInfo('Wed', 1100,  Color(0xff096795)),
  ChartDataInfo('Thu', 1500,  Color(0xff096795)),
  ChartDataInfo('Fri', 800, Color(0xff096795)),
  ChartDataInfo('Sat', 600,  Color(0xff096795)),
  ChartDataInfo('Sun', 500,  Color(0xff096795)),

];
