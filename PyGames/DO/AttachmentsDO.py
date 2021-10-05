from sqlalchemy import Column, String, Integer, Date, Boolean, ForeignKey, DECIMAL, ForeignKey, VARBINARY
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class AttachmentsDO(Base):
    __tablename__ = "Attachments"
    AttachmentID: Integer = Column(Integer, primary_key=True, nullable=False)
    Description: String = Column(String(100), nullable=False)
    Attachment:VARBINARY = Column(VARBINARY, nullable=False)