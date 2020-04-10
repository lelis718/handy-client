import 'package:handyclientapp/model/help_info.dart';

abstract class HelpService {
  Future<List<HelpInfo>> listHelpInfo();
}

class HelpServiceDefault extends HelpService {
  
  @override
  Future<List<HelpInfo>> listHelpInfo() async {
    return new List();
  }
}
