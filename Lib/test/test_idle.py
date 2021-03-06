import unittest
from test import test_support as support
from test.test_support import import_module

# Skip test if _thread or _tkinter wasn't built or idlelib was deleted.
import_module('threading')  # imported by idlelib.PyShell, imports _thread
tk = import_module('Tkinter')  # imports _tkinter
idletest = import_module('idlelib.idle_test')

# Without test_main present, regrtest.runtest_inner (line1219) calls
# unittest.TestLoader().loadTestsFromModule(this_module) which calls
# load_tests() if it finds it. (Unittest.main does the same.)
load_tests = idletest.load_tests

# pre-3.3 regrtest does not support the load_tests protocol. use test_main
def test_main():
    support.run_unittest(unittest.TestLoader().loadTestsFromModule(idletest))

if __name__ == '__main__':
    unittest.main(verbosity=2, exit=False)
