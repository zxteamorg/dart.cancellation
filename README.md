# ZXTeam's Cancellation
[![pub package](https://img.shields.io/pub/v/cancellation.svg)](https://pub.dev/packages/cancellation)
[![build status](https://travis-ci.org/zxteamorg/cancellation.svg?branch=master)](https://travis-ci.org/zxteamorg/cancellation)
[![commit activity badge](https://img.shields.io/github/commit-activity/m/zxteamorg/dart.cancellation)](https://github.com/zxteamorg/dart.cancellation/pulse)
[![last commit badge](https://img.shields.io/github/last-commit/zxteamorg/dart.cancellation)](https://github.com/zxteamorg/dart.cancellation/graphs/commit-activity)
[![twitter badge](https://img.shields.io/twitter/follow/zxteamorg?style=social&logo=twitter)](https://twitter.com/zxteamorg)

## Classes
### CancellationToken
### CancellationTokenSource
### SimpleCancellationTokenSource
### TimeoutCancellationTokenSource


## Usage

A simple usage example:

```dart
import 'package:cancellation/cancellation.dart';

main() {
  final cts = SimpleCancellationTokenSource();

  final CancellationToken token = cts.token;

  // pass token to any cancallable function
}
```

## Features and bugs
TBD
