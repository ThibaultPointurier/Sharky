import 'package:mineral/core.dart';

import 'commands/setup.dart';
import 'events/autorole_interaction.dart';

void main () async {
  Kernel kernel = Kernel()
    ..intents.defined(all: true)
    ..commands.register([new Setup()])
    ..events.register([new AutoroleInteraction()])
    ..modules.register([])
    ..contextMenus.register([]);

  await kernel.init();
}
