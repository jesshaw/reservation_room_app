class Hotel {
  final int hotelId;
  final String name;
  final String address;
  final List<String> images;

  Hotel({this.hotelId, this.name, this.address, this.images});

  Hotel.fromJson(Map<String, dynamic> json)
      : hotelId = json["hotelId"],
        name = json["name"],
        address = json["address"],
        images = json["images"];
}
