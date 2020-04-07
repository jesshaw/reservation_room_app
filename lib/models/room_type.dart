class RoomType {
  final int roomTypeId;
  final double standardRate;
  final String typeDescription;
  final bool smokingYN;
  final String remark;
  final List<String> roomTypePictures;

  RoomType(
      {this.roomTypeId,
      this.standardRate,
      this.typeDescription,
      this.smokingYN,
      this.remark,
      this.roomTypePictures});

  RoomType.fromJson(Map<String, dynamic> json)
      : roomTypeId = json["roomTypeId"],
        standardRate = json["standardRate"],
        typeDescription = json["typeDescription"],
        smokingYN = json["smokingYN"],
        remark = json["smokingYN"],
        roomTypePictures = json["roomTypePictures"];
}
