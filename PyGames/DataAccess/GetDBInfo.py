import sys
import pyodbc
import urllib.parse
from typing import Any
from DataAccess.AppConfig import AppConfig
from sqlalchemy import create_engine, MetaData, Table, engine
from sqlalchemy.orm import mapper,sessionmaker, Session

class GetDBInfo():
    """description of class"""
    def __init__(self, constr=""):
        
        config = AppConfig()
        con = config.GetConfig()
        self.cn = None
        self.sess = None
        self.dialect = con.dialect
        self.conStr = urllib.parse.quote_plus(r'DRIVER={'+con.driver+'};SERVER='+ con.server +';DATABASE='+ con.dbName +';uid='+ con.user+';pwd='+con.pwd)
        
    def __del__(self):
        del self.cn

    def getcon(self) -> engine:
           try:
               if self.cn is None:
                self.cn = create_engine(f"{self.dialect}:///?odbc_connect=%s" % self.conStr)
               return self.cn
           except Exception as e:
               print(e)    
    
    def getSession(self) -> Session:
        try:
            if self.sess is None:
                self.sess = Session(bind=self.getcon())
            return self.sess
        except Exception as e:
            print(e)
            
    def getRows(self):
        try:
            objEngine = self.getcon() #get the connection
            metadata = MetaData(bind=objEngine)
            my_table = Table('AssetType', metadata, autoload = True, autoload_with = objEngine)
            
            Session = sessionmaker(objEngine)
            mysession = Session()
            resultlist = mysession.query(my_table).all()
            rows: int = len(resultlist)
            print(rows)
            mysession.close()

            return 1
        except Exception as e:
           print(e)