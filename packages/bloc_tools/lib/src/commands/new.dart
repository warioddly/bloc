import 'package:args/command_runner.dart';
import 'package:bloc_tools/src/commands/command.dart';
import 'package:mason/mason.dart';

/// {@template new_command}
/// `bloc new` command generates components from various built-in templates.
/// {@endtemplate}
class NewCommand extends BlocCommand {
  /// {@template new_command}
  NewCommand({Logger? logger}) : super(logger: logger);

  @override
  String get description => 'Generate new components.';

  @override
  String get name => 'new';

  @override
  int run() {
    final subcommand = results.rest.isNotEmpty ? results.rest.first : '';
    throw UsageException(
      '''Could not find a subcommand named "$subcommand" for "bloc new".''',
      usage,
    );
  }
}
