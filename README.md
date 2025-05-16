# Sharky

Sharky is a former Discord bot project developed for an esports team. It automates role management and gaming platform selection on a Discord server, making organization and communication within the community easier.

## Features

- Auto-role system for popular games (Rocket League, Call of Duty, Multigaming)
- Platform selection system (PC, Playstation, Xbox, Nintendo Switch)
- `/setup` command to configure role and platform systems
- Easy integration with Discord using the [mineral](https://github.com/mineral-dart/core) framework

## Installation

```bash
git clone https://github.com/your-username/Sharky.git
cd Sharky
cp .env.example .env
dart pub get
dart run src/main.dart
```

## Usage
Use the `/setup role` command to set up the auto-role system.
Use the `/setup platform` command to set up the platform selection system.
Members can click the generated buttons to assign or remove roles themselves.

## Contribution
Contributions are welcome! Please see the CONTRIBUTING.md file for more information.

License
This project is licensed under the MIT License.

Authors Thibault Pointurier