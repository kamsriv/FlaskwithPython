from typing import Any
from DataAccess.GetDBInfo import GetDBInfo
from datetime import datetime
from utility.UserNotification import UserNotify
from DO.AssetsDO import AssetsDO
from DTO.AssetsDTO import AssetsDTO, AssetsListDTO
from sqlalchemy.orm import Session
from sqlalchemy.sql import text

class Assets(GetDBInfo):
    
    def CreateAsset(self,objAsset:AssetsDO)->UserNotify:
        Ses: Session = self.getSession()
        Notify: UserNotify = UserNotify()
        try:
            Ses.add(objAsset)
            #do the validation whether attachment is created or not
            Ses.commit()
            Ses.flush()
            Notify.setSuccessMsg(f"Asset created successfully with #{objAsset.AssetID}")
        except Exception as ex:
            print(ex)
            Notify.setErrorMsg("Error in creating the Asset")
            Ses.rollback()
        finally:
            Ses.close()
        return Notify
    
    def GetAssets(self, assetId=None) -> AssetsListDTO:
        objAssets:AssetsListDTO = AssetsListDTO()
        Ses: Session = self.getSession()
        try:
            condition: text = text('1=1' if assetId is None else "AssetID = "+str(assetId))          
            #for u in Ses.query(AssetsDO).filter(condition):
            #    objAssets.assetList.append(AssetsDTO(u.__dict__) )
            
            objAssets.assetList = [AssetsDTO(u.__dict__) for u in  Ses.query(AssetsDO).filter(condition)]
            objAssets.setSuccessMsg("Assets loaded successfully")
        except Exception as ex:
            print(ex)
            objAssets.setErrorMsg("Error while loading Assets")
        finally:
            Ses.close()
        return objAssets