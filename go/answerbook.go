package voxgiganswerbooksdk

import (
	"github.com/voxgig-sdk/answerbook-sdk/go/core"
	"github.com/voxgig-sdk/answerbook-sdk/go/entity"
	"github.com/voxgig-sdk/answerbook-sdk/go/feature"
	_ "github.com/voxgig-sdk/answerbook-sdk/go/utility"
)

// Type aliases preserve external API.
type AnswerbookSDK = core.AnswerbookSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type AnswerbookEntity = core.AnswerbookEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type AnswerbookError = core.AnswerbookError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewBookOfAnswerEntityFunc = func(client *core.AnswerbookSDK, entopts map[string]any) core.AnswerbookEntity {
		return entity.NewBookOfAnswerEntity(client, entopts)
	}
	core.NewGetApiDocEntityFunc = func(client *core.AnswerbookSDK, entopts map[string]any) core.AnswerbookEntity {
		return entity.NewGetApiDocEntity(client, entopts)
	}
	core.NewMarketDataEntityFunc = func(client *core.AnswerbookSDK, entopts map[string]any) core.AnswerbookEntity {
		return entity.NewMarketDataEntity(client, entopts)
	}
	core.NewPoetryOracleEntityFunc = func(client *core.AnswerbookSDK, entopts map[string]any) core.AnswerbookEntity {
		return entity.NewPoetryOracleEntity(client, entopts)
	}
	core.NewToolEntityFunc = func(client *core.AnswerbookSDK, entopts map[string]any) core.AnswerbookEntity {
		return entity.NewToolEntity(client, entopts)
	}
	core.NewWordEntityFunc = func(client *core.AnswerbookSDK, entopts map[string]any) core.AnswerbookEntity {
		return entity.NewWordEntity(client, entopts)
	}
	core.NewWordsLearningEntityFunc = func(client *core.AnswerbookSDK, entopts map[string]any) core.AnswerbookEntity {
		return entity.NewWordsLearningEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewAnswerbookSDK = core.NewAnswerbookSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
