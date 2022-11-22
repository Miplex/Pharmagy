import 'package:get_it/get_it.dart';
import 'package:pharmagy/data/services/appointment_data_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AppointmentDataService());
}
