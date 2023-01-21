import 'package:mineral/core/builders.dart';
import 'package:mineral/core/extras.dart';
import 'package:mineral/framework.dart';
import 'package:mineral/core/api.dart';

class Setup extends MineralCommand with MineralContext {
  Setup() {
    final autorole = SubCommandBuilder('role', 'permet de mettre en place le system de role', executeRole);
    final platforme = SubCommandBuilder('platforme', 'permet de mettre en place le system de platforme', executePlatforme);

    final command = CommandBuilder('setup', 'Permet de mettre en place plusieurs systeme')
      ..addSubcommand(autorole)
      ..addSubcommand(platforme);

    register(command);
  }

  Future<void> executeRole(CommandInteraction interaction) async {
    final String? autorole = environment.get('AUTO_ROLE');
    final channel = await interaction.guild?.channels.cache.get(
        autorole) as TextChannel;

    final button = [
      ButtonBuilder.fromButton(customId: 'rocket', style: ButtonStyle.primary, label: 'Rocket', emoji: EmojiBuilder.fromUnicode('🚀')),
      ButtonBuilder.fromButton(customId: 'callofduty', style: ButtonStyle.primary, label: 'Call of Duty', emoji: EmojiBuilder.fromUnicode('🔫')),
      ButtonBuilder.fromButton(customId: 'multigame', style: ButtonStyle.primary, label: 'MultiGaming', emoji: EmojiBuilder.fromUnicode('🎯')),
    ];

    final embed = new EmbedBuilder()
      ..title = 'Hello !'
      ..description = 'Nous avons mis en place un nouveau système de rôle !\n\nPour avoir accès à un rôle, il vous suffit de cliquer sur la réaction correspondante à ce rôle.\n\nVous pouvez également vous désabonner en cliquant sur la réaction en dessous du rôle que vous avez choisi.\n\nVous pouvez également choisir plusieurs rôles !  \n\nSi vous avez des questions, n\'hésitez pas à contacter un membre du staff !\n'
      ..color = Color.cyan_500
      ..timestamp = DateTime.now()
      ..footer = new Footer(text: 'Sharky',
          iconUrl: 'https://media.discordapp.net/attachments/1064218547368239144/1064254421267120289/unknown.png?width=671&height=671');

    await channel.send(embeds: [embed], components: [RowBuilder.fromComponents(button)]);
    await interaction.reply(content: 'Le systeme de role a etait mis en place', private: true);
  }

  Future<void> executePlatforme(CommandInteraction interaction) async {
    final String? platforme = environment.get('PLATFORME');
    final channel = await interaction.guild?.channels.cache.get(
        platforme) as TextChannel;

    final button = [
      ButtonBuilder.fromButton(customId: 'pc', style: ButtonStyle.primary, label: 'PC', emoji: EmojiBuilder.fromUnicode('💻')),
      ButtonBuilder.fromButton(customId: 'ps4', style: ButtonStyle.primary, label: 'PS4', emoji: EmojiBuilder.fromUnicode('🎮')),
      ButtonBuilder.fromButton(customId: 'xbox', style: ButtonStyle.primary, label: 'XBOX', emoji: EmojiBuilder.fromUnicode('🎮')),
      ButtonBuilder.fromButton(customId: 'nintendo', style: ButtonStyle.primary, label: 'Nintendo Switch', emoji: EmojiBuilder.fromUnicode('🎮')),
    ];

    final embed = new EmbedBuilder()
      ..title = 'Hello !'
      ..description = ''
      ..color = Color.cyan_500
      ..timestamp = DateTime.now()
      ..footer = new Footer(text: 'Sharky',
          iconUrl: 'https://media.discordapp.net/attachments/1064218547368239144/1064254421267120289/unknown.png?width=671&height=671');

    await channel.send(embeds: [embed], components: [RowBuilder.fromComponents(button)]);
    await interaction.reply(content: 'Le systeme de platforme a etait mis en place', private: true);
  }
}