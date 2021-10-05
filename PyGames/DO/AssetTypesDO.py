from sqlalchemy import Integer, Column, String, Boolean
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class AssetTypeDO(Base):
    __tablename__ = 'AssetType'
    TypeId: int = Column(Integer, primary_key=True,autoincrement=True)
    Name: str = Column(String(50))
    Classification: str = Column(String(50))
    IsActive: bool = Column(Boolean, default=1)
