import 'package:analyzer/error/error.dart' show ErrorSeverity;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class AvoidDesignSystem extends DartLintRule {
  static const forbidden = {
    'Text': 'TextCustom',
    'RaisedButton': 'ButtonPrimary',
  };

  AvoidDesignSystem()
    : super(
        code: LintCode(
          name: 'avoid_text_widget', // Identificador único
          problemMessage:
              'Evita usar {0} directamente, usa {1} del design system.',
          errorSeverity: ErrorSeverity.WARNING,
        ),
      );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    // Detecta cualquier creación de instancia
    context.registry.addInstanceCreationExpression((node) {
      final constructorName = node.constructorName.type.element?.name;

      if (constructorName == 'Text' || constructorName == "Center") {
        // Reporta un warning en la línea donde se usó Text
        reporter.atNode(
          node,
          code,
          arguments: [constructorName!, forbidden[constructorName]!],
        );
      }
    });
  }
}
