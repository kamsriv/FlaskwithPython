from sqlalchemy import Column, String, Integer, Date, Boolean, ForeignKey
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class AssetsDO(Base):
    __tablename__ = 'Asset'
    AssetID: int = Column(Integer, primary_key=True, autoincrement=True)
    AssetType: int = Column(Integer, ForeignKey("AssetType.TypeID"), nullable=False)
    Description: str = Column(String(100), nullable=False)
    AssignedTo: str = Column(String(50), nullable=False)
    SerialNo: str = Column(String(100), nullable=False)
    AssginedOn: Date = Column(Date, nullable=False)
    CreatedBy: str = Column(String(50), nullable=False)
    CreatedOn: Date = Column(Date, nullable=False)
    Warrenty: int = Column(Integer, nullable=False)
    Location: str = Column(String(100), nullable=False)
    Remarks: str = Column(String(500), nullable=False)
    InvoiceNumber: str = Column(String(50), ForeignKey("Invoice.InvoiceNumber"), nullable=False)
    AssetCondition: str = Column(String(100), nullable=False)
    AttachmentID: int = Column(Integer, ForeignKey("Attachments.AttachmentID"), nullable=True)
    Movable: Boolean = Column(Boolean, default=True)