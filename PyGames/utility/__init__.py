"""
import decimal
import flask.json
class MyJSONEncoder(flask.json.JSONEncoder):
    #https://stackoverflow.com/questions/24706951/how-to-convert-all-decimals-in-a-python-data-structure-to-string
    def default(self, obj):
        if isinstance(obj, decimal.Decimal):
             Convert decimal instances to strings.
            return str(obj)
        return super(MyJSONEncoder, self).default(obj)
"""