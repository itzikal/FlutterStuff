class VideoResults {
  VideoResults({
      String? message, 
      List<Data>? data, 
      int? code,}){
    _message = message;
    _data = data;
    _code = code;
}

  VideoResults.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _code = json['code'];
  }
  String? _message;
  List<Data>? _data;
  int? _code;

  String? get message => _message;
  List<Data>? get data => _data;
  int? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['code'] = _code;
    return map;
  }

}

class Data {
  Data({
      int? id, 
      String? uuid, 
      String? clientCreatedAt, 
      String? statusUpdatedAt, 
      dynamic videoReject, 
      String? createdAt, 
      int? drillId, 
      List<dynamic>? insights, 
      int? versionId, 
      String? source, 
      int? tournamentId, 
      String? cover, 
      dynamic videoCaption, 
      dynamic result, 
      dynamic score, 
      int? stadiumTypeId, 
      String? status,}){
    _id = id;
    _uuid = uuid;
    _clientCreatedAt = clientCreatedAt;
    _statusUpdatedAt = statusUpdatedAt;
    _videoReject = videoReject;
    _createdAt = createdAt;
    _drillId = drillId;
    _insights = insights;
    _versionId = versionId;
    _source = source;
    _tournamentId = tournamentId;
    _cover = cover;
    _videoCaption = videoCaption;
    _result = result;
    _score = score;
    _stadiumTypeId = stadiumTypeId;
    _status = status;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _clientCreatedAt = json['client_created_at'];
    _statusUpdatedAt = json['status_updated_at'];
    _videoReject = json['video_reject'];
    _createdAt = json['created_at'];
    _drillId = json['drill_id'];
    // if (json['insights'] != null) {
    //   _insights = [];
    //   json['insights'].forEach((v) {
    //     _insights?.add(Dynamic.fromJson(v));
    //   });
    // }
    _versionId = json['version_id'];
    _source = json['source'];
    _tournamentId = json['tournament_id'];
    _cover = json['cover'];
    _videoCaption = json['video_caption'];
    _result = json['result'];
    _score = json['score'];
    _stadiumTypeId = json['stadium_type_id'];
    _status = json['status'];
  }
  int? _id;
  String? _uuid;
  String? _clientCreatedAt;
  String? _statusUpdatedAt;
  dynamic _videoReject;
  String? _createdAt;
  int? _drillId;
  List<dynamic>? _insights;
  int? _versionId;
  String? _source;
  int? _tournamentId;
  String? _cover;
  dynamic _videoCaption;
  dynamic _result;
  dynamic _score;
  int? _stadiumTypeId;
  String? _status;

  int? get id => _id;
  String? get uuid => _uuid;
  String? get clientCreatedAt => _clientCreatedAt;
  String? get statusUpdatedAt => _statusUpdatedAt;
  dynamic get videoReject => _videoReject;
  String? get createdAt => _createdAt;
  int? get drillId => _drillId;
  List<dynamic>? get insights => _insights;
  int? get versionId => _versionId;
  String? get source => _source;
  int? get tournamentId => _tournamentId;
  String? get cover => _cover;
  dynamic get videoCaption => _videoCaption;
  dynamic get result => _result;
  dynamic get score => _score;
  int? get stadiumTypeId => _stadiumTypeId;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['client_created_at'] = _clientCreatedAt;
    map['status_updated_at'] = _statusUpdatedAt;
    map['video_reject'] = _videoReject;
    map['created_at'] = _createdAt;
    map['drill_id'] = _drillId;
    if (_insights != null) {
      map['insights'] = _insights?.map((v) => v.toJson()).toList();
    }
    map['version_id'] = _versionId;
    map['source'] = _source;
    map['tournament_id'] = _tournamentId;
    map['cover'] = _cover;
    map['video_caption'] = _videoCaption;
    map['result'] = _result;
    map['score'] = _score;
    map['stadium_type_id'] = _stadiumTypeId;
    map['status'] = _status;
    return map;
  }

}