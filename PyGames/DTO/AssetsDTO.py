from typing import Any
from datetime import datetime
from utility.UserNotification import UserNotify

class AssetsDTO():
    def __init__(self, *args):
        kargs: dict = dict(args[0])
        AssetID: int = kargs.get("AssetID")
        AssetType: int = kargs.get("AssetType")
        Description: str = kargs.get("Description")
        AssignedTo: str = kargs.get("AssignedTo")
        SerialNo: str = kargs.get("SerialNo")
        AssginedOn: datetime = kargs.get("AssginedOn")
        CreatedBy: str = kargs.get("CreatedBy")
        CreatedOn: datetime = kargs.get("CreatedOn")
        Warrenty: int = kargs.get("Warrenty")
        Location: str = kargs.get("Location")
        Remarks: str = kargs.get("Remarks")
        InvoiceNumber: str = kargs.get("InvoiceNumber")
        AssetCondition: str = kargs.get("AssetCondition")
        AttachmentID: int = kargs.get("AttachmentID")
        Movable: bool = kargs.get("Movable")

class AssetsListDTO(UserNotify):
    def __init__(self, **kwargs):
        self.assetList: list[AssetsDTO] = []
        super().__init__(**kwargs)


    