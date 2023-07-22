/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Question type in your schema. */
class Question extends amplify_core.Model {
  static const classType = const _QuestionModelType();
  final String id;
  final String? _Text;
  final List<QuestionAnswer>? _Answers;
  final Answer? _AcceptedAns;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _questionAcceptedAnsId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  QuestionModelIdentifier get modelIdentifier {
      return QuestionModelIdentifier(
        id: id
      );
  }
  
  String? get Text {
    return _Text;
  }
  
  List<QuestionAnswer>? get Answers {
    return _Answers;
  }
  
  Answer? get AcceptedAns {
    return _AcceptedAns;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get questionAcceptedAnsId {
    return _questionAcceptedAnsId;
  }
  
  const Question._internal({required this.id, Text, Answers, AcceptedAns, createdAt, updatedAt, questionAcceptedAnsId}): _Text = Text, _Answers = Answers, _AcceptedAns = AcceptedAns, _createdAt = createdAt, _updatedAt = updatedAt, _questionAcceptedAnsId = questionAcceptedAnsId;
  
  factory Question({String? id, String? Text, List<QuestionAnswer>? Answers, Answer? AcceptedAns, String? questionAcceptedAnsId}) {
    return Question._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      Text: Text,
      Answers: Answers != null ? List<QuestionAnswer>.unmodifiable(Answers) : Answers,
      AcceptedAns: AcceptedAns,
      questionAcceptedAnsId: questionAcceptedAnsId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Question &&
      id == other.id &&
      _Text == other._Text &&
      DeepCollectionEquality().equals(_Answers, other._Answers) &&
      _AcceptedAns == other._AcceptedAns &&
      _questionAcceptedAnsId == other._questionAcceptedAnsId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Question {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("Text=" + "$_Text" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("questionAcceptedAnsId=" + "$_questionAcceptedAnsId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Question copyWith({String? Text, List<QuestionAnswer>? Answers, Answer? AcceptedAns, String? questionAcceptedAnsId}) {
    return Question._internal(
      id: id,
      Text: Text ?? this.Text,
      Answers: Answers ?? this.Answers,
      AcceptedAns: AcceptedAns ?? this.AcceptedAns,
      questionAcceptedAnsId: questionAcceptedAnsId ?? this.questionAcceptedAnsId);
  }
  
  Question copyWithModelFieldValues({
    ModelFieldValue<String?>? Text,
    ModelFieldValue<List<QuestionAnswer>?>? Answers,
    ModelFieldValue<Answer?>? AcceptedAns,
    ModelFieldValue<String?>? questionAcceptedAnsId
  }) {
    return Question._internal(
      id: id,
      Text: Text == null ? this.Text : Text.value,
      Answers: Answers == null ? this.Answers : Answers.value,
      AcceptedAns: AcceptedAns == null ? this.AcceptedAns : AcceptedAns.value,
      questionAcceptedAnsId: questionAcceptedAnsId == null ? this.questionAcceptedAnsId : questionAcceptedAnsId.value
    );
  }
  
  Question.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _Text = json['Text'],
      _Answers = json['Answers'] is List
        ? (json['Answers'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => QuestionAnswer.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _AcceptedAns = json['AcceptedAns']?['serializedData'] != null
        ? Answer.fromJson(new Map<String, dynamic>.from(json['AcceptedAns']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _questionAcceptedAnsId = json['questionAcceptedAnsId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'Text': _Text, 'Answers': _Answers?.map((QuestionAnswer? e) => e?.toJson()).toList(), 'AcceptedAns': _AcceptedAns?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'questionAcceptedAnsId': _questionAcceptedAnsId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'Text': _Text,
    'Answers': _Answers,
    'AcceptedAns': _AcceptedAns,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'questionAcceptedAnsId': _questionAcceptedAnsId
  };

  static final amplify_core.QueryModelIdentifier<QuestionModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<QuestionModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TEXT = amplify_core.QueryField(fieldName: "Text");
  static final ANSWERS = amplify_core.QueryField(
    fieldName: "Answers",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'QuestionAnswer'));
  static final ACCEPTEDANS = amplify_core.QueryField(
    fieldName: "AcceptedAns",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Answer'));
  static final QUESTIONACCEPTEDANSID = amplify_core.QueryField(fieldName: "questionAcceptedAnsId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Question";
    modelSchemaDefinition.pluralName = "Questions";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.TEXT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Question.ANSWERS,
      isRequired: false,
      ofModelName: 'QuestionAnswer',
      associatedKey: QuestionAnswer.QUESTION
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Question.ACCEPTEDANS,
      isRequired: false,
      ofModelName: 'Answer',
      associatedKey: Answer.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.QUESTIONACCEPTEDANSID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _QuestionModelType extends amplify_core.ModelType<Question> {
  const _QuestionModelType();
  
  @override
  Question fromJson(Map<String, dynamic> jsonData) {
    return Question.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Question';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Question] in your schema.
 */
class QuestionModelIdentifier implements amplify_core.ModelIdentifier<Question> {
  final String id;

  /** Create an instance of QuestionModelIdentifier using [id] the primary key. */
  const QuestionModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'QuestionModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is QuestionModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}