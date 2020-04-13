class Attraction {
  final int attractionId;
  final int cityId;
  final List<String> images;
  final String name;
  final String slogan;
  final double rate;
  final String address;
  final String openingHours;
  final String description;
  final String ticketInfo;
  final String travelInfo;
  final String contactInfo;
  final bool smokingYN;
  final String remark;

  Attraction(
      {this.attractionId,
      this.cityId,
      this.images,
      this.name,
      this.slogan,
      this.rate,
      this.address,
      this.openingHours,
      this.description,
      this.ticketInfo,
      this.travelInfo,
      this.contactInfo,
      this.smokingYN,
      this.remark});

  Attraction.fromJson(Map<String, dynamic> json)
      : attractionId = json["attractionId"],
        cityId = json["cityId"],
        images = json["images"],
        name = json["name"],
        slogan = json["slogan"],
        rate = json["rate"],
        address = json["address"],
        openingHours = json["openingHours"],
        description = json["description"],
        ticketInfo = json["ticketInfo"],
        travelInfo = json["travelInfo"],
        contactInfo = json["contactInfo"],
        smokingYN = json["smokingYN"],
        remark = json["remark"];
}
