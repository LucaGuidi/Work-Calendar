import 'package:logger/logger.dart';
import 'package:work_calendar/core/api/models/api.dart';
import 'package:work_calendar/core/api/models/backend.dart';
import 'package:work_calendar/core/configuration/configuration.dart';
import 'package:work_calendar/core/configuration/version.dart';

final localConfigDev = Configuration(
  logLevel: Level.info,
  versioning: [
    Version(
      platform: VersionPlatform.iOS,
      lastVersion: "0.0.1",
      isMandatoryUpdate: true,
      storeLink: '',
    ),
    Version(
      platform: VersionPlatform.android,
      lastVersion: "0.0.1",
      isMandatoryUpdate: true,
      storeLink: '',
    ),
  ],
  backed: Backend(
    baseUrl: 'http://192.168.1.2:3000',
    api: [
      Api(
        name: 'getDays',
        method: 'GET',
        url: '/days',
      ),
    ],
  ),
);
