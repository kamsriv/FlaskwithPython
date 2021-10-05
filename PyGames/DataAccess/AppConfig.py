from typing import Any
import yaml
from DTO import ConfigDTO as cfg

class AppConfig(object):
    __cfgstr : str = ""
    def __init__(self):
        with open("docs/config.yml","r") as ymlfile:
            self.__cfgstr = yaml.load(ymlfile)

    def GetConfig(self) -> cfg.ConfigDTO :
        objConfig = cfg.ConfigDTO(connectionstr = self.__cfgstr["connectionstr"],
                                  temppath = self.__cfgstr["temppath"],
                                  AppInfo = self.__cfgstr["AppInfo"])
        return objConfig