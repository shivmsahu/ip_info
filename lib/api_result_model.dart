class ApiResultModel {
  ApiResultModel({
      String? ip, 
      String? countryCode, 
      String? countryName, 
      String? regionCode, 
      String? regionName, 
      String? city, 
      String? zipCode, 
      String? timeZone, 
      double? latitude, 
      double? longitude, 
      int? metroCode,}){
    _ip = ip;
    _countryCode = countryCode;
    _countryName = countryName;
    _regionCode = regionCode;
    _regionName = regionName;
    _city = city;
    _zipCode = zipCode;
    _timeZone = timeZone;
    _latitude = latitude;
    _longitude = longitude;
    _metroCode = metroCode;
}

  ApiResultModel.fromJson(Map<String, dynamic> json) {
    _ip = json['ip'];
    _countryCode = json['country_code'];
    _countryName = json['country_name'];
    _regionCode = json['region_code'];
    _regionName = json['region_name'];
    _city = json['city'];
    _zipCode = json['zip_code'];
    _timeZone = json['time_zone'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _metroCode = json['metro_code'];
  }
  String? _ip;
  String? _countryCode;
  String? _countryName;
  String? _regionCode;
  String? _regionName;
  String? _city;
  String? _zipCode;
  String? _timeZone;
  num? _latitude;
  num? _longitude;
  int? _metroCode;

  String? get ip => _ip;
  String? get countryCode => _countryCode;
  String? get countryName => _countryName;
  String? get regionCode => _regionCode;
  String? get regionName => _regionName;
  String? get city => _city;
  String? get zipCode => _zipCode;
  String? get timeZone => _timeZone;
  num? get latitude => _latitude;
  num? get longitude => _longitude;
  int? get metroCode => _metroCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ip'] = _ip;
    map['country_code'] = _countryCode;
    map['country_name'] = _countryName;
    map['region_code'] = _regionCode;
    map['region_name'] = _regionName;
    map['city'] = _city;
    map['zip_code'] = _zipCode;
    map['time_zone'] = _timeZone;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['metro_code'] = _metroCode;
    return map;
  }

}

class ResultModel{
  final bool isSuccess;
  final ApiResultModel? data;
  final String? message;
  ResultModel({
    required this.isSuccess,
    this.data,
    this.message
});
}