Class Workshop.Data.Person Extends (%Persistent, %Populate)
{

Property FirstName As %String(MAXLEN = 255, POPSPEC = "FirstName()");

Property LastName As %String(MAXLEN = 500, POPSPEC = "LastName()");

Property DOB As %Date(POPSPEC = "Date()");

Property HomeAddress As Address;

/// Method implemented in ObjectScript
Method SayMyName() As %Integer
{
    write !,"Hi, my name is "_..FirstName_" "_..LastName,!
    quit 1
}

/// Method implemented in Python
Method SayMyNamePython() As %Integer [ Language = python ]
{
    print('Hi, in Python my name is also {} {}'.format(self.FirstName, self.LastName))
    return 1
}

Storage Default
{
<Data name="PersonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FirstName</Value>
</Value>
<Value name="3">
<Value>LastName</Value>
</Value>
<Value name="4">
<Value>DOB</Value>
</Value>
<Value name="5">
<Value>HomeAddress</Value>
</Value>
</Data>
<DataLocation>^Workshop.Data.PersonD</DataLocation>
<DefaultData>PersonDefaultData</DefaultData>
<IdLocation>^Workshop.Data.PersonD</IdLocation>
<IndexLocation>^Workshop.Data.PersonI</IndexLocation>
<StreamLocation>^Workshop.Data.PersonS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
