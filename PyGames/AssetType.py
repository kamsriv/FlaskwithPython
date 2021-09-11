import typing
import GetDBInfo
#from flask import Flask

#from flask_restful import Resource, Api
#app = Flask(__name__)
#api = Api(app)

##Async programming https://docs.microsoft.com/en-us/archive/msdn-magazine/2014/october/async-programming-introduction-to-async-await-on-asp-net
class AssetTypeDTO():
    def __init__(self, *args):
        self.Name = args[0][1] #instance variables
        self.Type = args[0][2]

##Instance variables are for data unique to each instance and class variables are for attributes and methods shared by all instances of the class.
class AssetType(GetDBInfo.GetDBInfo):
    IsActive = 1 #class variables
    AssetTypeID = 0
    cursor = None
    def __init__(self, name=None, type=None) -> None :
        super().__init__("")
        self.__Name = name
        self.__Type = type
    
    #def __del__(self) -> None:
    #    if self.cursor != None:
    #        self.cursor.close()

    def createAssetType(self) -> int:
        try:
            objCon = self.getcon()
            self.cursor = objCon.execute("USP_CREATEASSETTYPE ?,?",self.__Name,self.__Type)
            self.cursor.commit()
            return self.cursor.rowcount
        except Exception as e:
            print(e) #what will happen if cursor was not initialized and got exception.//Todo
        finally:
            objCon.close()
    def updateAssetType(self) -> int:
        try:
            objCon = self.getcon()
            sql:str = "{call USP_UPDATEASSETTYPE(@TYPEID=?, @NAME=?, @CLASSIFICATION=?, @ISACTIVE=?)}"
            self.cursor = objCon.execute(sql,self.AssetTypeID,self.__Name,self.__Type,self.IsActive)
            self.cursor.commit()
            return self.cursor.rowcount
        except Exception as e:
            print(e)
        finally:
            objCon.close()

    async def getAssetType(self, typeId: int = None) -> list:
        objAssetTypes = []
        try:
            objCon = self.getcon()
            self.cursor = objCon.execute("USP_GETASSETTYPES",str(typeId)) #For select queries use the SET NOCOUNT ON

            row = self.cursor.fetchone()
            for row in self.cursor:
                dto = [elem for elem in row]
                objAssetTypes.append(AssetTypeDTO(dto))
                
            return objAssetTypes
        except Exception as e:
            print(e)
        finally:
            objCon.close()

    def getAssetTypes(self, typeId: int = None) -> list:
        try:
            objCon = self.getcon()
            sql:str = "{call USP_GETASSETTYPES(@ASSETTYPEID=?)}"
            self.cursor = objCon.execute(sql,typeId) #For select queries use the SET NOCOUNT ON
            retVal:dict = None
            #https://stackoverflow.com/questions/16519385/output-pyodbc-cursor-results-as-python-dictionary
            #To convert a row in to dictionary. We can take columns from cursor_description and then zip with the results 
            retVal = [dict(zip([t[0] for t in row.cursor_description], row))for row in self.cursor.fetchall()]
            return retVal
        except Exception as e:
            print(e)
        finally:
            objCon.close()