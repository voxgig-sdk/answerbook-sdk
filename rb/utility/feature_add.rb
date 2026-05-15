# Answerbook SDK utility: feature_add
module AnswerbookUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
