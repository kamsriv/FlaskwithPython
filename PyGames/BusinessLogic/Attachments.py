from typing import  Any
from DataAccess.GetDBInfo import GetDBInfo
from DO.AttachmentsDO import AttachmentsDO
from DTO.AttachmentsDTO import AttachmentsDTO
from sqlalchemy.orm import Session
from sqlalchemy.sql import text

class Attachments(GetDBInfo):
    session: Session = None

    #def GetSession(self) -> Session:
    #    if self.session is None: 
    #        self.session: Session = Session(bind = self.getcon())
    #    return self.session

    def CreateAttachment(self,sess:Session, objAttachment:AttachmentsDO) -> int:
        try:
            sess.add(objAttachment)
            sess.flush()
            return objAttachment.AttachmentID
        except Exception as ex:
            print(ex)
        finally:
            pass

    def GetAttachment(self,sess:Session, attID:str = None) -> AttachmentsDTO:
        objRetVal: AttachmentsDTO 
        try:
            condition: text = text('1=1' if attID is None else "AttachmentID = '{}'".format(attID))          
            objRetVal = [AttachmentsDTO(u.__dict__) for u in sess.query(AttachmentsDO).filter(condition)]

            return objRetVal
        except Exception as ex:
            print(ex)