import 'package:mineral/core/extras.dart';
import 'package:mineral/framework.dart';
import 'package:mineral/core/events.dart';

class Ready extends MineralEvent<ReadyEvent> with MineralContext {
  Future<void> handle (event) async {
    final String? roleRocket = environment.get('TEST');
    print(roleRocket);
  }
}