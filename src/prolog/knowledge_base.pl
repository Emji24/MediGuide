
% ==============================================
% MediGuide: A Simple Health Information System
% File: knowledge_base.pl
% Purpose: Store health information and facts
% ==============================================

:- module(knowledge_base, [
    symptom/1,
    health_topic/2,
    topic_information/3,
    warning_sign/1
]).

% ==============================================
% SECTION 1: Recognized Symptoms
% ==============================================

symptom(fever).
symptom(headache).
symptom(cough).
symptom(runny_nose).
symptom(sore_throat).
symptom(fatigue).
symptom(dizziness).
symptom(nausea).
symptom(vomiting).
symptom(diarrhea).
symptom(body_pain).
symptom(stomach_pain).
symptom(sneezing).
symptom(itchy_eyes).
symptom(nasal_congestion).
symptom(chest_pain).
symptom(difficulty_breathing).
symptom(loss_of_consciousness).
symptom(uncontrolled_bleeding).
symptom(severe_abdominal_pain).
symptom(sudden_severe_headache).

% ==============================================
% SECTION 2: Health Topic Associations
% ==============================================

health_topic(respiratory_health, [
    cough,
    runny_nose,
    sore_throat,
    nasal_congestion
]).

health_topic(fever_and_body_aches, [
    fever,
    headache,
    body_pain,
    fatigue
]).

health_topic(digestive_health, [
    nausea,
    vomiting,
    diarrhea,
    stomach_pain
]).

health_topic(allergy_information, [
    sneezing,
    runny_nose,
    itchy_eyes,
    nasal_congestion
]).

health_topic(headache_information, [
    headache,
    nausea
]).

health_topic(fatigue_information, [
    fatigue,
    dizziness
]).

% ==============================================
% SECTION 3: General Health Information
% ==============================================

% Format:
% topic_information(Topic, Description, Guidance).

topic_information(
    respiratory_health,
    'Information about symptoms affecting the nose, throat and airways.',
    'Consult a healthcare professional if symptoms persist or worsen.'
).

topic_information(
    fever_and_body_aches,
    'Information about fever, tiredness and body discomfort.',
    'Monitor your symptoms and seek professional medical advice when concerned.'
).

topic_information(
    digestive_health,
    'Information about symptoms affecting the digestive system.',
    'Seek medical advice, especially if symptoms are persistent or severe.'
).

topic_information(
    allergy_information,
    'Information about symptoms that may occur with allergies.',
    'Discuss possible triggers and appropriate care with a healthcare professional.'
).

topic_information(
    headache_information,
    'Headaches can occur for many different reasons.',
    'Seek medical advice for persistent, recurrent or concerning headaches.'
).

topic_information(
    fatigue_information,
    'Fatigue and dizziness can have different underlying causes.',
    'Consult a healthcare professional if symptoms persist or affect daily activities.'
).

% ==============================================
% SECTION 4: Emergency Warning Signs
% ==============================================

warning_sign(chest_pain).
warning_sign(difficulty_breathing).
warning_sign(loss_of_consciousness).
warning_sign(uncontrolled_bleeding).
warning_sign(severe_abdominal_pain).
warning_sign(sudden_severe_headache).

% ==============================================
% Educational prototype only.
% Topic matches do not establish a diagnosis.
% Absence of listed warning signs does not
% establish that a person is safe.
%
% References:
% https://medlineplus.gov/symptoms.html
% https://medlineplus.gov/ency/article/001927.htm
% ==============================================
