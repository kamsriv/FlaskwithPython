from typing import Any
from deprecated import deprecated
from DataAccess import GetDBInfo
from DTO.AssetTypesDTO import AssetTypesDTO
from DO.AssetTypesDO import AssetTypeDO
from sqlalchemy.orm import Session
from sqlalchemy.sql import text, Select


##Async programming https://docs.microsoft.com/en-us/archive/msdn-magazine/2014/october/async-programming-introduction-to-async-await-on-asp-net
##https://lukeonpython.blog/2020/11/4-ways-of-mapping-value-object-in-sqlalchemy/ Mapping values
 

##Instance variables are for data unique to each instance and class variables are for attributes and methods shared by all instances of the class.
class AssetType(GetDBInfo.GetDBInfo):
    def createAssetType(self,objAssetType: AssetTypeDO) -> int:
        Ses: Session = self.getSession()
        try:
            Ses.add(objAssetType)
            Ses.flush()
            Ses.commit()
            return objAssetType.TypeId
        except Exception as e:
            print(e) #what will happen if cursor was not initialized and got exception.//Todo
            Ses.rollback()
        finally:
            Ses.close()

    def updateAssetType(self, objAssetType: AssetTypeDO) -> int:
        Ses: Session = self.getSession()
        try:
            Ses.merge(objAssetType, load=True)
            Ses.commit()
            return 1
        except Exception as e:
            print(e)
            Ses.rollback()
        finally:
            Ses.close()
    
    def getAssetTypeDO(self, typeID:int) -> AssetTypeDO:
        Ses:Session = self.getSession()
        try:
            ##Select(AssetTypeDO).where(AssetTypeDO.TypeId==typeID)

            objAsset: AssetTypeDO = Ses.query(AssetTypeDO).filter(text(f"TypeID={typeID}")).first()
            return objAsset
        except Exception as ex:
            print(ex)

    @deprecated
    async def getAssetType(self, typeId: int = None) -> list:
        objAssetTypes = []
        try:
            objCon = self.getcon()
            self.cursor = objCon.execute("USP_GETASSETTYPES",str(typeId)) #For select queries use the SET NOCOUNT ON

            row = self.cursor.fetchone()
            for row in self.cursor:
                dto = [elem for elem in row]
                objAssetTypes.append(AssetTypesDTO(dto))
                
            return objAssetTypes
        except Exception as e:
            print(e)
        finally:
            objCon.close()

    def getAssetTypes(self, typeId: int = None) -> list:
        Ses: Session = self.getSession()
        objAssetTypes = []
        try:
            ##https://stackoverflow.com/questions/17717877/convert-sqlalchemy-query-result-to-a-list-of-dicts
            condition: text = text('1=1' if typeId is None else "TypeID = "+str(typeId))
            objAssetTypes  = [AssetTypesDTO(u.__dict__) for u in Ses.query(AssetTypeDO).filter(condition)]
            return objAssetTypes
        except Exception as e:
            print(e)
        finally:
            Ses.close()