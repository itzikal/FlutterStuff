class Player {
  Player({
      String? message, 
      Data? data, 
      int? code,}){
    _message = message;
    _data = data;
    _code = code;
}

  Player.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _code = json['code'];
  }
  String? _message;
  Data? _data;
  int? _code;

  String? get message => _message;
  Data? get data => _data;
  int? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['code'] = _code;
    return map;
  }

}

class Data {
  Data({
      dynamic team, 
      dynamic thumbnail, 
      String? accountStatus, 
      int? leagueProgress, 
      dynamic dominantFoot, 
      Country? country, 
      String? playerRoleName, 
      String? accessLevel, 
      bool? isAnonymous, 
      dynamic score, 
      String? lastName, 
      String? locale, 
      String? type, 
      int? unreadResultsCount, 
      int? id, 
      dynamic gender, 
      bool? useImperialUnits, 
      String? uniqueIdentifier, 
      String? birthdate, 
      int? height, 
      String? externalAccessLevel, 
      int? unseenNotificationsCount, 
      int? leagueId, 
      String? firstName, 
      dynamic club, 
      int? ageGroupId,}){
    _team = team;
    _thumbnail = thumbnail;
    _accountStatus = accountStatus;
    _leagueProgress = leagueProgress;
    _dominantFoot = dominantFoot;
    _country = country;
    _playerRoleName = playerRoleName;
    _accessLevel = accessLevel;
    _isAnonymous = isAnonymous;
    _score = score;
    _lastName = lastName;
    _locale = locale;
    _type = type;
    _unreadResultsCount = unreadResultsCount;
    _id = id;
    _gender = gender;
    _useImperialUnits = useImperialUnits;
    _uniqueIdentifier = uniqueIdentifier;
    _birthdate = birthdate;
    _height = height;
    _externalAccessLevel = externalAccessLevel;
    _unseenNotificationsCount = unseenNotificationsCount;
    _leagueId = leagueId;
    _firstName = firstName;
    _club = club;
    _ageGroupId = ageGroupId;
}

  Data.fromJson(dynamic json) {
    _team = json['team'];
    _thumbnail = json['thumbnail'];
    _accountStatus = json['account_status'];
    _leagueProgress = json['league_progress'];
    _dominantFoot = json['dominant_foot'];
    _country = json['country'] != null ? Country.fromJson(json['country']) : null;
    _playerRoleName = json['player_role_name'];
    _accessLevel = json['access_level'];
    _isAnonymous = json['is_anonymous'];
    _score = json['score'];
    _lastName = json['last_name'];
    _locale = json['locale'];
    _type = json['type'];
    _unreadResultsCount = json['unread_results_count'];
    _id = json['id'];
    _gender = json['gender'];
    _useImperialUnits = json['use_imperial_units'];
    _uniqueIdentifier = json['unique_identifier'];
    _birthdate = json['birthdate'];
    _height = json['height'];
    _externalAccessLevel = json['external_access_level'];
    _leagueId = json['league_id'];
    _firstName = json['first_name'];
    _club = json['club'];
    _ageGroupId = json['age_group_id'];
  }
  dynamic _team;
  dynamic _thumbnail;
  String? _accountStatus;
  int? _leagueProgress;
  dynamic _dominantFoot;
  Country? _country;
  String? _playerRoleName;
  String? _accessLevel;
  bool? _isAnonymous;
  dynamic _score;
  String? _lastName;
  String? _locale;
  String? _type;
  int? _unreadResultsCount;
  int? _id;
  dynamic _gender;
  bool? _useImperialUnits;
  String? _uniqueIdentifier;
  String? _birthdate;
  int? _height;
  String? _externalAccessLevel;
  int? _unseenNotificationsCount;
  int? _leagueId;
  String? _firstName;
  dynamic _club;
  int? _ageGroupId;

  dynamic get team => _team;
  dynamic get thumbnail => _thumbnail;
  String? get accountStatus => _accountStatus;
  int? get leagueProgress => _leagueProgress;
  dynamic get dominantFoot => _dominantFoot;
  Country? get country => _country;
  String? get playerRoleName => _playerRoleName;
  String? get accessLevel => _accessLevel;
  bool? get isAnonymous => _isAnonymous;
  dynamic get score => _score;
  String? get lastName => _lastName;
  String? get locale => _locale;
  String? get type => _type;
  int? get unreadResultsCount => _unreadResultsCount;
  int? get id => _id;
  dynamic get gender => _gender;
  bool? get useImperialUnits => _useImperialUnits;
  String? get uniqueIdentifier => _uniqueIdentifier;
  String? get birthdate => _birthdate;
  int? get height => _height;
  String? get externalAccessLevel => _externalAccessLevel;
  int? get unseenNotificationsCount => _unseenNotificationsCount;
  int? get leagueId => _leagueId;
  String? get firstName => _firstName;
  dynamic get club => _club;
  int? get ageGroupId => _ageGroupId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['team'] = _team;
    map['thumbnail'] = _thumbnail;
    map['account_status'] = _accountStatus;
    map['league_progress'] = _leagueProgress;
    map['dominant_foot'] = _dominantFoot;
    if (_country != null) {
      map['country'] = _country?.toJson();
    }
    map['player_role_name'] = _playerRoleName;
    map['access_level'] = _accessLevel;
    map['is_anonymous'] = _isAnonymous;
    map['score'] = _score;
    map['last_name'] = _lastName;
    map['locale'] = _locale;
    map['type'] = _type;
    map['unread_results_count'] = _unreadResultsCount;
    map['id'] = _id;
    map['gender'] = _gender;
    map['use_imperial_units'] = _useImperialUnits;
    map['unique_identifier'] = _uniqueIdentifier;
    map['birthdate'] = _birthdate;
    map['height'] = _height;
    map['external_access_level'] = _externalAccessLevel;
    map['unseen_notifications_count'] = _unseenNotificationsCount;
    map['league_id'] = _leagueId;
    map['first_name'] = _firstName;
    map['club'] = _club;
    map['age_group_id'] = _ageGroupId;
    return map;
  }

}

class Country {
  Country({
      String? countryCode, 
      int? id, 
      String? iso, 
      String? flag, 
      String? name,}){
    _countryCode = countryCode;
    _id = id;
    _iso = iso;
    _flag = flag;
    _name = name;
}

  Country.fromJson(dynamic json) {
    _countryCode = json['country_code'];
    _id = json['id'];
    _iso = json['iso'];
    _flag = json['flag'];
    _name = json['name'];
  }
  String? _countryCode;
  int? _id;
  String? _iso;
  String? _flag;
  String? _name;

  String? get countryCode => _countryCode;
  int? get id => _id;
  String? get iso => _iso;
  String? get flag => _flag;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_code'] = _countryCode;
    map['id'] = _id;
    map['iso'] = _iso;
    map['flag'] = _flag;
    map['name'] = _name;
    return map;
  }

}