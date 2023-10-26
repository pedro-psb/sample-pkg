from samplepkg.main import foo


def test_main():
    result = foo("world")
    assert result == "Hello world"
