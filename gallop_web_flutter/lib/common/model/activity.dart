class Activity {
  int? activityId;
  String? activityTitle;
  String? activityContent;
  String? activityCover;

  Activity(
      {this.activityId,
      this.activityTitle,
      this.activityContent,
      this.activityCover});

  Activity.fromJson(Map<String, dynamic> json) {
    activityId = json['activityId'];
    activityTitle = json['activityTitle'];
    activityContent = json['activityContent'];
    activityCover = json['activityCover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activityId'] = activityId;
    data['activityTitle'] = activityTitle;
    data['activityContent'] = activityContent;
    data['activityCover'] = activityCover;
    return data;
  }
}
