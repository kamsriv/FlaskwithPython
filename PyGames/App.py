import DO
from BusinessLogic import Assets as Ast, AssetType as AsType, Invoice as Inv, Attachments as Att
from DTO.AssetsDTO import AssetsDTO, AssetsListDTO
from typing import Optional
from fastapi import FastAPI, Form 
import uvicorn
import json
#from flasgger import Swagger
#from flask_rest_jsonapi import Api

#enabling swagger.
##https://www.aurigait.com/blog/api-documentation-with-swagger-in-flask/
#https://pypi.org/project/flask-swagger/

app = FastAPI()
##app.json_encoder = utility.MyJSONEncoder #For Decimal number serialization overridden the Decimal object.
#swagger = Swagger(app)


@app.get("/")
def testAPI():
    return "<h2>Welcome to IT Asset Management</h2>"

#Assets
#@swag_from("/docs/Assets.yml")
##https://pythontic.com/serialization/json/introduction
@app.get("/assets")
async def GetAssets():
    objAsset: Ast.Assets = Ast.Assets()
    AssetList: AssetsListDTO = objAsset.GetAssets()
    retVal =json.dumps(AssetList.assetList, default=lambda o: o.__dict__, indent=4)
    return retVal

#Asset types
#optional path parameter we can use or request.args.get('') request.form.get('')
@app.get("/atypes/{atypeid}")
def GetAssetTypes(aid: Optional[int] = None):
    objAtype: AsType.AssetType = AsType.AssetType()
    retVal = objAtype.getAssetTypes(aid)
    return {'results':retVal}
    
@app.post("/atypes")
async def CreateAssetType():
    objAtype: AsType.AssetType = AsType.AssetType()
    modal: AsType.AssetTypeDO = AsType.AssetTypeDO()
    modal.Name = request.form.get('name')
    modal.Classification = request.form.get('descr')
    return {'results':f"AssetType created successfully with id : {str(objAtype.createAssetType(modal))}"}

@app.post("/atypes/{atypeid}")
async def UpdateAssetType(atypeid:int, name:str = Form(...), classif:str = Form(...), isActive:bool = Form(...)):
     objAtype: AsType.AssetType = AsType.AssetType()
     
     modal: AsType.AssetTypeDO = objAtype.getAssetTypeDO(atypeid)
     modal.Name = name
     modal.Classification = classif
     modal.IsActive = isActive
     return {'results':objAtype.updateAssetType(modal)}
    
#Invoices
@app.post("/invoice")
#@app.route("/invoice/<invId>",methods=['Get'])
async def GetInvoices():
    invId = request.args.get('invId')
    if invId is not None:
        dbObj = Invoice.Invoice({"INVOICENUMBER":invId})
        return {'result':dbObj.GetInvoice()}
    else:
        return {'result':'invoice id is'+str(invId)}

#api = Api()
#api.route(class1.testAPI, 'assets', '/assets')

if __name__ == "__main__":
    uvicorn.run(app,host="127.10.0.1",port=5000)