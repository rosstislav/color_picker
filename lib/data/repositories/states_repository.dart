import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:solid_software_test_project/data/models/state_model/state_model.dart';
import 'package:solid_software_test_project/generated/assets.dart';

class StatesRepository {
  final String _baseUrl = Assets.assetsUsStates;

  Future<List<StateModel>> getStates() async {
    final response = await rootBundle.loadString(_baseUrl);
    final list = json.decode(response) as List<dynamic>;

    return list.map((state) => StateModel.fromJson(state)).toList();
  }
}
