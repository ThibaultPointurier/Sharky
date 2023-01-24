import 'package:mineral/core/events.dart';
import 'package:mineral/core/extras.dart';
import 'package:mineral/framework.dart';

class PlateformeInteraction extends MineralEvent<ButtonCreateEvent> with MineralContext {

  Future<void> handle(ButtonCreateEvent event) async {
    //pc
    if (event.interaction.customId == 'pc') {
      final pc = event.interaction.member?.roles.cache.containsKey(environment.get('ROLE_PC'));
      if (pc == true) {
        event.interaction.member?.roles.remove(environment.get('ROLE_PC'));
        event.interaction.reply(
          content: 'Le rôle Pc vous a été retiré',
          private: true);
        return;
      }
      await event.interaction.member?.roles.add(environment.get('ROLE_PC'));
      await event.interaction.reply(
          content: 'Le rôle Pc vous a été attribué', private: true);
    }

    //ps4
    if (event.interaction.customId == 'ps4') {
      final pc = event.interaction.member?.roles.cache.containsKey(environment.get('ROLE_PS4'));
      if (pc == true) {
        event.interaction.member?.roles.remove(environment.get('ROLE_PS4'));
        event.interaction.reply(
            content: 'Le rôle Playstation vous a été retiré',
            private: true);
        return;
      }
      await event.interaction.member?.roles.add(environment.get('ROLE_PS4'));
      await event.interaction.reply(
          content: 'Le rôle Playstation vous a été attribué', private: true);
    }

    // Xbox
    if (event.interaction.customId == 'xbox') {
      final pc = event.interaction.member?.roles.cache.containsKey(environment.get('ROLE_XBOX'));
      if (pc == true) {
        event.interaction.member?.roles.remove(environment.get('ROLE_XBOX'));
        event.interaction.reply(
            content: 'Le rôle Xbox vous a été retiré',
            private: true);
        return;
      }
      await event.interaction.member?.roles.add(environment.get('ROLE_XBOX'));
      await event.interaction.reply(
          content: 'Le rôle Xbox vous a été attribué', private: true);
    }

    // Switch
    if (event.interaction.customId == 'nintendo') {
      final pc = event.interaction.member?.roles.cache.containsKey(environment.get('ROLE_SWITCH'));
      if (pc == true) {
        event.interaction.member?.roles.remove(environment.get('ROLE_SWITCH'));
        event.interaction.reply(
            content: 'Le rôle nintendo switch vous a été retiré',
            private: true);
        return;
      }
      await event.interaction.member?.roles.add(environment.get('ROLE_SWITCH'));
      await event.interaction.reply(
          content: 'Le rôle nintendo switch vous a été attribué', private: true);
    }
  }
}