import 'package:equatable/equatable.dart';

import '../help_list.dart';

abstract class HelpListState extends Equatable{
  const HelpListState();
}
class InitializeState extends HelpListState{
  @override
  List<Object> get props => null;
}
class LoadState extends HelpListState{
  @override
  List<Object> get props => null;
}

class WantToHelpState extends HelpListState{
  final List<Help> helpRequests;

  WantToHelpState({this.helpRequests});
  @override
  List<Object> get props => [helpRequests];
}

