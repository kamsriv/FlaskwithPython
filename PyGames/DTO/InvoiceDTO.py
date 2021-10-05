from typing import Any

class InvoiceDTO(object):
    def __init__(self, *args):
        kargs: dict = dict(args[0])
        self.INVOICENUMBER :str =kwargs.get('InvoiceNumber')
        self.VENDOR :str =kwargs.get('Vendor')
        self.ORDERDATE :date =kwargs.get("OrderDate")
        self.INVOICEDATE: date =kwargs.get("InvoiceDate")
        self.QUANTITY: int =kwargs.get("Quantity")
        self.RATE: float =kwargs.get("Rate")
        self.TAXAMOUNT: float =kwargs.get("TaxAmount")
        self.INVOICEAMOUNT: float = kwargs.get("InvoiceAmount")
        self.AttachmentID: int = kwargs.get("AttachmentID")
        #self.DESCRIPTION:str = kwargs.get("DESCRIPTION")
        #self.FLEBYTES:bytes = kwargs.get("FLEBYTES")

