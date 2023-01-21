import 'package:mineral/core/events.dart';
import 'package:mineral/core/extras.dart';
import 'package:mineral/framework.dart';

class AutoroleInteraction extends MineralEvent<ButtonCreateEvent> with MineralContext {

  Future<void> handle(ButtonCreateEvent event) async {
    //Role
    final String? roleRocket = environment.get('ROCKET');
    final String? roleCod = environment.get('COD');
    final String? roleMultiGaming = environment.get('MG');

    if (event.interaction.customId == 'rocket') {
      final rocket = event.interaction.member?.roles.cache.containsKey(roleRocket.toString());
      if (rocket == true) {
        event.interaction.member?.roles.remove(roleRocket.toString());
        event.interaction.reply(
            content: 'Le rôle rocket league vous à êtait retiré !',
            private: true);
        return;
      }
      await event.interaction.member?.roles.add(roleRocket.toString());
      await event.interaction.reply(
          content: 'Le rôle rocket league vous à êtait atribué !',
          private: true);
    }

    else if (event.interaction.customId == 'callofduty') {
      final cod = event.interaction.member?.roles.cache.containsKey(roleCod.toString());
      if (cod == true) {
        event.interaction.member?.roles.remove(roleCod.toString());
        event.interaction.reply(
            content: 'Le rôle call of duty vous à êtait retiré !',
            private: true);
        return;
      }
      await event.interaction.member?.roles.add(roleCod.toString());
      await event.interaction.reply(
          content: 'Le rôle call of duty vous à êtait atribué !',
          private: true);
    }

    else if (event.interaction.customId == 'multigame') {
      final multi = event.interaction.member?.roles.cache.containsKey(roleMultiGaming.toString());
      if (multi == true) {
        event.interaction.member?.roles.remove(roleMultiGaming.toString());
        event.interaction.reply(
            content: 'Le rôle multigaming vous à êtait retiré !',
            private: true);
        return;
      }
      await event.interaction.member?.roles.add(roleMultiGaming.toString());
      await event.interaction.reply(
          content: 'Le rôle multigaming vous à êtait atribué !',
          private: true);
    }
  }
}
