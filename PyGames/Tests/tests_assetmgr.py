import unittest
import PyGames
import pyodbc
import inEqual
import DTO
import sqlalchemy
from datetime import date
from DataAccess import GetDBInfo, AppConfig
from DO import AssetTypesDO, AssetsDO, AttachmentsDO, InvoiceDO
from BusinessLogic import AssetType, Assets, Attachments, Invoice

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

class Test_Configuration(unittest.TestCase):
    def test_config(self):
        objConfig = AppConfig.AppConfig()
        objCon:DTO.ConfigDTO = objConfig.GetConfig()
        self.assertGreaterEqual(len(objCon.server),10)

class Test_SqlConnection(unittest.TestCase):
     def test_sqlConn(self):
         dbObj = GetDBInfo.GetDBInfo()
         self.assertEqual(type(dbObj.getcon()), sqlalchemy.engine.Engine)

class Test_GetAvailableRows(unittest.TestCase):
     def test_rowsAvail(self):
         dbObj = GetDBInfo.GetDBInfo()
         self.assertEqual(dbObj.getRows(),1)

class Test_CreateAssetType(unittest.TestCase):
     def test_procCall(self):
         dbObj = AssetType.AssetType()
         objAsType: AssetTypesDO.AssetTypeDO = AssetTypesDO.AssetTypeDO()
         objAsType.Name = "Zoom Room Modules"
         objAsType.Classification =  "Hardware"
         self.assertGreaterEqual(dbObj.createAssetType(objAsType),1)

class Test_AssetTypeUpdate(unittest.TestCase):
    def test_procUpdate(self):
        dbObj = AssetType.AssetType()
        objAsType: AssetTypesDO.AssetTypeDO = dbObj.getAssetTypeDO(18)
        objAsType.Classification = "Software"
        objAsType.IsActive = 0
        self.assertEqual(dbObj.updateAssetType(objAsType),1)

class Test_GetAssetTypes(unittest.TestCase):
    async def test_getAssetTypes(self):
        dbObj = AssetType.AssetType()
        result = await dbObj.getAssetType()
        self.assertEqual(result,[AssetType.AssetTypeDTO])
    def test_getAssetTypes_1(self):
        dbObj = AssetType.AssetType()
        result = dbObj.getAssetTypes()
        self.assertEqual(type(result), type([]) )

class Test_CreateInvoice(unittest.TestCase):
    def test_createInvoice(self):
       
        with open("c:\\temp\\AL_2100.pdf",'rb') as file_t:
           blob_data = file_t.read()
        ##Example how we can combine two different tuples into a single dictionary object
        
        #props = ("INVOICENUMBER","VENDOR", "ORDERDATE", "INVOICEDATE", "QUANTITY", "RATE", "TAXAMOUNT", "INVOICEAMOUNT","AttachmentID")
        #vals = ("2021-1235","Leon Technologies", date.today(),date.today(),3,200,10,210,0)

        Att: AttachmentsDO.AttachmentsDO = AttachmentsDO.AttachmentsDO()
        Att.Description = "Computers Dell Latitude 5410"
        Att.Attachment = blob_data

        Inv: InvoiceDO.InvoiceDO = InvoiceDO.InvoiceDO()
        Inv.InvoiceAmount = 502
        Inv.InvoiceDate = date.today()
        Inv.InvoiceNumber = "2021-1236"
        Inv.OrderDate = date.today()
        Inv.Quantity = 5
        Inv.Rate = 100
        Inv.TaxAmount = 2
        Inv.Vendor = "Leon Technologies"

        dbObj = Invoice.Invoice()
        self.assertEqual(dbObj.CreateInvoice(Inv,Att ),1)

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
