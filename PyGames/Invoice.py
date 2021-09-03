import typing
import GetDBInfo
from datetime import date

class Invoice(GetDBInfo.GetDBInfo):
    
    objCon = None
    objCur = None
    def __init__(self,*args):
        super().__init__("")
        kwargs:dict = dict(args[0])
        self.__INVOICENUMBER :str =kwargs.get('INVOICENUMBER')
        self.__VENDOR :str =kwargs.get('VENDOR')
        self.__ORDERDATE :date =kwargs.get("ORDERDATE")
        self.__INVOICEDATE: date =kwargs.get("INVOICEDATE")
        self.__QUANTITY:int =kwargs.get("QUANTITY")
        self.__RATE:int =kwargs.get("RATE")
        self.__TAXAMOUNT:int =kwargs.get("TAXAMOUNT")
        self.__INVOICEAMOUNT:int = kwargs.get("INVOICEAMOUNT")
        self.__DESCRIPTION:str = kwargs.get("DESCRIPTION")
        self.__FLEBYTES:bytes = kwargs.get("FLEBYTES")
        
    def CreateInvoice(self):
        try:
            objCon = self.getcon()
            objCur = objCon.execute("{call [USP_CREATEINVOICE](?,?,?,?,?,?,?,?,?,?)}",self.__INVOICENUMBER,self.__VENDOR,self.__ORDERDATE,self.__INVOICEDATE,self.__QUANTITY,self.__RATE,self.__TAXAMOUNT,self.__INVOICEAMOUNT,self.__DESCRIPTION,self.__FLEBYTES)
            objCur.commit()
            return objCur.rowcount
        except Exception as ex:
            print(ex)
        finally:
            objCon.close()
    def GetInvoice(self) -> list:
        try:
            objCon = self.getcon()
            objCur = objCon.execute("{call USP_GETINVOICE(@INVOICENUMBER=?)}",self.__INVOICENUMBER)
            retVal = [dict(zip([t[0] for t in row.cursor_description], row))for row in objCur.fetchall()]
            return retVal
        except Exception as ex:
            print(ex)
        finally:
            objCon.close()