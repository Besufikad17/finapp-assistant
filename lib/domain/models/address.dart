class Address {
  final String? country;
  final String? city;

  const Address({this.country, this.city});

  factory Address.fromMap(Map<dynamic, dynamic> map) {
    return Address(
      country: map['country'],
      city: map['city'] 
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'city': city
    };
  }
}