import 'package:flutter/material.dart';

class EventDataModel {
  static const String collectionName = 'EventDataCollection';
  String eventID;
  final String eventTitle;
  final String eventDescription;
  final String eventCategory;
  final String eventImage;
  final DateTime eventDate;
  final TimeOfDay eventTime;
  final bool isFavorite;

  EventDataModel({
    this.eventID = '',
    required this.eventTitle,
    required this.eventDescription,
    required this.eventCategory,
    required this.eventImage,
    required this.eventDate,
    required this.eventTime,
    this.isFavorite = false,
  });

  factory EventDataModel.fromFireStore(Map<String, dynamic> json) {
    return EventDataModel(
      eventID: json['eventID'],
      eventTitle: json['eventTitle'],
      eventDescription: json['eventDescription'],
      eventCategory: json['eventCategory'],
      eventImage: json['eventImage'],
      eventDate: DateTime.fromMillisecondsSinceEpoch(json['eventDate']),
      eventTime: json['eventTime'],
      isFavorite: json['isFavorite'],
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      'eventID': eventID,
      'eventTitle': eventTitle,
      'eventDescription': eventDescription,
      'eventCategory': eventCategory,
      'eventImage': eventImage,
      'eventDate': eventDate.millisecondsSinceEpoch,
      'eventTime': eventTime,
      'isFavorite': isFavorite,
    };
  }
}
