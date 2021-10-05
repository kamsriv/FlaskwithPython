from sqlalchemy import Column, String, Integer, Date, Boolean, ForeignKey, DECIMAL, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from DO.AttachmentsDO import AttachmentsDO

Base = declarative_base()

class InvoiceDO(Base):
    __tablename__ = "Invoice"
    InvoiceNumber: String = Column(String(50), primary_key=True,nullable=False) 
    Vendor: String = Column(String(100), nullable=False)
    OrderDate: Date = Column(Date, nullable=False)
    InvoiceDate: Date = Column(Date, nullable=False)
    Quantity: Integer = Column(Integer, nullable=False)
    Rate: DECIMAL = Column(DECIMAL, nullable=False)
    TaxAmount: DECIMAL = Column(DECIMAL, nullable=False)
    InvoiceAmount: DECIMAL = Column(DECIMAL, nullable=False)
    AttachmentID: Integer = Column(Integer, ForeignKey(AttachmentsDO.AttachmentID),nullable=True)