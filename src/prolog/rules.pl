
% ==============================================
% MediGuide: A Simple Health Information System
% File: rules.pl
% Purpose: Core Prolog reasoning engine
% Issue: #1
% ==============================================

:- module(rules, [
    match_symptom_lists/3,
    match_count/3
]).

% ==============================================
% 1. Symptom Matching
% ==============================================

% Base case
match_symptom_lists([], _, []).

% Include a matching symptom.
match_symptom_lists(
    [Symptom | Rest],
    TopicSymptoms,
    [Symptom | Matches]
) :-
    memberchk(Symptom, TopicSymptoms),
    match_symptom_lists(Rest, TopicSymptoms, Matches).

% Skip a non-matching symptom.
match_symptom_lists(
    [Symptom | Rest],
    TopicSymptoms,
    Matches
) :-
    \+ memberchk(Symptom, TopicSymptoms),
    match_symptom_lists(Rest, TopicSymptoms, Matches).

% ==============================================
% 2. Count Matching Symptoms
% ==============================================

match_count(UserSymptoms, TopicSymptoms, Count) :-
    sort(UserSymptoms, UniqueSymptoms),
    match_symptom_lists(
        UniqueSymptoms,
        TopicSymptoms,
        Matches
    ),
    length(Matches, Count).
