import types
import sys
import pyodbc
class GetDBInfo():
    """description of class"""
    def __init__(self, constr=""):
        self.__conValues = {"Provider":"{ODBC Driver 17 for SQL Server}",
                        "Persist Security Info":False,
                        "User":"sa",
                        "InitialCatalog":"AssetManager",
                        "DataSource":"localhost\sqlexpress"}
        self.cn = None
        if constr.strip() != "": #check for nothing instead of empty //error assettype constructor super.
            self.conStr =  constr #use ternary operator to assign default values if no constr provided
        else:
            self.conStr = "Driver="+self.__conValues["Provider"]+";server="+self.__conValues["DataSource"]+";Database="+self.__conValues["InitialCatalog"]+";Trusted_Connection=Yes;"
    def __del__(self):
        del self.cn
    def getcon(self) -> pyodbc.Connection:
           try:
               cn= pyodbc.connect(self.conStr)
               return cn
           except Exception as e:
               print(e)     
    def getRows(self):
        try:
           objCon = self.getcon() #get the connection
           cursor = objCon.cursor() #open cursor
           cursor.execute("select * from sys.tables") #Execute the query
           row  = cursor.fetchone() #Row is a tuple
           while row:
               print(row[0])
               row = cursor.fetchone()
           #for r in row:
           #   print(r)    
           return 1
        except Exception as e:
           print(e)
        finally:
           cursor.close()
           objCon.close()
    