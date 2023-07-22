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


/** This is an auto generated class representing the Answer type in your schema. */
class Answer extends amplify_core.Model {
  static const classType = const _AnswerModelType();
  final String id;
  final String? _Text;
  final List<QuestionAnswer>? _questions;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  AnswerModelIdentifier get modelIdentifier {
      return AnswerModelIdentifier(
        id: id
      );
  }
  
  String? get Text {
    return _Text;
  }
  
  List<QuestionAnswer>? get questions {
    return _questions;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Answer._internal({required this.id, Text, questions, createdAt, updatedAt}): _Text = Text, _questions = questions, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Answer({String? id, String? Text, List<QuestionAnswer>? questions}) {
    return Answer._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      Text: Text,
      questions: questions != null ? List<QuestionAnswer>.unmodifiable(questions) : questions);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Answer &&
      id == other.id &&
      _Text == other._Text &&
      DeepCollectionEquality().equals(_questions, other._questions);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Answer {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("Text=" + "$_Text" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Answer copyWith({String? Text, List<QuestionAnswer>? questions}) {
    return Answer._internal(
      id: id,
      Text: Text ?? this.Text,
      questions: questions ?? this.questions);
  }
  
  Answer copyWithModelFieldValues({
    ModelFieldValue<String?>? Text,
    ModelFieldValue<List<QuestionAnswer>?>? questions
  }) {
    return Answer._internal(
      id: id,
      Text: Text == null ? this.Text : Text.value,
      questions: questions == null ? this.questions : questions.value
    );
  }
  
  Answer.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _Text = json['Text'],
      _questions = json['questions'] is List
        ? (json['questions'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => QuestionAnswer.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'Text': _Text, 'questions': _questions?.map((QuestionAnswer? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'Text': _Text,
    'questions': _questions,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<AnswerModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<AnswerModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TEXT = amplify_core.QueryField(fieldName: "Text");
  static final QUESTIONS = amplify_core.QueryField(
    fieldName: "questions",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'QuestionAnswer'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Answer";
    modelSchemaDefinition.pluralName = "Answers";
    
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
      key: Answer.TEXT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Answer.QUESTIONS,
      isRequired: false,
      ofModelName: 'QuestionAnswer',
      associatedKey: QuestionAnswer.ANSWER
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
  });
}

class _AnswerModelType extends amplify_core.ModelType<Answer> {
  const _AnswerModelType();
  
  @override
  Answer fromJson(Map<String, dynamic> jsonData) {
    return Answer.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Answer';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Answer] in your schema.
 */
class AnswerModelIdentifier implements amplify_core.ModelIdentifier<Answer> {
  final String id;

  /** Create an instance of AnswerModelIdentifier using [id] the primary key. */
  const AnswerModelIdentifier({
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
  String toString() => 'AnswerModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is AnswerModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}