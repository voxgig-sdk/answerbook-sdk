# ProjectName SDK exists test

import pytest
from answerbook_sdk import AnswerbookSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = AnswerbookSDK.test(None, None)
        assert testsdk is not None
