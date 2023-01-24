import 'package:mineral/core.dart';

import 'commands/setup.dart';
import 'events/autorole_interaction.dart';
import 'events/plateforme_interaction.dart';

void main () async {
  Kernel kernel = Kernel()
    ..intents.defined(all: true)
    ..commands.register([new Setup()])
    ..events.register([new AutoroleInteraction(), new PlateformeInteraction()])
    ..modules.register([])
    ..contextMenus.register([]);

  await kernel.init();
}
