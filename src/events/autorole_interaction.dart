import 'package:mineral/core/events.dart';
import 'package:mineral/core/extras.dart';
import 'package:mineral/framework.dart';

class AutoroleInteraction extends MineralEvent<ButtonCreateEvent> with MineralContext {

  Future<void> handle(ButtonCreateEvent event) async {
    if (event.interaction.customId == 'rocket') {
      final rocket = event.interaction.member?.roles.cache.containsKey(environment.get('ROLE_ROCKET'));
      if (rocket == true) {
        event.interaction.member?.roles.remove(environment.get('ROLE_ROCKET'));
        event.interaction.reply(
            content: 'Le rôle rocket league vous a été retiré !',
            private: true);
        return;
      }
      await event.interaction.member?.roles.add(environment.get('ROLE_ROCKET'));
      await event.interaction.reply(
          content: 'Le rôle rocket league vous a été attribué',
          private: true);
    }

    else if (event.interaction.customId == 'callofduty') {
      final cod = event.interaction.member?.roles.cache.containsKey(environment.get('ROLE_COD'));
      if (cod == true) {
        event.interaction.member?.roles.remove(environment.get('ROLE_COD'));
        event.interaction.reply(
            content: 'Le rôle call of duty vous a été retiré !',
            private: true);
        return;
      }
      await event.interaction.member?.roles.add(environment.get('ROLE_COD'));
      await event.interaction.reply(
          content: 'Le rôle call of duty vous a été attribué !',
          private: true);
    }

    else if (event.interaction.customId == 'multigame') {
      final multi = event.interaction.member?.roles.cache.containsKey(environment.get('ROLE_MG'));
      if (multi == true) {
        event.interaction.member?.roles.remove(environment.get('ROLE_MG'));
        event.interaction.reply(
            content: 'Le rôle multigaming vous a été retiré !',
            private: true);
        return;
      }
      await event.interaction.member?.roles.add(environment.get('ROLE_MG'));
      await event.interaction.reply(
          content: 'Le rôle multigaming vous a été attribué !',
          private: true);
    }
  }
}
