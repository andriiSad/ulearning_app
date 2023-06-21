import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_events.dart';
part 'settings_states.dart';

class SettingsBlocs extends Bloc<SettingsEvents, SettingsStates> {
  SettingsBlocs() : super(const SettingsStates()) {
    on<TriggerSettingsEvent>(_triggerSettings);
  }
  _triggerSettings(TriggerSettingsEvent event, Emitter<SettingsStates> emit) {
    emit(const SettingsStates());
  }
}
