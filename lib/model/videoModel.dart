import 'dart:convert';

class Video {
  final String id;
  final String title;
  final String thumb;
  final String channel;
  Video({
    required this.id,
    required this.title,
    required this.thumb,
    required this.channel,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
        id: json['id']['videoId'],
        title: json['snippet']['title'],
        thumb: json["snippet"]["thumbnails"]['high']['url'],
        channel: json["snippet"]['channelTitle']);
  }

  Video copyWith({
    String? id,
    String? title,
    String? thumb,
    String? channel,
  }) {
    return Video(
      id: id ?? this.id,
      title: title ?? this.title,
      thumb: thumb ?? this.thumb,
      channel: channel ?? this.channel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'thumb': thumb,
      'channel': channel,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      id: map['id'],
      title: map['title'],
      thumb: map['thumb'],
      channel: map['channel'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Video(id: $id, title: $title, thumb: $thumb, channel: $channel)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Video &&
        other.id == id &&
        other.title == title &&
        other.thumb == thumb &&
        other.channel == channel;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ thumb.hashCode ^ channel.hashCode;
  }
}
