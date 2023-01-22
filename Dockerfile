FROM dart:stable

WORKDIR /app
COPY ./pubspec.* ./
RUN dart pub get

COPY . ./
RUN dart pub get --offline

CMD ["dart", "src/main.dart"]