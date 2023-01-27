import 'package:hive/hive.dart';
import 'package:pharmagy/data/model/appointment_data.dart';

class AppointmentRepository {
  late final Box _appointBox;

  Future<void> init() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(AppointmentDataAdapter());
    }

    _appointBox = await Hive.openBox<AppointmentData>('appointment_box');
  }

  Box get appointBox => _appointBox;
}
