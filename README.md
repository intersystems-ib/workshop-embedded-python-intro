

https://learning.intersystems.com/course/view.php?id=1824

https://docs.intersystems.com/irisforhealth20212/csp/docbook/DocBook.UI.Page.cls?KEY=PAGE_epython

https://docs.intersystems.com/irisforhealth20212/csp/docbook/DocBook.UI.Page.cls?KEY=AEPYTHON


# Setup
Run the container we will use as our InterSystems IRIS instance:
```
docker-compose up -d
```

You can log in the [Management Portal](http://localhost:52773/csp/sys/UtilHome.csp) using `superuser/SYS`

Now you can explore different ways to execute Embedded Python in InterSystems IRIS:

# (a). From the Python Shell
Open [WebTerminal](http://localhost:52773/terminal/) and type the following:

## (a.1) Run a class method
```
WORKSHOP > do ##class(%SYS.Python).Shell()

Python 3.8.10 (default, Sep 28 2021, 16:10:42) 
[GCC 9.3.0] on linuxType quit() or Ctrl-D to exit this shell.
>>> print('Hellow world!')
Hellow world!
>>> irisVersion = iris.cls('%SYSTEM.Version').GetVersion()
>>> print(irisVersion)
IRIS for UNIX (Ubuntu Server LTS for x86-64 Containers) 2021.2 (Build 617U) Thu Dec 9 2021 15:00:18 UTC
>>> 
```

## (b). Open a object and display some property
Have a look at [Workshop/Data/Person.cls](src/Workshop/Data/Person.cls) and then type the following in the Python shell:

```
>>> person = iris.cls('Workshop.Data.Person')._OpenId(1)
>>> vars(person)
{'%%OID': '\x04\x0119\x16\x01Workshop.Data.Person', '%Concurrency': 1, 'LastName': 'Jackson', 'HomeAddress': <iris.Workshop.Data.Address object at 0x7f75d3223e70>, 'FirstName': 'Phil', 'DOB': 39069}
>>> print(person.FirstName)
Phil
>>> person.SayMyName()
Hi, my name is Phil Jackson
```


