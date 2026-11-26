
% ==============================================
% MediGuide: A Simple Health Information System
% File: rules.pl
% Purpose: Core Prolog reasoning engine
% Issue: #1
% ==============================================

:- module(rules, [
    match_symptom_lists/3,
    match_count/3,
    score_topic/3,
    rank_topics/3
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

% ==============================================
% 3. Health Topic Scoring
% ==============================================

score_topic(
    UserSymptoms,
    topic(Name, TopicSymptoms),
    result(Name, Matches, Count)
) :-
    sort(UserSymptoms, UniqueSymptoms),
    match_symptom_lists(
        UniqueSymptoms,
        TopicSymptoms,
        Matches
    ),
    length(Matches, Count),
    Count > 0.

% ==============================================
% 4. Health Topic Ranking
% ==============================================

rank_topics(UserSymptoms, Topics, RankedResults) :-
    findall(
        Key-result(Name, Matches, Count),
        (
            member(Topic, Topics),
            score_topic(
                UserSymptoms,
                Topic,
                result(Name, Matches, Count)
            ),
            Key is -Count
        ),
        Results
    ),
    keysort(Results, SortedResults),
    remove_ranking_keys(
        SortedResults,
        RankedResults
    ).

% Remove temporary sorting keys.

remove_ranking_keys([], []).

remove_ranking_keys(
    [_-Result | Rest],
    [Result | Results]
) :-
    remove_ranking_keys(Rest, Results).
