import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyclientapp/services/services.dart';

import '../help_list.dart';

class HelpListBloc extends Bloc<HelpListEvent, HelpListState>{

  final DeviceInfoService deviceInfoService;
  final HelpService helpService;
  HelpListBloc({@required this.deviceInfoService, @required this.helpService});


  @override
  HelpListState get initialState => InitializeState();

  @override
  Stream<HelpListState> mapEventToState(HelpListEvent event) async* {
    if (event is WantToHelpEvent) {
      yield LoadState();
      final userId = (await this.deviceInfoService.getDeviceInfo()).uuid;
      final helpRequests = await helpService.getOtherHelpRequests(userId);
      yield WantToHelpState(helpRequests: helpRequests);
    }
  }

}