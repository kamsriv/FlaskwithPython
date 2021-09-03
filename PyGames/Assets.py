import types
import GetDBInfo
from datetime import datetime

class Assets(GetDBInfo.GetDBInfo):
    objCon = None
    objCur = None
    def __init__(self,**kwargs):        
        super().__init__(constr="")
        if kwargs:
            self.__ASSETTYPE:int = kwargs["ASSETTYPE"]
            self.__DESCRIPTION:str = kwargs["DESCRIPTION"]
            self.__ASSIGNEDTO:str = kwargs["ASSIGNEDTO"]
            self.__SERIALNO:str = kwargs["SERIALNO"]
            self.__ASSIGNEDON:datetime = kwargs["ASSIGNEDON"]
            self.__CREATEDBY:str = kwargs["CREATEDBY"]
            self.__CREATEDON:datetime = kwargs["CREATEDON"]
            self.__WARRENTY:int = kwargs["WARRENTY"]
            self.__LOCATION:str = kwargs["LOCATION"]
            self.__REMARKS:str = kwargs["REMARKS"]
            self.__INVOICENUMBER:str = kwargs["INVOICENUMBER"]
            self.__ASSETCONDITION:str = kwargs["ASSETCONDITION"]
            self.__MOVABLE:bool = kwargs["MOVABLE"]

    def CreateAsset(self)->int:
        try:
            objCon = self.getcon()
            #do the validation whether attachment is created or not

            sql = "{call USP_CREATEASSET(@ASSETTYPE = ?,@DESCRIPTION =?,@ASSIGNEDTO=?,@SERIALNO = ?,@ASSIGNEDON = ?,@CREATEDBY = ?,@CREATEDON = ?,@WARRENTY = ?,@LOCATION = ?,@REMARKS = ?,@INVOICENUMBER = ?,@ASSETCONDITION = ?,@MOVABLE= ?)}"
            objCur = objCon.execute(sql,self.__ASSETTYPE,self.__DESCRIPTION,self.__ASSIGNEDTO,self.__SERIALNO,self.__ASSIGNEDON,self.__CREATEDBY
                                    ,self.__CREATEDON,self.__WARRENTY,self.__LOCATION,self.__REMARKS,self.__INVOICENUMBER,self.__ASSETCONDITION,self.__MOVABLE)
            
            objCur.commit()
            if objCur.rowcount > 0:
                retVal = 1
            else:
                row = objCur.fetchone()
                if row[3] == "USP_CREATEASSET":
                    print("Error while creating Asset : "+row[5])
                    retVal = 0
            
            return retVal
        except Exception as ex:
            print(ex)
        finally:
            objCon.close()
    
    def GetAssets(self, assetId=None) -> list:
        try:
            objCon = self.getcon()
            objAssets = []
            sql: str = "{call USP_GETASSETS (@ASSETID=?)}"
            objCur = objCon.execute(sql,assetId)
            for row in objCur:
                retVal  = [elem for elem in row]
                objAssets.append(retVal)
            return objAssets
        except Exception as ex:
            print(ex)
        finally:
            objCon.close()

if __name__ == '__main__':
    app.run(debug = True)