import AssetType
import Assets
import Invoice
import typing
from flask import Flask,request
from marshmallow_jsonapi.flask import Schema
from marshmallow_jsonapi import fields
from flask_rest_jsonapi import Api


##Enabling documentation using Swagger 
#https://pypi.org/project/flask-swagger/

app = Flask(__name__)

class class1(object):
    
    
    @app.route("/",methods = ['Get'])
    def testAPI():
        return "<h2>Welcome to IT Asset Management</h2>"



    #Assets
    @app.route("/assets",methods = ['Get'])
    def GetAssets():
        dbObj = Assets.Assets()
        retVal = dbObj.GetAssets()
        return {'results':retVal}

    #Asset types
    #optional path parameter we can use or request.args.get('') request.form.get('')
    @app.route("/atypes",defaults={'atid':None})
    @app.route("/atypes/<atid>",methods=['Get'])
    def GetAssetTypes(atid=None):
        dbObj = AssetType.AssetType()
        retVal = dbObj.getAssetTypes(atid)
        return {'results':retVal}
    
    @app.route("/atypes", methods=['Post'])
    def CreateAssetType():
        dbObj = AssetType.AssetType(request.form.get('name'),request.form.get('descr'))
        return {'results':str(dbObj.createAssetType()) + " assettype created successfully"}

    @app.route("/atypes/<atypeid>", methods=['Post'])
    def UpdateAssetType(atypeid:int):
        dbObj = AssetType.AssetType(request.form.get('name'),request.form.get('descr'))
        dbObj.AssetTypeID = atypeid
        return {'results':str(dbObj.updateAssetType()) + " assettype updated successfully"}
    
    #Invoices
    @app.route("/invoice",defaults={'invId':None})
    @app.route("/invoice/<invId>",methods=['Get'])
    def GetInvoices(invId=None):
        if invId is not None:
            dbObj = Invoice.Invoice({"INVOICENUMBER":invId})
            return {'result':dbObj.GetInvoice()}
        else:
            return {'result':'invoice id is'+str(invId)}

api = Api()
#api.route(class1.testAPI, 'assets', '/assets')

if __name__ == '__main__':
    app.run()
