import unittest
import PyGames
import inEqual
import GetDBInfo
import AssetType
import Assets
import pyodbc
import Invoice
from datetime import date

class Test_pyGamesFact(unittest.TestCase):
    def test_fibo(self):
        self.assertEquals(PyGames.pg.fibo(9),34)
        #self.fail("Not implemented")
    def test_revNum(self):
        self.assertEqual(PyGames.pg.reverseNum(416),614)

class Test_pyGamesFib(unittest.TestCase):
    def test_fact(self):
        self.assertEqual(PyGames.pg.fact(1),1)
    def test_Ineq(self):
       inEqual.Test_inEqual.test_A(self)

class Test_SqlConnection(unittest.TestCase):
     def test_sqlConn(self):
         dbObj = GetDBInfo.GetDBInfo()
         self.assertEqual(type(dbObj.getcon()),pyodbc.Connection)

class Test_GetAvailableRows(unittest.TestCase):
     def test_rowsAvail(self):
         dbObj = GetDBInfo.GetDBInfo()
         self.assertEqual(dbObj.getRows(),1)

class Test_CreateAssetType(unittest.TestCase):
     def test_procCall(self):
         dbObj = AssetType.AssetType("SFS Modules","Hardware")
         self.assertEqual(dbObj.createAssetType(),1)

class Test_AssetTypeUpdate(unittest.TestCase):
    def test_procUpdate(self):
        dbObj = AssetType.AssetType("Meraki","Hardware")
        dbObj.AssetTypeID = 12
        dbObj.IsActive = 0
        self.assertEqual(dbObj.updateAssetType(),1)

class Test_GetAssetTypes(unittest.TestCase):
    async def test_getAssetTypes(self):
        dbObj = AssetType.AssetType()
        result = await dbObj.getAssetType()
        self.assertEqual(result,[AssetType.AssetTypeDTO])
    def test_getAssetTypes_1(self):
        dbObj = AssetType.AssetType()
        result = dbObj.getAssetTypes()
        self.assertEqual(len(result),10)

class Test_CreateInvoice(unittest.TestCase):
    def test_createInvoice(self):
       
        with open("c:\\temp\\AL_2100.pdf",'rb') as file_t:
           blob_data = file_t.read()
        ##Example how we can combine two different tuples into a single dictionary object
        props = ("INVOICENUMBER","VENDOR", "ORDERDATE", "INVOICEDATE", "QUANTITY", "RATE", "TAXAMOUNT", "INVOICEAMOUNT", "DESCRIPTION", "FLEBYTES")
        vals = ("2021-1234","Leon Technologies", date.today(),date.today(),3,200,10,210,"Computers Dell Latitude",blob_data)
        dbObj = Invoice.Invoice(dict(zip(props,vals)))
        self.assertEqual(dbObj.CreateInvoice(),1)

class Test_CreateAsset(unittest.TestCase):
    def test_createAsset(self):
        dbObj = Assets.Assets(ASSETTYPE=2,DESCRIPTION="Dell Latitude 5410",ASSIGNEDTO="",SERIALNO="",ASSIGNEDON=date.today() ,CREATEDBY="SYSTEM",CREATEDON=date.today(),WARRENTY=0,LOCATION="HYDERABAD",REMARKS="",INVOICENUMBER="2021-1234",ASSETCONDITION="NEW",MOVABLE=1)
        self.assertEqual (dbObj.CreateAsset(),1)

class Test_GetAsset(unittest.TestCase):
    def test_getAsset(self):
        dbObj = Assets.Assets()
        self.assertEqual(len(dbObj.GetAssets(2)),1)
        
if __name__ == '__main__':
    unittest.main()
