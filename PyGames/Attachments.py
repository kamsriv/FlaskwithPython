import typing
import GetDBInfo

class Invoice(GetDBInfo.GetDBInfo):
    objCon = None
    objCur = None
    def __init__(self,**kwargs)->None:
        super().__init__("")
        self.DESCRIPTION:str = kwargs["Description"]
        self.ATTACHMENT:bytearray = kwargs["Attachment"]

    
    