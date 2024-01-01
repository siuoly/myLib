import pytest
def f():
    raise SystemExit(1)
def test_ex():
    with pytest.raises(SystemExit):
        f()
