from typing import Any
from DataAccess.GetDBInfo import GetDBInfo
from datetime import date
from DTO.InvoiceDTO import InvoiceDTO
from DO.InvoiceDO import InvoiceDO
from DO.AttachmentsDO import AttachmentsDO
from BusinessLogic.Attachments import Attachments
from sqlalchemy.orm import Session
from sqlalchemy.sql import text

class Invoice(GetDBInfo):
    session: Session = None

    #def GetSession(self) -> Session:
    #    if self.session is None: 
    #        self.session: Session = Session(bind = self.getcon())
    #    return self.session

    def CreateInvoice(self, objInvoice: InvoiceDO, objAttachment: AttachmentsDO ) -> int:
        Sess: Session = self.getSession()
        try:
            #create the attachment record for this invoice.
            #Attachments
            att: Attachments = Attachments()
            objInvoice.AttachmentID = att.CreateAttachment(Sess, objAttachment)
            
            Sess.add(objInvoice)
            Sess.flush()
            Sess.commit()
            return objInvoice.InvoiceNumber
        except Exception as ex:
            print(ex)
            Sess.rollback()
        finally:
            pass

    def GetInvoice(self, invID: int = None) -> list:
        objInvoices = []
        try:
            Ses: Session = self.GetSession()
            condition: text = text('1=1' if invID is None else "InvoiceNumber = "+str(invID))          
            objInvoices = [InvoiceDTO(u.__dict__) for u in Ses.query(InvoiceDO).filter(condition)]
            
            return retVal
        except Exception as ex:
            print(ex)
        finally:
            pass