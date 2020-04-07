class RoomType {
  final int roomTypeId;
  final double standardRate;
  final String typeDescription;
  final bool smokingYN;
  final String remark;
  final List<String> images;

  RoomType(
      {this.roomTypeId,
      this.standardRate,
      this.typeDescription,
      this.smokingYN,
      this.remark,
      this.images});

  RoomType.fromJson(Map<String, dynamic> json)
      : roomTypeId = json["roomTypeId"],
        standardRate = json["standardRate"],
        typeDescription = json["typeDescription"],
        smokingYN = json["smokingYN"],
        remark = json["smokingYN"],
        images = json["images"];
}
