from typing import Any

class ConfigDTO(object):
    def __init__(self, **kargs):
        
        convars: dict = dict(kargs["connectionstr"])
        tempvars: dict = dict(kargs["temppath"])
        appvars: dict = dict(kargs["AppInfo"])

        self.dialect: str = convars.get("dialect")
        self.server: str =  convars.get("server")
        self.dbName: str = convars.get("database")
        self.user: str = convars.get("username")
        self.pwd: str = convars.get("password")
        self.driver: str = convars.get("driver")

        self.temppath: str = tempvars.get("location")
        self.AppName: str = appvars.get("Name")
        self.Version: str = appvars.get("Version")
        super().__init__()