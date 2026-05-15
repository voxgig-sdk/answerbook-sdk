package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewBookOfAnswerEntityFunc func(client *AnswerbookSDK, entopts map[string]any) AnswerbookEntity

var NewGetApiDocEntityFunc func(client *AnswerbookSDK, entopts map[string]any) AnswerbookEntity

var NewMarketDataEntityFunc func(client *AnswerbookSDK, entopts map[string]any) AnswerbookEntity

var NewPoetryOracleEntityFunc func(client *AnswerbookSDK, entopts map[string]any) AnswerbookEntity

var NewToolEntityFunc func(client *AnswerbookSDK, entopts map[string]any) AnswerbookEntity

var NewWordEntityFunc func(client *AnswerbookSDK, entopts map[string]any) AnswerbookEntity

var NewWordsLearningEntityFunc func(client *AnswerbookSDK, entopts map[string]any) AnswerbookEntity

