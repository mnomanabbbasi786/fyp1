class SkinConditionPrediction {
  final bool success;
  final String message;
  final String id;
  final List<Prediction> predictions;

  SkinConditionPrediction({
    required this.success,
    required this.message,
    required this.id,
    required this.predictions,
  });

  factory SkinConditionPrediction.fromJson(Map<String, dynamic> json) {
    return SkinConditionPrediction(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      id: json['id'] ?? '',
      predictions: (json['predictions'] as List<dynamic>?)
              ?.map((prediction) => Prediction.fromJson(prediction))
              .toList() ??
          [],
    );
  }
}

class Prediction {
  final double confidence;
  final String icd;
  final String name;
  final String classificationId;
  final String readMoreUrl;

  Prediction({
    required this.confidence,
    required this.icd,
    required this.name,
    required this.classificationId,
    required this.readMoreUrl,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      confidence: json['confidence'] ?? 0.0,
      icd: json['icd'] ?? '',
      name: json['name'] ?? '',
      classificationId: json['classificationId'] ?? '',
      readMoreUrl: json['readMoreUrl'] ?? '',
    );
  }
}
