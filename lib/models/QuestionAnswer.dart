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


/** This is an auto generated class representing the QuestionAnswer type in your schema. */
class QuestionAnswer extends amplify_core.Model {
  static const classType = const _QuestionAnswerModelType();
  final String id;
  final Answer? _answer;
  final Question? _question;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  QuestionAnswerModelIdentifier get modelIdentifier {
      return QuestionAnswerModelIdentifier(
        id: id
      );
  }
  
  Answer get answer {
    try {
      return _answer!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Question get question {
    try {
      return _question!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const QuestionAnswer._internal({required this.id, required answer, required question, createdAt, updatedAt}): _answer = answer, _question = question, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory QuestionAnswer({String? id, required Answer answer, required Question question}) {
    return QuestionAnswer._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      answer: answer,
      question: question);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuestionAnswer &&
      id == other.id &&
      _answer == other._answer &&
      _question == other._question;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("QuestionAnswer {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("answer=" + (_answer != null ? _answer!.toString() : "null") + ", ");
    buffer.write("question=" + (_question != null ? _question!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  QuestionAnswer copyWith({Answer? answer, Question? question}) {
    return QuestionAnswer._internal(
      id: id,
      answer: answer ?? this.answer,
      question: question ?? this.question);
  }
  
  QuestionAnswer copyWithModelFieldValues({
    ModelFieldValue<Answer>? answer,
    ModelFieldValue<Question>? question
  }) {
    return QuestionAnswer._internal(
      id: id,
      answer: answer == null ? this.answer : answer.value,
      question: question == null ? this.question : question.value
    );
  }
  
  QuestionAnswer.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _answer = json['answer']?['serializedData'] != null
        ? Answer.fromJson(new Map<String, dynamic>.from(json['answer']['serializedData']))
        : null,
      _question = json['question']?['serializedData'] != null
        ? Question.fromJson(new Map<String, dynamic>.from(json['question']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'answer': _answer?.toJson(), 'question': _question?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'answer': _answer,
    'question': _question,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<QuestionAnswerModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<QuestionAnswerModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final ANSWER = amplify_core.QueryField(
    fieldName: "answer",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Answer'));
  static final QUESTION = amplify_core.QueryField(
    fieldName: "question",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Question'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "QuestionAnswer";
    modelSchemaDefinition.pluralName = "QuestionAnswers";
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["answerId"], name: "byAnswer"),
      amplify_core.ModelIndex(fields: const ["questionId"], name: "byQuestion")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: QuestionAnswer.ANSWER,
      isRequired: true,
      targetNames: ['answerId'],
      ofModelName: 'Answer'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: QuestionAnswer.QUESTION,
      isRequired: true,
      targetNames: ['questionId'],
      ofModelName: 'Question'
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

class _QuestionAnswerModelType extends amplify_core.ModelType<QuestionAnswer> {
  const _QuestionAnswerModelType();
  
  @override
  QuestionAnswer fromJson(Map<String, dynamic> jsonData) {
    return QuestionAnswer.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'QuestionAnswer';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [QuestionAnswer] in your schema.
 */
class QuestionAnswerModelIdentifier implements amplify_core.ModelIdentifier<QuestionAnswer> {
  final String id;

  /** Create an instance of QuestionAnswerModelIdentifier using [id] the primary key. */
  const QuestionAnswerModelIdentifier({
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
  String toString() => 'QuestionAnswerModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is QuestionAnswerModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}