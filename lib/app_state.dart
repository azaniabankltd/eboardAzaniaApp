import 'package:flutter/material.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  dynamic _userDetails;
  dynamic get userDetails => _userDetails;
  set userDetails(dynamic value) {
    _userDetails = value;
  }

  dynamic _userCometee;
  dynamic get userCometee => _userCometee;
  set userCometee(dynamic value) {
    _userCometee = value;
  }

  List<dynamic> _commeteeList = [];
  List<dynamic> get commeteeList => _commeteeList;
  set commeteeList(List<dynamic> value) {
    _commeteeList = value;
  }

  void addToCommeteeList(dynamic value) {
    commeteeList.add(value);
  }

  void removeFromCommeteeList(dynamic value) {
    commeteeList.remove(value);
  }

  void removeAtIndexFromCommeteeList(int index) {
    commeteeList.removeAt(index);
  }

  void updateCommeteeListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    commeteeList[index] = updateFn(_commeteeList[index]);
  }

  void insertAtIndexInCommeteeList(int index, dynamic value) {
    commeteeList.insert(index, value);
  }

  List<dynamic> _eventsPost = [];
  List<dynamic> get eventsPost => _eventsPost;
  set eventsPost(List<dynamic> value) {
    _eventsPost = value;
  }

  void addToEventsPost(dynamic value) {
    eventsPost.add(value);
  }

  void removeFromEventsPost(dynamic value) {
    eventsPost.remove(value);
  }

  void removeAtIndexFromEventsPost(int index) {
    eventsPost.removeAt(index);
  }

  void updateEventsPostAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    eventsPost[index] = updateFn(_eventsPost[index]);
  }

  void insertAtIndexInEventsPost(int index, dynamic value) {
    eventsPost.insert(index, value);
  }

  String _folderName = '';
  String get folderName => _folderName;
  set folderName(String value) {
    _folderName = value;
  }
}
