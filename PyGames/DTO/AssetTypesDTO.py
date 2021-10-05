from typing import Any

class AssetTypesDTO():
    def __init__(self, *args) -> None:
        kwargs:dict = dict(args[0])
        self.Name: str = kwargs.get("Name") #instance variables
        self.Type: str = kwargs.get("Classification")
        