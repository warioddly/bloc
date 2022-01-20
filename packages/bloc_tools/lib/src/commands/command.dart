import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:mason/mason.dart';
import 'package:meta/meta.dart';

/// {@template bloc_command}
/// The base class for all bloc executable commands.
/// {@endtemplate}
abstract class BlocCommand extends Command<int> {
  /// {@macro bloc_command}
  BlocCommand({Logger? logger}) : logger = logger ?? Logger();

  /// Logger instance which can be used to write to stdout.
  Logger logger;

  /// [ArgResults] which can be overridden for testing.
  @visibleForTesting
  ArgResults? argResultOverrides;

  /// [ArgResults] for the current command.
  /// See [argResultOverrides] to override [ArgResults]
  /// for testing purposes.
  ArgResults get results => argResultOverrides ?? argResults!;
}
