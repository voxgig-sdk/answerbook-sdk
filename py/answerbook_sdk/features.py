# Answerbook SDK feature factory

from answerbook_sdk.feature.base_feature import AnswerbookBaseFeature
from answerbook_sdk.feature.test_feature import AnswerbookTestFeature


def _make_feature(name):
    features = {
        "base": lambda: AnswerbookBaseFeature(),
        "test": lambda: AnswerbookTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
