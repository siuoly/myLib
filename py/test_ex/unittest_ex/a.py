#Python unittest Note
import unittest
def add(a,b):
    return a+b

# 1. class, inherit unnittest.TestCase
# 2. method name for unittest
# 3. assertEqual: for expect values
class TestAdd(unittest.TestCase):
    def test_add(self):
        self.assertEqual(add(1,2,),3)
        self.assertEqual(add(0,0,),0)
    def test_x(self):
        self.assertEqual("use".upper(),"USE")
    def test_split(self):
        s = 'hello world'
        with self.assertRaises(TypeError):
            s.split(2)
class X():
    pass
class TestX(unittest.TestCase):
    def test_x(self):
        self.assertIsNot(X(),X())


# 4. unnittest main() 主要測試
if __name__ == "__main__":
    unittest.main(verbosity=2)

"""
A() != A()
[1] == [1]
{"A":1} == {"A":1}
type(1)==type(2)
"""

