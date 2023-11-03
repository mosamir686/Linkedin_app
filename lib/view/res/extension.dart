import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../data/api.dart';

extension Padding on num {
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );

  SizedBox get pw => SizedBox(
        width: toDouble(),
      );
}

extension Margin on num {
  SizedBox get mh => SizedBox(
        height: toDouble(),
      );

  SizedBox get mw => SizedBox(
        width: toDouble(),
      );
}

extension Http on Response {
  Map<String, String> status() {
    if (statusCode == 200) {
      return {"status": ApiStatus.success.name, "data": body};
    } else {
      return {"status": ApiStatus.fail.name, "data": body};
    }
  }
}

extension Error on Object {
  Map<String, String> message() =>
      {"status": ApiStatus.fail.name, "data": toString()};
}
