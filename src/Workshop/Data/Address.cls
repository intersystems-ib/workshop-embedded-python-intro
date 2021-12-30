Class Workshop.Data.Address Extends (%SerialObject, %Populate)
{

Property AddressLine1 As %String(MAXLEN = 80, POPSPEC = "Street()");

Property AddressLine2 As %String(MAXLEN = 80);

Property City As %String(MAXLEN = 80, POPSPEC = "City()");

Property State As %String(MAXLEN = 80, POPSPEC = "City()");

Property PostalCode As %String(MAXLEN = 5, POPSPEC = "USZip()");

Method Normalize(addr As %String) [ Language = python ]
{
    from scourgify import normalize_address_record
    normalized = normalize_address_record(addr)

    self.AddressLine1 = normalized['address_line_1']
    self.AddressLine2 = normalized['address_line_2']
    self.City = normalized['city']
    self.State = normalized['state']
    self.PostalCode = normalized['postal_code']
}

Storage Default
{
<Data name="AddressState">
<Value name="1">
<Value>AddressLine1</Value>
</Value>
<Value name="2">
<Value>AddressLine2</Value>
</Value>
<Value name="3">
<Value>City</Value>
</Value>
<Value name="4">
<Value>State</Value>
</Value>
<Value name="5">
<Value>PostalCode</Value>
</Value>
</Data>
<State>AddressState</State>
<StreamLocation>^Workshop.Data.AddressS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
