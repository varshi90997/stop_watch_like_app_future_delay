
class TimerModel {
  String currentTime;
  String endTime;
  bool isCurrent;
  String value;
  bool isStart;
  String speed;

  TimerModel({

    required this.currentTime,
    required this.endTime,
    required this.isCurrent,
    required this.value,
    required this.isStart,
    required this.speed,
  });

  Map<String, dynamic> toJson() => {
    'currentTime': currentTime,
    'endTime': endTime,
    'isCurrent': isCurrent,
    'value': value,
    'isStart': isStart,
    'speed': speed,
  };

  factory TimerModel.fromJson(Map<String, dynamic> json) {
    return TimerModel(
      currentTime: json['currentTime'],
      endTime: json['endTime'],
      isCurrent: json['isCurrent'],
      value: json['value'],
      isStart: json['isStart'],
      speed: json['speed'],
    );
  }
}

