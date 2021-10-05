from typing import Any


class UserNotify:
   def __init__(self,**kwargs):
        self.isSuccess:bool = False if kwargs.get("issuccess") is None else kwargs.get("issuccess")
        self.Message:str = "" if kwargs.get("message") is None else kwargs.get("message")

   def setSuccessMsg(self,msg:str):
       self.isSuccess: bool = True
       self.Message: str = msg

   def setErrorMsg(self,msg:str):
       self.isSuccess: bool = False
       self.Message: str = msg