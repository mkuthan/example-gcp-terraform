import flask
import pytest

from helloworld import main


@pytest.fixture(scope="module")
def app():
    return flask.Flask(__name__)


def test_hello_get(app):
    with app.test_request_context():
        res = main.hello_world(flask.request)
        assert 'Hello World!' in res
