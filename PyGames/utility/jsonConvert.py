import json

class jsonConvert(object):
    @staticmethod
    def Translate(self, o):
        try:
           iterable = iter(o)
        except TypeError:
           pass
        else:
           return list(iterable)
        # Let the base class default method raise the TypeError
        return json.JSONEncoder.default(self, o)

    #def serialize(o):
    #    if isinstance(o, dict):
    #        return {k:serialize(v) for k,v in o.items()}
    #    if isinstance(o, list):
    #        return [serialize(e) for e in o]
    #    if isinstance(o, bytes):
    #        return o.decode("utf-8")
    #    return o