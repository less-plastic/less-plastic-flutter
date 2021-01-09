class Step {
  final StepType type;
  final String text;
  final String id;
  List<Step> options;

  Step({this.type, this.text, this.id, this.options});

  factory Step.fromJson(Map<String, dynamic> json) {
    StepType stepType;
    switch (json['type']) {
      case "selection":
        stepType = StepType.selection;
        break;
      default:
        stepType = StepType.undefined;
        break;
    }

    List<Step> options = [];
    if (json['options'] != null) {
      json['options'].forEach((jsonMap) => options.add(Step.fromJson(jsonMap)));
    }
    return Step(
        type: stepType, text: json['text'], id: json['id'], options: options);
  }
}

enum StepType { selection, undefined }
