# OpenHome https://openhome.cc/Gossip/CodeData/PythonTutorial/UnitTestPy3.html
# 知乎 類型解釋 https://zhuanlan.zhihu.com/p/336650009
# https://bayareanotes.com/python-unittest/
import unittest
import coverage

cov = coverage.Coverage()
cov.start()

def add(a, b):
    return a + b

class TestAdd(unittest.TestCase):

    def test_add(self):
        self.assertEqual(add(1, 2), 3)
        self.assertEqual(add(0, 0), 0)

    def test_add_negative(self):
        self.assertEqual(add(-1, -2), -3)
        self.assertEqual(add(-1, 1), 0)

cov.stop()
cov.save()

if __name__ == '__main__':
    cov.html_report()
