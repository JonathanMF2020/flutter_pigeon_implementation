import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:custom_lint_design_system/src/rules/avoid_design_system.dart';

// Plugin que registra la regla
PluginBase createPlugin() => _AvoidTextWidgetPlugin();

class _AvoidTextWidgetPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) {
    return [AvoidDesignSystem()];
  }
}
