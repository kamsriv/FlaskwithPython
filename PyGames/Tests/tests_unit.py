import unittest
from DataAccess import AppConfig as config

class ConfigTest(unittest.TestCase):
    def test_config(self)->None:
        objConfig = config.AppConfig()
        strCon = objConfig.GetConfig()
        print(strCon.server)
        self.assertGreaterEqual(len(strCon.server),10)

    
if __name__ == "__main__":
    unittest.main()

