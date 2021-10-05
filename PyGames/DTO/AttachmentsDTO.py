from typing import Any

class AttachmentsDTO(object):
    def __init__(self,*args):
        kargs: dict = dict(args[0])
        self.Description:str = kargs.get("Description")
        self.Attachment:bytearray = kargs("Attachment")