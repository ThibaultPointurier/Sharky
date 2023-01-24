import 'package:mineral/core/builders.dart';
import 'package:mineral/core/extras.dart';
import 'package:mineral/framework.dart';
import 'package:mineral/core/api.dart';

class Setup extends MineralCommand with MineralContext {
  Setup() {
    final autorole = SubCommandBuilder(
        'role', 'permet de mettre en place le system de role', executeRole);
    final platforme = SubCommandBuilder('platforme',
        'permet de mettre en place le system de platforme', executePlatforme);

    final command =
        CommandBuilder('setup', 'Permet de mettre en place plusieurs systeme')
          ..addSubcommand(autorole)
          ..addSubcommand(platforme);

    register(command);
  }

  Future<void> executeRole(CommandInteraction interaction) async {
    final channel =
        await interaction.guild?.channels.cache.get(environment.get('CHANNEL_AUTO_ROLE')) as TextChannel;

    final button = [
      ButtonBuilder.fromButton(
          customId: 'rocket',
          style: ButtonStyle.primary,
          label: 'Rocket',
          emoji: EmojiBuilder.fromUnicode('🚀')),
      ButtonBuilder.fromButton(
          customId: 'callofduty',
          style: ButtonStyle.primary,
          label: 'Call of Duty',
          emoji: EmojiBuilder.fromUnicode('🔫')),
      ButtonBuilder.fromButton(
          customId: 'multigame',
          style: ButtonStyle.primary,
          label: 'MultiGaming',
          emoji: EmojiBuilder.fromUnicode('🎯')),
    ];

    final embed = new EmbedBuilder()
      ..title = 'Hello !'
      ..description =
          'Nous avons mis en place un nouveau système de rôle !\n\nPour avoir accès à un rôle, il vous suffit de cliquer sur la réaction correspondant à ce rôle.\n\nVous pouvez également vous désabonner en cliquant sur la réaction en dessous du rôle que vous avez choisi.\n\nVous pouvez également choisir plusieurs rôles !  \n\nSi vous avez des questions, n\'hésitez pas à contacter un membre du staff !\n'
      ..color = Color.cyan_500
      ..timestamp = DateTime.now()
      ..footer = new Footer(
          text: 'Sharky',
          iconUrl:
              'https://media.discordapp.net/attachments/1064218547368239144/1064254421267120289/unknown.png?width=671&height=671');

    await channel
        .send(embeds: [embed], components: [RowBuilder.fromComponents(button)]);
    await interaction.reply(
        content: 'Le systeme de role a etait mis en place', private: true);
  }

  Future<void> executePlatforme(CommandInteraction interaction) async {
    final channel = await interaction.guild?.channels.cache.get(environment.get('CHANNEL_PLATEFORME')) as TextChannel;
    
    final ps4_emoji = await interaction.guild?.emojis.cache.get(environment.get('EMOJI_PS4')) as Emoji;
    final xbox_emoji = await interaction.guild?.emojis.cache.get(environment.get('EMOJI_XBOX')) as Emoji;
    final switch_emoji = await interaction.guild?.emojis.cache.get(environment.get('EMOJI_SWITCH')) as Emoji;

    final button = [
      ButtonBuilder.fromButton(
          customId: 'pc',
          style: ButtonStyle.primary,
          label: 'PC',
          emoji: EmojiBuilder.fromUnicode('💻')),
      ButtonBuilder.fromButton(
          customId: 'ps4',
          style: ButtonStyle.primary,
          label: 'Playstation',
          emoji: EmojiBuilder.fromEmoji(ps4_emoji)),
      ButtonBuilder.fromButton(
          customId: 'xbox',
          style: ButtonStyle.primary,
          label: 'XBOX',
          emoji: EmojiBuilder.fromEmoji(xbox_emoji)),
      ButtonBuilder.fromButton(
          customId: 'nintendo',
          style: ButtonStyle.primary,
          label: 'Nintendo Switch',
          emoji: EmojiBuilder.fromEmoji(switch_emoji)),
    ];

    final embed = new EmbedBuilder()
      ..title = 'Hello !'
      ..description = 'Merci de sélectionnez la plate-forme de jeux : '
      ..color = Color.cyan_500
      ..timestamp = DateTime.now()
      ..footer = new Footer(
          text: 'Sharky',
          iconUrl:
              'https://media.discordapp.net/attachments/1064218547368239144/1064254421267120289/unknown.png?width=671&height=671');

    await channel
        .send(embeds: [embed], components: [RowBuilder.fromComponents(button)]);
    await interaction.reply(
        content: 'Le systeme de platforme a etait mis en place', private: true);
  }
}
